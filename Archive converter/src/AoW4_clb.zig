const std = @import("std");
const mem = std.mem;
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;
const hash = std.hash.RapidHash.hash;
const fd_t = std.posix.fd_t;

const CustomFS = @import("CustomFS.zig");
const CustomMem = @import("CustomMem.zig");
const ptrCast = CustomMem.ptrCast;
const alignPtrCast = CustomMem.alignPtrCast;
const allocInFixedBuffer = CustomMem.allocInFixedBuffer;
const allocInFixedBufferT = CustomMem.allocInFixedBufferT;
const readFromPtr = CustomMem.readFromPtr;
const memcpy = CustomMem.memcpy;
const memcpyDstAlign = CustomMem.memcpyDstAlign;
const ptrOnValue = CustomMem.ptrOnValue;
const GlobalState = @import("GlobalState.zig");
const Image = @import("Image.zig");
const lz4 = @import("lz4.zig");
const PageAllocator = @import("PageAllocator.zig");
const Tables = @import("Tables.zig");
const readTable = Tables.readTable;
const readTableNear = Tables.readTableNear;
const read_0x80Table = Tables.read_0x80Table;
const Table = Tables.Table;
const Vulkan = @import("Vulkan.zig");

pub const Archive = struct
{
    const Texture = struct
    {
//         name: [*]u8,
//         nameLen: u8,
        image: Image.Image,
    };
    const Mesh = struct
    {
//         name: [*]u8,
//         nameLen: u8,
        vertexFormat: [16]u8,
        verticesBuffer: [*]u8,
        verticesBufferSize: u32,
        vertexSize: u32,
        verticesCount: u16,
        indicesBuffer: [*]u8,
        indicesBufferSize: u32,
        indicesCount: u16,
    };
    name: [*]const u8 = undefined,
    hashes: [*]u64 = undefined,
//     nameLen: u8,
    textures: [*]Texture = undefined,
    meshes: [*]Mesh = undefined,
    hashesCount: u16 = undefined,
    texturesCount: u16 = undefined,
    meshesCount: u16 = undefined,
    fn unload(self: *Archive) void
    {
        GlobalState.allocator.free(self.hashes[0..self.hashesCount]);
        for(self.textures[0..self.texturesCount]) |texture|
        {
//             GlobalState.allocator.free(texture.name[0..texture.nameLen]);
            PageAllocator.unmap(texture.image.data[0..texture.image.size]);
//              textures[i]
        }
        for(self.meshes[0..self.meshesCount]) |mesh|
        {
            PageAllocator.unmap(mesh.verticesBuffer[0..mesh.verticesBufferSize]);
            PageAllocator.unmap(mesh.indicesBuffer[0..mesh.indicesBufferSize]);
            //              textures[i]
        }
        GlobalState.allocator.free(self.textures[0..self.texturesCount]);
        GlobalState.allocator.free(self.meshes[0..self.meshesCount]);
    }
};
const Material_ChunkData = struct
{
    name: [*]u8,
    nameLen: u32,
};
const Model_ChunkData = struct
{
    name: [*]u8,
    nameLen: u32,
//     meshes: [*]*Mesh_ChunkData,
    meshesIndices: [*]u8,
    meshesCount: u8,
};

pub fn clb_readEffects(memoryBuffer: *[]u8, path: [*:0]const u8, dirfd: i32,) void
{
    var stackBuffer: [0x10000]u8 align(0x1000) = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;

//     var archive: Archive = undefined;
//     archive.name = path;
    const mode: std.os.linux.mode_t = 0o755;
    const filefd: i32 = @intCast(linux.openat(dirfd, path, .{.ACCMODE = .RDONLY}, mode));
    var fileStat: linux.Stat = undefined;
    _ = linux.fstat(filefd, &fileStat);
    const fileSize: u64 = @intCast(fileStat.size);
    memoryBuffer.ptr = PageAllocator.map(fileSize*2);
    memoryBuffer.len = fileSize*2;
    const fileBuffer = memoryBuffer.ptr;
    var memoryBufferItr: [*]u8 = fileBuffer+fileSize;
    _ = linux.read(filefd, fileBuffer, fileSize);
    _ = linux.close(filefd);
    const clb_Signature: [8]u8 = .{0x43, 0x52, 0x4c, 0x00, 0x60, 0x00, 0x41, 0x00};
    if(alignPtrCast(*u64, fileBuffer).* != @as(u64, @bitCast(clb_Signature)))
    {
        print("incorrect clb signature!", .{});
        exit(0);
    }
    if(fileBuffer[8] != 8)
    {
        print("!= 8\n", .{});
        exit(0);
    }
    const clb_TablesOffsetsPtr: [*]u8 = fileBuffer+12;
    const stringsOffsetPtr: [*]u8 = fileBuffer+0x20;
    //     //     const clb_TablesNames = fileBuffer+32;
    var bufferPtrItr = fileBuffer+32;
    var libraryNameLen: u64 = 0;
    while(bufferPtrItr[libraryNameLen] != 0)
        libraryNameLen+=1;
    print("{s}\n", .{bufferPtrItr[0..libraryNameLen]});
    bufferPtrItr += alignPtrCast(*u32, clb_TablesOffsetsPtr).*;
    const dataOffsetPtr = bufferPtrItr + readFromPtr(u32, fileBuffer+16);
    print("dataOffset: {x}\n", .{@intFromPtr(dataOffsetPtr)-@intFromPtr(fileBuffer)});
    //     print("{x}\n\n", .{@intFromPtr(fileBufferPtrIterator) - @intFromPtr(fileBuffer)});


//     if(readFromPtr(u16, bufferPtrItr) != 0x0383)
//     {
//         print("!= 0x0383\n", .{});
//         exit(0);
//     }
//     var effectsCount: u64 = 0;
    const clbTable = readTable(&stackBufferPtr, bufferPtrItr);
    {
//         print("clbTable:\n", .{});
//         clbTable.printDataOffsets(fileBuffer, 4);
        // header tables
        if(readFromPtr(u16, clbTable.dataAfterHeaderPtr + clbTable.header[2][1]) != 0x0101)
        {
            print("!= 0x0101\n", .{});
            exit(0);
        }
        const headersTable = readTable(&stackBufferPtr, clbTable.dataAfterHeaderPtr + clbTable.header[2][1] + 3);
        {
            for(0..headersTable.tablesCount) |tableIndex|
            {
                bufferPtrItr = headersTable.dataAfterHeaderPtr + headersTable.header[tableIndex][1];
                const chunkType: u64 = readFromPtr(u16, bufferPtrItr);
                switch(chunkType)
                {
//                     0x0005 =>//ANIM
//                     {
//
//                     },
//                     0x004b =>//OBJ
//                     {
// //                         modelsCount+=1;
//                     },
//                     0x0035 =>//MESH
//                     {
// //                         meshesCount+=1;
//                     },
//                     0x003d =>//TX
//                     {
// //                         texturesCount+=1;
//                     },
//                     0x1669 =>//EFFECT
//                     {
// //                         effectsCount+=1;
//                     },
//                     0x166f =>//MAT
//                     {
// //                         materialsCount+=1;
//                     },
                    else =>
                    {
//                         print("unknown chunk type: {x}\n", .{chunkType});
//                         print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
//                         //                         var bufferPtrItr: [*]u8 = undefined;
//                         const blockTable = readTable(&stackBufferPtr, bufferPtrItr+4);
//                         {
//                             bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[1][1];
//                             const LibraryNameLen: u64 = bufferPtrItr[0];
//                             const LibraryNameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
//                             print("{s}\n", .{(stringsOffsetPtr+LibraryNameOffset)[0..LibraryNameLen]});
//                             bufferPtrItr+=8;
//                             const NameLen: u64 = bufferPtrItr[0];
//                             const NameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
//                             print("{s}\n", .{(stringsOffsetPtr+NameOffset)[0..NameLen]});
//                             print("\n", .{});
//                         }
                    }
                }
            }
            //             print("effectsCount: {d}\n", .{effectsCount});;
            //             effectsCount = 0;
            for(0..headersTable.tablesCount) |tableIndex|
            {
                bufferPtrItr = headersTable.dataAfterHeaderPtr + headersTable.header[tableIndex][1];
                const chunkType: u64 =  readFromPtr(u16, bufferPtrItr);
                if(chunkType == 0x1669)
                {
                    bufferPtrItr+=4;
                    readChunk_Effect(&memoryBufferItr, fileBuffer, bufferPtrItr, stringsOffsetPtr, dataOffsetPtr);
//                     print("\n", .{});
                    break;
                }
            }
        }
    }
}
fn readChunk_Effect(memoryBufferItr: *[*]u8, fileBuffer: [*]u8, bufferPtrItrIn: [*]u8, stringsOffsetPtr: [*]u8, dataOffsetPtr: [*]u8) void
{
    _ = memoryBufferItr;
    _ = dataOffsetPtr;
    //     _ = fileBuffer;
    //     _ = bufferPtrItrIn;
    //     _ = stringsOffsetPtr;
    print("{x}\n", .{@intFromPtr(bufferPtrItrIn)-@intFromPtr(fileBuffer)});
    var stackBuffer: [0x10000]u8 align(0x1000) = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;
    var bufferPtrItr: [*]u8 = undefined;
    const blockTable = readTable(&stackBufferPtr, bufferPtrItrIn);
    {
        bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[1][1];
        const LibraryNameLen: u64 = bufferPtrItr[0];
        const LibraryNameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
        bufferPtrItr+=8;
        const NameLen: u64 = bufferPtrItr[0];
        const NameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
        print("{s}\n", .{(stringsOffsetPtr+LibraryNameOffset)[0..LibraryNameLen]});
        print("{s}\n", .{(stringsOffsetPtr+NameOffset)[0..NameLen]});
        if(stringsOffsetPtr[NameOffset] == '_')
            return;
        blockTable.printDataOffsets(fileBuffer, 0);
        var blockTableIndex: u64 = 0;
        {
            //             while(blockTable.header[blockTableIndex][0] != 0x32){blockTableIndex+=1;}
            //             bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[blockTableIndex][1];
            //             print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
            //             if(readFromPtr(u16, bufferPtrItr) != 0x0101)
            //             {
            //                 print("!= 0x0101\n", .{});
            //                 exit(0);
            //             }
            //             bufferPtrItr+=3;
            //             const table_1 = readTable(&stackBufferPtr, bufferPtrItr);
            //             {
            //                 table_1.printDataOffsets(fileBuffer, 4);
            //                 bufferPtrItr = table_1.dataAfterHeaderPtr;
            // //                 bufferPtrItr = table_1.dataAfterHeaderPtr + table_1.header[1][1];
            //     //             print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
            //                 for(0..table_1.tablesCount) |i|
            //                 {
            //                     if(readFromPtr(u32, table_1.dataAfterHeaderPtr + table_1.header[i][1]) != 0x411665)
            //                     {
            //                         print("!= 0x411665\n", .{});
            //                         exit(0);
            //                     }
            //                 }
            //                 bufferPtrItr+=4;
            // //                 if(readFromPtr(u32, bufferPtrItr) != 0x411665)
            // //                 {
            // //                     print("!= 0x411665\n", .{});
            // //                     exit(0);
            // //                 }
            // //                 bufferPtrItr+=4;
            //                 const table_2 = readTable(&stackBufferPtr, bufferPtrItr);
            //                 {
            //                     table_2.printDataOffsets(fileBuffer, 8);
            // //                     bufferPtrItr = table_2.dataAfterHeaderPtr;
            //                     bufferPtrItr = table_2.dataAfterHeaderPtr + table_2.header[1][1];
            //                     print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
            // //                     bufferPtrItr+=3;
            //                     // "MainPS"
            //                     const shaderNameLen: u64 = bufferPtrItr[0];
            //                     bufferPtrItr+=4;
            //                     const shaderNameOffset: u64 = readFromPtr(u32, bufferPtrItr);
            //                     print("{s}\n", .{(stringsOffsetPtr+shaderNameOffset)[0..shaderNameLen]});
            //
            //
            // //                     const table_3 = readTable(&stackBufferPtr, bufferPtrItr);
            //                     {
            // //                         table_3.printDataOffsets(fileBuffer, 12);
            // //                         bufferPtrItr = table_3.dataAfterHeaderPtr;
            // //                         print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
            // //                         for(1..table_3.tablesCount) |i|
            // //                         {
            // //                             bufferPtrItr = table_3.dataAfterHeaderPtr + table_3.header[i][1];
            // // //                             const chunkType: u64 = readFromPtr(u32, bufferPtrItr);
            // //                             if(readFromPtr(u32, bufferPtrItr) != 0x411667)
            // //                             {
            // //                                 print("!= 0x411667\n", .{});
            // //                                 exit(0);
            // //                             }
            // //                             bufferPtrItr+=4;
            // //                             const _411667MainTable = readTableNear(bufferPtrItr);
            // //                             {
            // //                                 _411667MainTable.printDataOffsets(fileBuffer, 16);
            // // //                                 bufferPtrItr = _411667MainTable.dataAfterHeaderPtr + _411667MainTable.dataPtr[3*2+1];
            // // //                                 if(readFromPtr(u16, bufferPtrItr) != 0x0A03)
            // // //                                 {
            // // //                                     print("!= 0x0A03\n", .{});
            // // //                                     exit(0);
            // // //                                 }
            // // //                                 const _411667Table_1 = readTableNear(bufferPtrItr);
            // // //                                 {
            // // //                                      _411667Table_1.printDataOffsets(fileBuffer, 20);
            // // //                                 }
            // //                             }
            // //                             break;
            // // //                             switch(chunkType)
            // // //                             {
            // // //                                 0x411667 =>
            // // //                                 {
            // // //
            // // //                                 },
            // // //                                 else =>
            // // //                                 {
            // // //                                     print("unknown chunkType: {x}!\n", .{chunkType});
            // // // //                                     exit(0);
            // // //                                 }
            // // //                             }
            // //                         }
            // //                         const chunkType: u64 = readFromPtr(u32, bufferPtrItr);
            //
            // //                         if(readFromPtr(u32, bufferPtrItr) != 0x411667)
            // //                         {
            // //                             print("!= 0x411667\n", .{});
            // //                             exit(0);
            // //                         }
            // //                         bufferPtrItr+=4;
            // //                         const table_4 = readTableNear(bufferPtrItr);
            // //                         {
            // //                             table_4.printDataOffsets(fileBuffer, 16);
            // //                         }
            //                     }
            //                 }
            //                 // another 4 tables
            //             }

        }
        // Passes
        {
            while(blockTable.header[blockTableIndex][0] != 0x33){blockTableIndex+=1;}
            bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[blockTableIndex][1];
            //             print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
            if(readFromPtr(u16, bufferPtrItr) != 0x0101)
            {
                print("!= 0x0101\n", .{});
                exit(0);
            }
            bufferPtrItr+=3;
            const table_1 = readTable(&stackBufferPtr, bufferPtrItr);
            {
                table_1.printDataOffsets(fileBuffer, 4);
                bufferPtrItr = table_1.dataAfterHeaderPtr;
                //                 bufferPtrItr = table_1.dataAfterHeaderPtr + table_1.header[1][1];
                //                 print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                if(readFromPtr(u32, bufferPtrItr) != 0x41166a)
                {
                    print("!= 0x41166a\n", .{});
                    exit(0);
                }
                bufferPtrItr+=4;
                const table_2 = read_0x80Table(bufferPtrItr);
                {
                    bufferPtrItr = table_2.dataAfterHeaderPtr;
                    print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                    const table_3 = readTable(&stackBufferPtr, bufferPtrItr);
                    {
                        bufferPtrItr = table_3.dataAfterHeaderPtr;
                        table_3.printDataOffsets(fileBuffer, 12);
                        print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                        // 0x1-0x2
                        inline for(0..2) |i|
                        {
                            const I = i*8;
                            const nameLen: u64 = bufferPtrItr[I];
                            const nameOffset: u64 = readFromPtr(u32, bufferPtrItr+I+4);
                            print("{s}\n", .{(stringsOffsetPtr+nameOffset)[0..nameLen]});
                        }
                        bufferPtrItr+=16;
                        print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                        // 0x3
                        //0561561f
                        const table_4 = readTableNear(bufferPtrItr);
                        {
                            //                             table_4.printDataOffsets(fileBuffer, 16);
                            bufferPtrItr = table_4.dataAfterHeaderPtr;
                        }
                        print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                        // 0x4,5
                        bufferPtrItr+=2;
                        // 0x7
                    }
                }
            }
        }
        //Properties
        {
            //             while(blockTable.header[blockTableFieldIndex][0] != 0x35){blockTableFieldIndex+=1;}
            //             bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[blockTableFieldIndex][1];
            //             if(readFromPtr(u16, bufferPtrItr) != 0x0101)
            //             {
            //                 print("!= 0x0101\n", .{});
            //                 exit(0);
            //             }
            //             bufferPtrItr+=3;
            //             const table_1 = readTable(&stackBufferPtr, bufferPtrItr);
            //             {
            //                 table_1.printDataOffsets(fileBuffer, 4);
            //                 bufferPtrItr = table_1.dataAfterHeaderPtr;
            // //                 for(0..table_1.tablesCount) |i|
            // //                 {
            // //                     bufferPtrItr = table_1.dataAfterHeaderPtr + table_1.header[i][1];
            // //                     if(readFromPtr(u32, bufferPtrItr) != 0x411694)
            // //                     {
            // //                         print("!= 0x411694\n", .{});
            // //                         exit(0);
            // //                     }
            // //                 }
            // //                 if(readFromPtr(u32, bufferPtrItr) != 0x411694)
            // //                 {
            // //                     print("!= 0x411694\n", .{});
            // //                     exit(0);
            // //                 }
            //             }
        }
        //         bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[3][1];
        // //         print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
        //         if(readFromPtr(u16, bufferPtrItr) != 0x0101)
        //         {
        //             print("!= 0x0101\n", .{});
        //             exit(0);
        //         }
        //         bufferPtrItr+=3;

        //             const table_2 = readTable(&stackBufferPtr, bufferPtrItr);
        //             {
        //                 table_2.printDataOffsets(fileBuffer, 8);
        //                 bufferPtrItr = table_2.dataAfterHeaderPtr;
        //                 print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
        //                 bufferPtrItr+=3;
        //                 const table_3 = readTable(&stackBufferPtr, bufferPtrItr);
        //                 {
        //                     table_3.printDataOffsets(fileBuffer, 12);
        //                     bufferPtrItr = table_3.dataAfterHeaderPtr;
        //                     print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
        //                     if(readFromPtr(u32, bufferPtrItr) != 0x411667)
        //                     {
        //                         print("!= 0x411667\n", .{});
        //                         exit(0);
        //                     }
        //                     bufferPtrItr+=4;
        //                     const table_4 = readTableNear(bufferPtrItr);
        //                     {
        //                         table_4.printDataOffsets(fileBuffer, 16);
        //                     }
        //                 }
        //             }
        //         }
        //         bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[4][1];
        //         print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
        //         if(readFromPtr(u16, bufferPtrItr) != 0x0101)
        //         {
        //             print("!= 0x0101\n", .{});
        //             exit(0);
        //         }
    }
    print("\n", .{});
}
fn readChunk_Texture(stackBufferPtrIn: [*]u8, fileBuffer: [*]u8, bufferPtrItrIn: [*]u8, stringsOffsetPtr: [*]u8, dataBlockPtr: [*]u8, archive: *Archive) void
{
    _ = fileBuffer;
    const stdout = GlobalState.stdout;
    var stackBufferPtr = stackBufferPtrIn;
    const texture = &archive.textures[archive.texturesCount];
    var bufferPtrItr: [*]u8 = undefined;
    const blockTable = readTable(&stackBufferPtr, bufferPtrItrIn);
    {
        bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[1][1];
//         const LibraryNameLen: u64 = bufferPtrItr[0];
//         const LibraryNameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
        bufferPtrItr+=8;
        const NameLen: u64 = bufferPtrItr[0];
        const NameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
//         stdout.print("{s}\n", .{(stringsOffsetPtr+LibraryNameOffset)[0..LibraryNameLen]}) catch unreachable;
        stdout.print("{s}\n", .{(stringsOffsetPtr+NameOffset)[0..NameLen]}) catch unreachable;
        archive.hashes[hashIndex] = hash(0, (stringsOffsetPtr+NameOffset)[0..NameLen]);
        hashIndex+=1;
//         texture.name = stringsOffsetPtr+NameOffset;
//         print("{s}\n{d}\n", .{texture.name[0..NameLen], NameLen});
//         texture.name = (GlobalState.allocator.alignedAlloc(u8, CustomMem.SIMDalignment, NameLen) catch unreachable).ptr;
//         memcpyDstAlign(texture.name, stringsOffsetPtr+NameOffset, NameLen);
//         texture.nameLen = @intCast(NameLen);

        bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[blockTable.tablesCount-1][1];
        bufferPtrItr+=3;
//         print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
        const mipmapsHeaderOffsetsTable = readTable(&stackBufferPtr, bufferPtrItr);
        {
//             print("{x}\n", .{@intFromPtr(mipmapsHeaderOffsetsTable.dataAfterHeaderPtr) - @intFromPtr(fileBuffer)});
            bufferPtrItr = mipmapsHeaderOffsetsTable.dataAfterHeaderPtr+4+13;

//             var mipSizes: [16]u64 = undefined;
//             var mipPixels: [16][*]u8 = undefined;

            const tex_width: u64 = readFromPtr(u32, bufferPtrItr);
            const tex_height: u64 = readFromPtr(u32, bufferPtrItr+4);
            const tex_format: u64 = readFromPtr(u8, bufferPtrItr+12);
            const mipSize: u64 = readFromPtr(u32, bufferPtrItr+17+8);
//             stdout.print("width: {d}\nheight: {d}\n", .{tex_width, tex_height}) catch unreachable;
            const printFormat = true;
            switch(tex_format)
            {
                0x53 =>
                {
                    texture.image.format = Vulkan.VK_FORMAT_R8G8B8A8_UNORM;
                    texture.image.alignment = 4;
                    if(printFormat)
                        stdout.print("format: R8G8B8A8_UNORM\n", .{}) catch unreachable;
                },
                0x6E =>
                {
                    texture.image.format = Vulkan.VK_FORMAT_B8G8R8A8_UNORM;
                    texture.image.alignment = 4;
                    if(printFormat)
                        stdout.print("format: B8G8R8A8_UNORM\n", .{}) catch unreachable;
                },
                0x83 =>
                {
                    texture.image.format = Vulkan.VK_FORMAT_BC1_RGB_SRGB_BLOCK;
                    texture.image.alignment = 8;
                    if(printFormat)
                        stdout.print("format: BC1_RGB_SRGB_BLOCK\n", .{}) catch unreachable;
                },
                0x97 =>
                {
                    texture.image.format = Vulkan.VK_FORMAT_BC3_UNORM_BLOCK;
                    texture.image.alignment = 16;
                    if(printFormat)
                        stdout.print("format: BC3_UNORM_BLOCK\n", .{}) catch unreachable;
                },
                0xAC =>
                {
                    texture.image.format = Vulkan.VK_FORMAT_BC5_SNORM_BLOCK;
                    texture.image.alignment = 16;
                    if(printFormat)
                        stdout.print("format: BC5_SNORM_BLOCK\n", .{}) catch unreachable;
                },
                else =>
                {
                    print("unknown texture image format!\n", .{});
                    exit(0);
                }
            }
            var offsets: [16]u64 = undefined;
            var sizes: [16]u64 = undefined;
            var compressedSizes: [16]u64 = undefined;
            for(0..mipmapsHeaderOffsetsTable.tablesCount) |mipLevel|
            {
                bufferPtrItr = mipmapsHeaderOffsetsTable.dataAfterHeaderPtr + mipmapsHeaderOffsetsTable.header[mipLevel][1];
                bufferPtrItr+=4+13;
                offsets[mipLevel] = readFromPtr(u32, bufferPtrItr+17);
                sizes[mipLevel] = readFromPtr(u32, bufferPtrItr+17+8);
                compressedSizes[mipLevel] = readFromPtr(u32, bufferPtrItr+17+12);
            }
//             stdout.print("size: {d}\n", .{sizes[0]}) catch unreachable;
//             stdout.print("size: {d}\n", .{mipSize}) catch unreachable;
//             stdout.print("compressedSize: {d}\n", .{compressedSizes[0]}) catch unreachable;
            var texture_size: u64 = 0;
            for(0..mipmapsHeaderOffsetsTable.tablesCount) |i|
            {
//                 print("{d}\n", .{sizes[i]});
                texture_size += sizes[i];
            }
//             texture.image.data = CustomMem.allocInFixedBuffer(memoryBufferItr, texture_size, CustomMem.SIMDalignment);
            texture.image.data = PageAllocator.map(texture_size).ptr;
//             PageAllocator.map
            texture_size = 0;
            for(0..mipmapsHeaderOffsetsTable.tablesCount) |i|
            {
                const ptr = texture.image.data+texture_size;
                if(compressedSizes[i] != sizes[i])
                {
                    _ = lz4.LZ4_decompress_safe(dataBlockPtr+offsets[i], ptr, @intCast(compressedSizes[i]), @intCast(sizes[i]));
                }
                else
                {
                    memcpy(ptr, dataBlockPtr+offsets[i], @intCast(sizes[i]));
                }
                texture_size += sizes[i];
//                 break;
            }
//             stdout.print("texture_size: {d}\n", .{texture_size}) catch unreachable;
            texture.image.mipSize = @intCast(mipSize);
            texture.image.size = @intCast(texture_size);
            texture.image.width = @intCast(tex_width);
            texture.image.height = @intCast(tex_height);
            texture.image.mipsCount = @intCast(mipmapsHeaderOffsetsTable.tablesCount);
//             texture.image.mipsCount = 1;
        }
    }
}
fn readChunk_Mesh(stackBufferPtrIn: [*]u8, fileBuffer: [*]u8, fileBufferPtrIteratorIn: [*]u8, stringsOffsetPtr: [*]u8, dataBlockPtr: [*]u8, archive: *Archive) void
{
    const stdout = GlobalState.stdout;
//     print("offset: {x}\n", .{@intFromPtr(fileBufferPtrIteratorIn) - @intFromPtr(fileBuffer)});
    var stackBufferPtr = stackBufferPtrIn;
    const mesh = &archive.meshes[archive.meshesCount];
//     _ = fileBuffer;
    var bufferPtrItr: [*]u8 = undefined;
    const BlockTable = readTable(&stackBufferPtr, fileBufferPtrIteratorIn);
    {
//         print("offset: {x}\n", .{@intFromPtr(BlockTable.dataAfterHeaderPtr) - @intFromPtr(fileBuffer)});
        bufferPtrItr = BlockTable.dataAfterHeaderPtr + BlockTable.header[1][1];
//         const LibraryNameLen: u64 = bufferPtrItr[0];
//         const LibraryNameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
        bufferPtrItr+=8;
        const NameLen: u64 = bufferPtrItr[0];
        const NameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
//         stdout.print("{s}\n", .{(stringsOffsetPtr+LibraryNameOffset)[0..LibraryNameLen]}) catch unreachable;
        stdout.print("{s}\n", .{(stringsOffsetPtr+NameOffset)[0..NameLen]}) catch unreachable;
        archive.hashes[hashIndex] = hash(0, (stringsOffsetPtr+NameOffset)[0..NameLen]);
        hashIndex+=1;
//         mesh.name = stringsOffsetPtr+NameOffset;
//         mesh.nameLen = @intCast(NameLen);
//         BlockTable.printDataOffsets(fileBufferPtrIteratorIn, 4);
        for(3..BlockTable.tablesCount) |tableIndex|
        {
            bufferPtrItr = BlockTable.dataAfterHeaderPtr + BlockTable.header[tableIndex][1];
            {
//                 print("type: {x}\toffset: {x}\n", .{BlockTable.header[tableIndex][0],@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                switch(BlockTable.header[tableIndex][0])
                {
                    0x3d =>
                    {
//                         print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                        const dataTable = readTableNear(bufferPtrItr);
                        {
                            const elementsCount: u32 = readFromPtr(u32, dataTable.dataAfterHeaderPtr + 1);
                            print("indicesCount: {d}\n", .{elementsCount});
                            const dataOffset: u64 = readFromPtr(u32, dataTable.dataAfterHeaderPtr + 5);
                            bufferPtrItr = dataTable.dataAfterHeaderPtr + 9;
                            const dataSize: u32 = readFromPtr(u32, bufferPtrItr+4);
                            const dataCompressedSize: u32 = readFromPtr(u32, bufferPtrItr+8);
//                             print("dataOffset: {x}\n", .{dataOffset});
//                             print("dataSize: {d}\ndataCompressedSize: {d}\n", .{dataSize, dataCompressedSize});
//                             stdout.print("indicesCount: {d}\nindicesSize: {d}\n", .{elementsCount, dataSize}) catch unreachable;
//                             mesh.indicesBuffer = allocInFixedBuffer(memoryBufferItr, dataSize, CustomMem.SIMDalignment);//(allocator.alignedAlloc(u8, CustomMem.alingment, dataSize) catch unreachable).ptr;
                            mesh.indicesBuffer = PageAllocator.map(dataSize).ptr;
                            mesh.indicesBufferSize = dataSize;
                            mesh.indicesCount = @intCast(elementsCount);
                            if(dataCompressedSize != dataSize)
                            {
                                _ = lz4.LZ4_decompress_safe(dataBlockPtr+dataOffset, mesh.indicesBuffer, @intCast(dataCompressedSize), @intCast(dataSize));
                            }
                            else
                            {
                                memcpy(mesh.indicesBuffer, dataBlockPtr+dataOffset, dataSize);
                            }
                        }
                    },
                    0x3e =>
                    {
//                         print("offset: {x}\n", .{@intFromPtr(fileBufferPtrIterator) - @intFromPtr(fileBuffer)});
                        const dataTable = readTableNear(bufferPtrItr);
                        {
                            var vertexFormat: [16]u8 align(16) = @splat(0);
                            var vertexTypeString: [16]u8 align(16) = @splat(0);
                            var vertexSize: u64 = undefined;
                            const vertexTypeTable = readTableNear(dataTable.dataAfterHeaderPtr);
                            {
                                vertexSize = vertexTypeTable.dataAfterHeaderPtr[0];
                                const vertexAttributesCount: u64 = vertexTypeTable.dataAfterHeaderPtr[4]<<1;
                                bufferPtrItr = vertexTypeTable.dataAfterHeaderPtr+12;
                                var indexVertexAttributesCount: u64 = 0;
//                                 CustomMem.ptrCast(*u128, &vertexFormat).* = 0;
                                while(indexVertexAttributesCount < vertexAttributesCount) : (indexVertexAttributesCount+=2)
                                {
                                    const value = readFromPtr(u32, bufferPtrItr);
                                    vertexFormat[indexVertexAttributesCount] = @intCast(value);
                                    switch(value)
                                    {
                                        0x10 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'P';
                                        },
                                        0x40 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'N';
                                        },
                                        0x30 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'U';
                                        },
                                        0x20 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'C';
                                        },
                                        0x70 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'T';
                                        },
                                        0x11 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'P';
                                        },
                                        0x31 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'U';
                                        },
                                        0x80 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'I';
                                        },
                                        0x90 =>
                                        {
                                            vertexTypeString[indexVertexAttributesCount] = 'W';
                                        },
                                        else =>
                                        {
//                                             vertexTypeString[indexVertexAttributesCount] = '0';
                                            print("unknown attribute type: {x}!\n{x}\n", .{value, @intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                            exit(0);
                                        }
                                    }
                                    var attributeElementsCount = bufferPtrItr[4];
                                    while(attributeElementsCount > 0x10){attributeElementsCount-=0x10;}
                                    vertexFormat[indexVertexAttributesCount+1] = attributeElementsCount;
                                    vertexTypeString[indexVertexAttributesCount+1] = attributeElementsCount+0x30;
                                    bufferPtrItr+=8;
                                }
                                mesh.vertexFormat = vertexTypeString;
                            }
                            const elementsCount: u32 = readFromPtr(u32, dataTable.dataAfterHeaderPtr + dataTable.dataPtr[1*2+1]);
                            print("verticesCount: {d}\n", .{elementsCount});
                            const dataOffset: u64 = readFromPtr(u32, dataTable.dataAfterHeaderPtr + dataTable.dataPtr[2*2+1]);
                            bufferPtrItr = dataTable.dataAfterHeaderPtr + dataTable.dataPtr[2*2+1] + 4;
//                             print("{x}\n", .{@intFromPtr(fileBufferPtrIterator) - @intFromPtr(fileBuffer)});
                            const dataSize: u32 = readFromPtr(u32, bufferPtrItr+4);
                            const dataCompressedSize: u32 = readFromPtr(u32, bufferPtrItr+8);

//                             mesh.verticesBuffer = allocInFixedBuffer(memoryBufferItr, dataSize, CustomMem.SIMDalignment);
                            mesh.verticesBuffer = PageAllocator.map(dataSize).ptr;
                            //(allocator.alignedAlloc(u8, CustomMem.alingment, dataSize) catch unreachable).ptr;
                            mesh.verticesBufferSize = dataSize;
                            mesh.verticesCount = @intCast(elementsCount);
                            if(dataCompressedSize != dataSize)
                            {
                                _ = lz4.LZ4_decompress_safe(dataBlockPtr+dataOffset, mesh.verticesBuffer, @intCast(dataCompressedSize), @intCast(dataSize));
                            }
                            else
                            {
                                memcpy(mesh.verticesBuffer, dataBlockPtr+dataOffset, dataSize);
                            }
//                             AoS => SoA
                            const SoA_verticesBuffer = PageAllocator.map(dataSize).ptr;
                            var verticesBufferPtr = SoA_verticesBuffer;
                            var attributeOffset: u64 = 0;
                            for(0..8) |elementTypeIndex|
                            {
                                const attributeType = vertexTypeString[elementTypeIndex*2];
                                var attributeSize: u64 = 0;
                                if(attributeType == 0)
                                    break;
                                switch(attributeType)
                                {
                                    'P' =>
                                    {
                                        attributeSize = 12;
                                    },
                                    'N' =>
                                    {
                                        attributeSize = 12;
                                    },
                                    'U' =>
                                    {
                                        attributeSize = 8;
                                    },
                                    else =>
                                    {
                                        break;
                                    }
                                }
                                print("verticesBufferOffset: {d}\n", .{@intFromPtr(verticesBufferPtr) - @intFromPtr(SoA_verticesBuffer)});
                                print("attributeOffset: {d}\n", .{attributeOffset});
                                for(0..elementsCount) |elementIndex|
                                {
                                    memcpy(verticesBufferPtr, mesh.verticesBuffer+vertexSize*elementIndex+attributeOffset, attributeSize);
                                    verticesBufferPtr+=attributeSize;
                                }
                                attributeOffset+=attributeSize;
                            }
                            PageAllocator.unmap(mesh.verticesBuffer[0..dataSize]);
                            mesh.verticesBuffer = SoA_verticesBuffer;
                        }
                    },
                    else =>
                    {
                    }
                }
            }
        }
    }
}
fn readChunk_Material(allocator: mem.Allocator, fileBuffer: [*]u8, fileBufferPtrIteratorIn: [*]u8, stringsOffsetPtr: [*]u8, dataBlockPtr: [*]u8, material: *Material_ChunkData) void
{
    const stdout = GlobalState.stdout;
    _ = allocator;
    _ = fileBuffer;
//     _ = fileBufferPtrIteratorIn;
//     _ = stringsOffsetPtr;
    _ = dataBlockPtr;
    _ = material;
    var fileBufferPtrIterator: [*]u8 = undefined;
    const BlockTable: Table = readTable(fileBufferPtrIteratorIn);
    {
        fileBufferPtrIterator = BlockTable.dataAfterHeaderPtr + BlockTable.header[1][1];
        const LibraryNameLen: u64 = fileBufferPtrIterator[0];
        const LibraryNameOffset: u64 = mem.bytesToValue(u32, fileBufferPtrIterator+4);
        fileBufferPtrIterator+=8;
        const NameLen: u64 = fileBufferPtrIterator[0];
        const NameOffset: u64 = mem.bytesToValue(u32, fileBufferPtrIterator+4);
        stdout.print("{s}\n{s}\n", .{(stringsOffsetPtr+LibraryNameOffset)[0..LibraryNameLen], (stringsOffsetPtr+NameOffset)[0..NameLen] }) catch unreachable;
    }
}
fn readChunk_Model(stackBufferPtrIn: [*]u8, memoryBufferItr: *[*]u8, fileBuffer: [*]u8, fileBufferPtrIteratorIn: [*]u8, stringsOffsetPtr: [*]u8, dataBlockPtr: [*]u8, model: *Archive.Model) void
{
    const stdout = GlobalState.stdout;
    var stackBufferPtr = stackBufferPtrIn;
    _ = memoryBufferItr;
//     _ = meshes;
//     _ = meshesCount;
//     _ = allocator;
//     _ = fileBuffer;
    //     _ = fileBufferPtrIteratorIn;
    //     _ = stringsOffsetPtr;
    _ = dataBlockPtr;
//     _ = model;
    var bufferPtrItr: [*]u8 = undefined;
    const BlockTable = readTable(&stackBufferPtr, fileBufferPtrIteratorIn);
    {
        bufferPtrItr = BlockTable.dataAfterHeaderPtr + BlockTable.header[1][1];
        const LibraryNameLen: u64 = bufferPtrItr[0];
        const LibraryNameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
        bufferPtrItr+=8;
        const NameLen: u64 = bufferPtrItr[0];
        const NameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
        stdout.print("{s}\n{s}\n", .{(stringsOffsetPtr+LibraryNameOffset)[0..LibraryNameLen], (stringsOffsetPtr+NameOffset)[0..NameLen] }) catch unreachable;
//         stdout.print("{s}\n", .{(stringsOffsetPtr+NameOffset)[0..NameLen]})  catch unreachable;
        model.name = stringsOffsetPtr+NameOffset;
        model.nameLen = @intCast(NameLen);

//         var tableIndex: u64 = 3;
//         for(3..BlockTable.tablesCount) |tableIndex|
//         {
//             bufferPtrItr = BlockTable.dataAfterHeaderPtr + BlockTable.header[tableIndex][1];
//             print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//             print("type: {x}\n", .{BlockTable.header[tableIndex][0]});
//         }
        bufferPtrItr = BlockTable.dataAfterHeaderPtr + BlockTable.header[BlockTable.tablesCount-1][1] + 3 + 7;
        const meshesTablesTable = readTable(&stackBufferPtr, bufferPtrItr);
        {
            bufferPtrItr = meshesTablesTable.dataAfterHeaderPtr + 3;
            stdout.print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)}) catch unreachable;
            for(0..meshesTablesTable.tablesCount) |meshTableIndex|
            {
                bufferPtrItr = meshesTablesTable.dataAfterHeaderPtr + meshesTablesTable.dataAfterHeaderPtr[meshTableIndex][1];
            }
//             const meshTablesOffsetsTable = readTable(&stackBufferPtr, bufferPtrItr);
//             {
//                 bufferPtrItr = meshTablesOffsetsTable.dataAfterHeaderPtr;
//                 const chunkType = readFromPtr(u32, bufferPtrItr);
//                 if(chunkType != 0x00410067)
//                 {
//                     print("!= 0x00410067\n", .{});
//                     exit(0);
//                 }
//                 bufferPtrItr+=4;
//                 stdout.print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)}) catch unreachable;
//                 const meshAnotherTablesOffsetsTable = readTableNear(bufferPtrItr);
//                 {
//                     bufferPtrItr = meshAnotherTablesOffsetsTable.dataAfterHeaderPtr;
//                     stdout.print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)}) catch unreachable;
//                     stdout.print("meshesCount: {d}\n", .{meshTablesOffsetsTable.tablesCount}) catch unreachable;
//                     model.meshesCount = @intCast(meshTablesOffsetsTable.tablesCount);

//                     for(0..meshTablesOffsetsTable.tablesCount) |modelMeshIndex|
//                     {
//                         bufferPtrItr = meshAnotherTablesOffsetsTable.dataAfterHeaderPtr + ;
//                     }
//                     model.meshesIndices = (GlobalState.arenaAllocator.alloc(u8, model.meshesCount) catch unreachable).ptr;
//                     for(0..meshTablesOffsetsTable.tablesCount) |modelMeshIndex|
//                     {
//                         bufferPtrItr = meshAnotherTablesOffsetsTable.dataAfterHeaderPtr + meshTablesOffsetsTable.dataAfterHeaderPtr[1+(modelMeshIndex<<1)];
//                         if(readFromPtr(u16, bufferPtrItr) != 0x1402)
//                         {
//                             print("!= 0x1402\n", .{});
//                             exit(0);
//                         }
// //                         const meshInfoTable = readTableNear(fileBufferPtrIterator);
// //                         {
// //                             fileBufferPtrIterator = meshInfoTable.dataAfterHeaderPtr;
// //                             const meshNameLength = fileBufferPtrIterator[8];
// //                             const meshNameOffset = mem.bytesToValue(u16, fileBufferPtrIterator+12);
// //                             var meshNameFound: bool = false;
// //                             var archiveMeshIndex: u64 = 0;
// //                             while(archiveMeshIndex < meshesCount) : (archiveMeshIndex+=1)
// //                             {
// //                                 if(CustomMem.memcmp(stringsOffsetPtr+meshNameOffset, meshes[archiveMeshIndex].name, meshNameLength))
// //                                 {
// //                                     model.meshesIndices[modelMeshIndex] = @intCast(archiveMeshIndex);
// //                                     meshNameFound = true;
// //                                     break;
// //                                 }
// //                             }
// //                             if(!meshNameFound)
// //                             {
// //                                 print("model: mesh not found!\n", .{});
// //                                 std.process.exit(0);
// //                             }
// //                             print("{s}\n", .{meshes[archiveMeshIndex].name[0..meshes[archiveMeshIndex].nameLen]});
// //                         }
//                     }
//                 }
//             }
        }
//         while(mem.bytesToValue(u16, fileBufferPtrIterator) != 0x0101)
//             fileBufferPtrIterator+=1;
//         fileBufferPtrIterator+=3;
    }
//     print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
}
inline fn parseStrings(comptime string: []const u8, fileName: [*]const u8, fileNameLen: u64, dirfd: i32) void
{
//     _ = string;
    const mode: linux.mode_t = 0o755;
    const filefd: i32 = @intCast(linux.openat(dirfd, @ptrCast(fileName), .{.ACCMODE = .RDONLY}, mode));
    defer _ = linux.close(filefd);
    var stackBuffer: [0x100000*2]u8 align(0x1000) = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;
    _ = linux.read(filefd, &stackBuffer, 32);
    const tablesOffset: u64 = @as(*u32, @alignCast(@ptrCast(stackBufferPtr+12))).*;
    _ = linux.read(filefd, &stackBuffer, tablesOffset);
    var stringStart = stackBufferPtr;
    while(@intFromPtr(stackBufferPtr) < @intFromPtr(@as([*]u8, @ptrCast(&stackBuffer))+tablesOffset))
    {
        if(stackBufferPtr[0] == 0)
        {
            stringStart = stackBufferPtr+1;
        }
        if(CustomMem.memcmp(stackBufferPtr, string.ptr, string.len))
        {
            print("{s}:\n", .{fileName[0..fileNameLen]});
        }
//         if(@as(*align(1)u16, @ptrCast(stackBufferPtr)) == @as(u16, @bitCast(string[0..2])))
//         {
//             print();
//         }
        stackBufferPtr+=1;
    }
//     for(0..tablesOffset) |i|
//     {
//         if(@as(*align(1)u16, @ptrCast(stackBufferPtr+i)) == @as(u16, @bitCast(string[0..2])))
//         {
//
//         }
//     }
}
pub fn searchString(comptime string: []const u8) void
{
//     _ = string;
//     string.
    var level: u64 = 0;

    var stackBuffer: [0x100000]u8 align(0x1000) = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;
    var dirFDs: [512]i32 = undefined;
//     var direntPtrs: [512][*]u8 = undefined;
    var direntSizes: [512]u64 = undefined;
    var direntIndices: [512]u64 = undefined;
    const mode: linux.mode_t = 0o755;
    dirFDs[0] = @intCast(linux.open(".", .{.ACCMODE = .RDONLY, .DIRECTORY = true}, mode));
    defer _ = linux.close(dirFDs[0]);
    direntSizes[0] = @intCast(linux.getdents64(dirFDs[0], &stackBuffer, stackBuffer.len));
    direntIndices[0] = 0;
//     print("{d}\n", .{@intFromPtr(stackBufferPtr) - @intFromPtr(&stackBuffer)});

    jmp: while(true)
    {
        while(direntIndices[level] < direntSizes[level])
        {
//             const entry = @as(*align(1) linux.dirent64, @ptrCast(@as([*]u8, @ptrCast(stackBufferPtr))+direntIndices[level]));
            const entry = CustomMem.ptrCast(*align(1) linux.dirent64, CustomMem.ptrCast([*]u8, stackBufferPtr)+direntIndices[level]);

            const namePtr: [*]u8 = @ptrCast(&entry.name);
            var nameLen: u64 = 0;
            while(namePtr[nameLen] != 0)
                nameLen+=1;
            direntIndices[level] += entry.reclen;
            if(entry.type == linux.DT.REG)
            {
                const clbExt = [4]u8{'.', 'c', 'l', 'b'};
                if(@as(*align(1)u32, @ptrCast(namePtr+nameLen-4)).* == @as(u32, @bitCast(clbExt)))
                {
//                     for(0..level) |_|
//                     {
//                         print("    ", .{});
//                     }
//                     print("{s}\n", .{namePtr[0..nameLen]});
                    parseStrings(string, namePtr, nameLen, dirFDs[level]);
                }
            }
            if(entry.type == linux.DT.DIR and namePtr[0] != '.')
            {
                for(0..level) |_|
                {
                    print("    ", .{});
                }
                print("{s}\n", .{namePtr[0..nameLen]});
                stackBufferPtr += direntSizes[level];
                level+=1;
                dirFDs[level] = @intCast(linux.openat(dirFDs[level-1], @ptrCast(namePtr), .{.ACCMODE = .RDONLY}, mode));
                direntSizes[level] = @intCast(linux.getdents64(dirFDs[level], stackBufferPtr, stackBuffer.len));
                direntIndices[level] = 0;
            }
        }
        if(level > 0)
        {
            stackBufferPtr -= direntSizes[level-1];
            _ = linux.close(dirFDs[level]);
            level-=1;
            continue :jmp;
        }
        break;
    }
}
var hashIndex: u64 = undefined;
pub fn clb_convert(path: [*:0]const u8, srcDirfd: fd_t, archive: *Archive, ) void
{
    var stackBuffer: [0x10000]u8 align(0x1000) = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;
    const stdout = GlobalState.stdout;
//     var archive: ArchiveCustom = undefined;
    const srcfilefd: fd_t = CustomFS.openat(srcDirfd, path, .{.ACCMODE = .RDONLY});
    var fileStat: linux.Stat = undefined;
    _ = CustomFS.fstat(srcfilefd, &fileStat);
    const fileSize: u64 = @intCast(fileStat.size);
    const memoryBuffer = PageAllocator.map(fileSize);
    defer PageAllocator.unmap(memoryBuffer);
    const fileBuffer = memoryBuffer.ptr;

    _ = CustomFS.read(srcfilefd, fileBuffer, fileSize);
    _ = CustomFS.close(srcfilefd);
    const clb_Signature: [8]u8 = .{0x43, 0x52, 0x4c, 0x00, 0x60, 0x00, 0x41, 0x00};
    if(ptrOnValue(u64, fileBuffer).* != @as(u64, @bitCast(clb_Signature)))
    {
        print("incorrect clb signature!", .{});
        exit(0);
    }
    if(fileBuffer[8] != 8)
    {
        print("!= 8\n", .{});
        exit(0);
    }
    const clb_TablesOffsetsPtr: [*]u8 = fileBuffer+12;
    const stringsOffsetPtr: [*]u8 = fileBuffer+0x20;
    var bufferPtrItr = fileBuffer+32;
    var libraryNameLen: u64 = 0;
    while(bufferPtrItr[libraryNameLen] != 0)
        libraryNameLen+=1;
    stdout.print("{s}\n", .{bufferPtrItr[0..libraryNameLen]}) catch unreachable;
    bufferPtrItr += readFromPtr(u32, clb_TablesOffsetsPtr);
    const dataOffsetPtr = bufferPtrItr + readFromPtr(u32, fileBuffer+16);
    print("dataOffset: {x}\n", .{@intFromPtr(dataOffsetPtr)-@intFromPtr(fileBuffer)});
//     print("{x}\n\n", .{@intFromPtr(fileBufferPtrIterator) - @intFromPtr(fileBuffer)});
    if(readFromPtr(u16, bufferPtrItr) != 0x0383)
    {
        print("!= 0x0383\n", .{});
        exit(0);
    }
    const clbTable = readTable(&stackBufferPtr, bufferPtrItr);
    {
//         print("clbTable:\n", .{});
//         clbTable.printDataOffsets(fileBuffer, 4);
        // header tables
        if(readFromPtr(u16, clbTable.dataAfterHeaderPtr + clbTable.header[2][1]) != 0x0101)
        {
            print("!= 0x0101\n", .{});
            exit(0);
        }
        const headersTable = readTable(&stackBufferPtr, clbTable.dataAfterHeaderPtr + clbTable.header[2][1] + 3);
        {
            for(0..headersTable.tablesCount) |tableIndex|
            {
                bufferPtrItr = headersTable.dataAfterHeaderPtr + headersTable.header[tableIndex][1];
                const chunkType: u64 = readFromPtr(u16, bufferPtrItr);
                switch(chunkType)
                {
                    //             0x0005 =>//ANIM
                    //             {
                    //
                    //             },
//                     0x004b =>//OBJ
//                     {
//                         modelsCount+=1;
//                     },
                    0x0035 =>//MESH
                    {
                        archive.meshesCount+=1;
                    },
                    0x003d =>//TX
                    {
                        archive.texturesCount+=1;
                    },
//                     0x1669 =>//EFFECT
//                     {
//                         effectsCount+=1;
//                     },
//                     0x166f =>//MAT
//                     {
//                         materialsCount+=1;
//                     },
                    else =>
                    {
//                         stdout.print("unknown chunk type: {x}\n", .{chunkType}) catch unreachable;
//                         stdout.print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)}) catch unreachable;
// //                         var bufferPtrItr: [*]u8 = undefined;
//                         const blockTable = readTable(&stackBufferPtr, bufferPtrItr+4);
//                         {
//                             bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[1][1];
//                             const LibraryNameLen: u64 = bufferPtrItr[0];
//                             const LibraryNameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
//                             bufferPtrItr+=8;
//                             const NameLen: u64 = bufferPtrItr[0];
//                             const NameOffset: u64 = readFromPtr(u32, bufferPtrItr+4);
//                             stdout.print("{s}\n{s}\n\n", .{(stringsOffsetPtr+LibraryNameOffset)[0..LibraryNameLen], (stringsOffsetPtr+NameOffset)[0..NameLen] }) catch unreachable;
// //                             texture.name = stringsOffsetPtr+NameOffset;
// //                             texture.nameLen = @intCast(NameLen);
//                         }
                    }
                }
            }
//             archive.texturesCount = @intCast(texturesCount);
//             archive.meshesCount = @intCast(meshesCount.*);
//             archive.modelsCount = @intCast(modelsCount);
            stdout.print("texturesCount: {d}\n", .{archive.texturesCount}) catch unreachable;
            stdout.print("meshesCount: {d}\n", .{archive.meshesCount}) catch unreachable;
//             stdout.print("modelsCount: {d}\n", .{modelsCount}) catch unreachable;
//             print("effectsCount: {d}\n", .{effectsCount});
            archive.textures = (GlobalState.allocator.alloc(Archive.Texture, archive.texturesCount) catch unreachable).ptr;
            archive.meshes = (GlobalState.allocator.alloc(Archive.Mesh, archive.meshesCount) catch unreachable).ptr;
            archive.hashes = (GlobalState.allocator.alloc(u64, archive.texturesCount+archive.meshesCount) catch unreachable).ptr;
            archive.hashesCount = archive.texturesCount+archive.meshesCount;
//             archive.textures = allocInFixedBufferT(&memoryBufferItr, @sizeOf(Archive.Texture)*texturesCount, Archive.Texture);
//             archive.meshes = allocInFixedBufferT(&memoryBufferItr, @sizeOf(Archive.Mesh)*meshesCount, Archive.Mesh);
//             archive.models = allocInFixedBufferT(&memoryBufferItr, @sizeOf(Archive.Model)*modelsCount, Archive.Model);
            archive.texturesCount = 0;
//             effectsCount = 0;
            archive.meshesCount = 0;
//             modelsCount = 0;
            hashIndex = 0;
            for(0..headersTable.tablesCount) |tableIndex|
            {
                bufferPtrItr = headersTable.dataAfterHeaderPtr + headersTable.header[tableIndex][1];
                const chunkType: u64 =  readFromPtr(u16, bufferPtrItr);
                if(chunkType == 0x003d)
                {
                    bufferPtrItr+=4;
                    print("{d}\n", .{archive.texturesCount});
                    readChunk_Texture(stackBufferPtr, fileBuffer, bufferPtrItr, stringsOffsetPtr, dataOffsetPtr, archive);
                    stdout.print("\n", .{}) catch unreachable;
                    archive.texturesCount+=1;
                }
            }
            for(0..headersTable.tablesCount) |tableIndex|
            {
                bufferPtrItr = headersTable.dataAfterHeaderPtr + headersTable.header[tableIndex][1];
                const chunkType: u64 =  readFromPtr(u16, bufferPtrItr);
                if(chunkType == 0x0035)
                {
                    bufferPtrItr+=4;
                    print("{d}\n", .{archive.meshesCount});
                    readChunk_Mesh(stackBufferPtr, fileBuffer, bufferPtrItr, stringsOffsetPtr, dataOffsetPtr, archive);
//                     const mesh = &archive.meshes[archive.meshesCount];
                    stdout.print("\n", .{}) catch unreachable;
//                     P3N3U2C4T4P3
//                     const vertexFormat = [16]u8{'P','3','N','3','U','2','C','4','T','4','P','3',0,0,0,0};
//                     const vertexFormat: []const u8 = "P3N3U2C4T4P30000"[0..16];
//                     print("{s}\n", .{vertexFormat[0..16]});
//                     print("{s}\n", .{mesh.vertexFormat[0..16]});
//                     if(@as(u128, @bitCast(vertexFormat[0..16].*)) == readFromPtr(u128, &mesh.vertexFormat))
                    {
//                         var verticesStackBuffer: [64*4]u8 = undefined;
//                         var vertexOffsetPtr = mesh.verticesBuffer;
//                         var indexOffsetPtr = mesh.indicesBuffer;
//                         var indexAddition: u16 = 0;
//                         const indexTemplate = [6]u8{0,1,2,2,3,0};
//                         while(@intFromPtr(vertexOffsetPtr) < @intFromPtr(mesh.verticesBuffer) + mesh.verticesBufferSize)
//                         {
//                             memcpy(&verticesStackBuffer, vertexOffsetPtr, 64*4);
//                             const VertexPosition = struct
//                             {
//                                 x: f32,
//                                 y: f32,
//                             };
//                             var vertexPositions: [4]VertexPosition = undefined;
//                             for(0..4) |vertexIndex|
//                             {
//                                 vertexPositions[vertexIndex] = readFromPtr(VertexPosition, vertexOffsetPtr+vertexIndex*64);
//                             }
//                             var min_x: f32 = vertexPositions[0].x;
//                             var min_y: f32 = vertexPositions[0].y;
//                             var max_x: f32 = vertexPositions[0].x;
//                             var max_y: f32 = vertexPositions[0].y;
//                             for(1..3) |vertexIndex|
//                             {
//                                 if(vertexPositions[vertexIndex].x < min_x)
//                                 {
//                                     min_x = vertexPositions[vertexIndex].x;
//                                 }
//                                 if(vertexPositions[vertexIndex].y < min_y)
//                                 {
//                                     min_y = vertexPositions[vertexIndex].y;
//                                 }
//                                 if(vertexPositions[vertexIndex].x > max_x)
//                                 {
//                                     max_x = vertexPositions[vertexIndex].x;
//                                 }
//                                 if(vertexPositions[vertexIndex].y > max_y)
//                                 {
//                                     max_y = vertexPositions[vertexIndex].y;
//                                 }
//                             }
// //                             for(0..4) |vertexIndex|
// //                             {
// //                                 if(vertexPositions[vertexIndex].x == min_x and vertexPositions[vertexIndex].y == max_y)
// //                                 {
// //                                     memcpy(vertexOffsetPtr, ptrCast([*]u8, &verticesStackBuffer)+vertexIndex*64, 64);
// //                                     break;
// //                                 }
// //                             }
// //                             for(0..4) |vertexIndex|
// //                             {
// //                                 if(vertexPositions[vertexIndex].x == max_x and vertexPositions[vertexIndex].y == max_y)
// //                                 {
// //                                     memcpy(vertexOffsetPtr+64, ptrCast([*]u8, &verticesStackBuffer)+vertexIndex*64, 64);
// //                                     break;
// //                                 }
// //                             }
// //                             for(0..4) |vertexIndex|
// //                             {
// //                                 if(vertexPositions[vertexIndex].x == max_x and vertexPositions[vertexIndex].y == min_y)
// //                                 {
// //                                     memcpy(vertexOffsetPtr+64*2, ptrCast([*]u8, &verticesStackBuffer)+vertexIndex*64, 64);
// //                                     break;
// //                                 }
// //                             }
// //                             for(0..4) |vertexIndex|
// //                             {
// //                                 if(vertexPositions[vertexIndex].x == min_x and vertexPositions[vertexIndex].y == min_y)
// //                                 {
// //                                     memcpy(vertexOffsetPtr+64*3, ptrCast([*]u8, &verticesStackBuffer)+vertexIndex*64, 64);
// //                                     break;
// //                                 }
// //                             }
//                             for(0..6) |i|
//                             {
//                                 ptrOnValue(u16, indexOffsetPtr+i*2).* = indexTemplate[i]+indexAddition;
//                             }
//                             vertexOffsetPtr+=64*4;
//                             indexOffsetPtr+=2*6;
//                             indexAddition+=4;
//                         }
                    }
                    archive.meshesCount+=1;
                }
            }
//             for(0..headersTable.tablesCount) |tableIndex|
//             {
//                 bufferPtrItr = headersTable.dataAfterHeaderPtr + headersTable.header[tableIndex][1];
//                 const chunkType: u64 =  readFromPtr(u16, bufferPtrItr);
//                 if(chunkType == 0x004b)
//                 {
//                     bufferPtrItr+=4;
//                     readChunk_Model(stackBufferPtr, &memoryBufferItr, fileBuffer, bufferPtrItr, stringsOffsetPtr, dataOffsetPtr, &archive.models[modelsCount]);
//                     modelsCount+=1;
//                     stdout.print("\n", .{}) catch unreachable;
// //                     break;
//                 }
//             }
        }
    }
    stdout.print("\n", .{}) catch unreachable;
}
pub fn convertArchives(comptime archivesPaths: []const[*:0]const u8, srcDirfd: fd_t, dstDirfd: fd_t) void
{
    const stdout = GlobalState.stdout;
    var stackBuffer: [0x100000]u8 align(0x1000) = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;

    var texturesCount: u64 = 0;
    var meshesCount: u64 = 0;

    const clb_custom_fd: fd_t = CustomFS.openat(dstDirfd, "customArchive.clb", .{.ACCMODE = .WRONLY, .CREAT = true, .TRUNC = true});
    defer _ = CustomFS.close(clb_custom_fd);
    var archives: [archivesPaths.len]Archive = undefined;
    @memset(&archives, .{.texturesCount = 0, .meshesCount = 0});
    for(0..archivesPaths.len) |i|
    {
        clb_convert(archivesPaths[i], srcDirfd, &archives[i]);
        texturesCount += archives[i].texturesCount;
        meshesCount += archives[i].meshesCount;
//         break;
    }
    stdout.print("texturesCount: {d}\n", .{texturesCount}) catch unreachable;
    stdout.print("meshesCount: {d}\n", .{meshesCount}) catch unreachable;
    @as(*[4]u8, @ptrCast(stackBufferPtr)).* = [4]u8{'C', 'R', 'L', 'C'};
    ptrOnValue(u16, stackBufferPtr+4).* = @intCast(texturesCount);
    ptrOnValue(u16, stackBufferPtr+6).* = @intCast(meshesCount);
    stackBufferPtr+=8;
    for(archives) |archive|
    {
        const size = archive.hashesCount*8;
        memcpy(stackBufferPtr, @ptrCast(archive.hashes), size);
        stackBufferPtr+=size;
    }
    for(archives) |archive|
    {
        for(archive.textures[0..archive.texturesCount]) |texture|
        {
//             stackBufferPtr = &stackBuffer;
//             stackBufferPtr[0] = @intCast(texture.nameLen);
//             memcpy(stackBufferPtr+1, texture.name, texture.nameLen);
//             stdout.print("{s}\n", .{stackBufferPtr[0..texture.nameLen]}) catch unreachable;
//             stackBufferPtr+=texture.nameLen+1;
            ptrOnValue(u32, stackBufferPtr).* = texture.image.size;
            ptrOnValue(u32, stackBufferPtr+4).* = texture.image.mipSize;
            ptrOnValue(u16, stackBufferPtr+8).* = texture.image.width;
            ptrOnValue(u16, stackBufferPtr+10).* = texture.image.height;
            ptrOnValue(u32, stackBufferPtr+12).* = texture.image.format;
            stackBufferPtr[16] = texture.image.alignment;
            stackBufferPtr[17] = texture.image.mipsCount;
            stackBufferPtr+=18;
        }
    }
    for(archives) |archive|
    {
        for(archive.meshes[0..archive.meshesCount]) |mesh|
        {
            ptrOnValue(u32, stackBufferPtr).* = mesh.indicesBufferSize;
            ptrOnValue(u32, stackBufferPtr+4).* = mesh.verticesBufferSize;
            ptrOnValue(u16, stackBufferPtr+8).* = mesh.verticesCount;
            stackBufferPtr+=10;
        }
    }
//     exit(0);
    _ = CustomFS.write(clb_custom_fd, &stackBuffer, @intFromPtr(stackBufferPtr)-@intFromPtr(&stackBuffer));
    for(archives) |archive|
    {
        for(archive.textures[0..archive.texturesCount]) |texture|
        {
            _ = CustomFS.write(clb_custom_fd, texture.image.data, texture.image.size);
        }
    }
    for(archives) |archive|
    {
        for(archive.meshes[0..archive.meshesCount]) |mesh|
        {
           _ = CustomFS.write(clb_custom_fd, mesh.indicesBuffer, mesh.indicesBufferSize);
           _ = CustomFS.write(clb_custom_fd, mesh.verticesBuffer, mesh.verticesBufferSize);
        }
    }
//     for(0..texturesCount) |i|
//     {
//
//     }
//     _ = linux.write(clb_custom_fd, &stackBuffer, 8);


    for(&archives) |*archive|
    {
        archive.unload();
    }
//     for(archive.textures[0..archive.texturesCount]) |texture|
//     {
//         stackBufferPtr = &stackBuffer;
//         stackBufferPtr[0] = @intCast(texture.nameLen);
//         memcpy(stackBufferPtr+1, texture.name, texture.nameLen);
//         stackBufferPtr+=texture.nameLen+1;
//         ptrOnValue(u32, stackBufferPtr).* = texture.image.size;
//         ptrOnValue(u32, stackBufferPtr+4).* = texture.image.mipSize;
//         ptrOnValue(u16, stackBufferPtr+8).* = texture.image.width;
//         ptrOnValue(u16, stackBufferPtr+10).* = texture.image.height;
//         ptrOnValue(u32, stackBufferPtr+12).* = texture.image.format;
//         stackBufferPtr[16] = texture.image.alignment;
//         stackBufferPtr[17] = texture.image.mipsCount;
//         stackBufferPtr+=18;
//         _ = CustomFS.write(clb_custom_fd, &stackBuffer, 1+texture.nameLen+18);
// //         _ = CustomFS.write(clb_custom_fd, texture.image.data, texture.image.size);
//     }
//     for(archive.textures[0..archive.texturesCount]) |texture|
//     {
//         _ = CustomFS.write(clb_custom_fd, texture.image.data, texture.image.size);
//     }

//     for(models[0..modelsCount]) |model|
//     {
//         fileBufferStackPtr = &fileBufferStack;
//         fileBufferStackPtr[0] = @intCast(model.nameLen);
//         memcpy(fileBufferStackPtr+1, model.name, model.nameLen);
//         fileBufferStackPtr+=model.nameLen+1;
//         fileBufferStackPtr[0] = model.meshesCount;
//         fileBufferStackPtr+=1;
//         for(0..model.meshesCount) |meshIndex|
//             fileBufferStackPtr[meshIndex] = model.meshesIndices[meshIndex];
//         _ = linux.write(clb_custom_fd, &fileBufferStack, 1+model.nameLen+1+model.meshesCount);
//     }
//     print("\n", .{});
}
