const std = @import("std");

var gpa: std.heap.GeneralPurposeAllocator(.{}) = undefined;
var allocator: std.mem.Allocator = undefined;
var validPointer = false;

//? This is literally my fish game allocator modified to work with fortran.

//* ON/OFF SWITCH. ==============================================

export fn initialize() void {
    // Thanks to Eyad for notifying that this will need to be [.init]
    // instead of [{}] when 0.14 releases.
    // todo: 0.14 release fix.
    // Freakman notes that it can literally be called as so:
    // gpa = .init;
    gpa = std.heap.GeneralPurposeAllocator(.{}){};
    allocator = gpa.allocator();
    validPointer = true;
}

export fn terminate() void {
    const deinitStatus = gpa.deinit();
    if (deinitStatus == .leak) {
        std.log.err("[Allocator]: Error, memory leak.", .{});
    }
    validPointer = false;
}

//* PUBLIC API. ===========================================================

export fn alloc(n: usize) [*]u8 {
    const zigThing = allocator.alloc(u8, n) catch |err| {
        std.log.err("{}", .{err});
        std.process.exit(1);
    };
    return zigThing.ptr;
}

export fn free(memory: [*]u8, sizeOfMemory: isize) void {
    const hackjob: []u8 = memory[0..@intCast(sizeOfMemory)];
    allocator.free(hackjob);
}

///
/// Fortan only has c_size_t.
///
/// We will use this to cast it and let Zig catch it. (I hope)
///
export fn realloc(oldMem: [*]u8, oldSize: isize, newSize: isize) [*]u8 {
    const hackjob: []u8 = oldMem[0..@intCast(oldSize)];

    const zigThing: []u8 = allocator.realloc(hackjob, @intCast(newSize)) catch |err| {
        std.log.err("{}", .{err});
        std.process.exit(1);
    };

    return zigThing.ptr;
}
