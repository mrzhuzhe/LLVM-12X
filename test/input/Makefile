

all:
	../../build/bin/clang -S -emit-llvm fma.c
test:
	../../build/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm fma.ll -o -
debug:
	gdb --ex "b Cpu0DAGToDAGISel::Select" --args ../../build/bin/llc -march=cpu0 -debug -relocation-model=pic -filetype=asm fma.ll -o -