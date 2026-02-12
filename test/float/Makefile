.PHONY: all test golden debug
all:
	../../build/bin/clang -S -emit-llvm fma.c
test:
	../../build/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm outputs/fma.ll -o outputs/fma.s
golden:
	llc -march=x86 -O0 -filetype=asm outputs/fma.ll -o outputs/golden.s
debug:
	gdb --ex "b Cpu0DAGToDAGISel::Select" --args ../../build/bin/llc -march=cpu0 -debug -relocation-model=pic -filetype=asm outputs/fma.ll -o -