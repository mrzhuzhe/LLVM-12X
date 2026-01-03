bin_path=../../build/bin

all:
	echo 123
genInp:
	${bin_path}/clang -S input/type.c -emit-llvm -o input/type.ll
test:
	${bin_path}/llc -march=cpu0 -debug -filetype=asm input/type.ll -o input/type.s

genInpx86:
	clang -S input/type.c -emit-llvm -o input/typex86.ll
testx86:
	llc -march=x86 -filetype=asm input/typex86.ll -o input/typex-x86.s
# https://alammori.com/basics/floating-point-hardware-implementation
genInpMips:
	${bin_path}/clang --target=mips -S input/type.c -emit-llvm -o input/typeMips.ll

testMips:
	${bin_path}/llc -march=mips -relocation-model=pic -filetype=asm input/typeMips.ll -o input/type-mips.s

testinit:
	${bin_path}/clang -S input/init.c -emit-llvm -o input/init.ll
	${bin_path}/llc -march=cpu0 -debug -filetype=asm input/init.ll -o input/init.s