

all:
	../../build/bin/clang -S -emit-llvm fma.c
test:
	../../build/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm fma.ll -o -