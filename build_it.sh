LIBRARY_PATH="$(pwd)/"
export LIBRARY_PATH

LD_LIBRARY_PATH="$(pwd)/"
export LD_LIBRARY_PATH

zig build-lib -dynamic src/gpa_alloc.zig
fpm run