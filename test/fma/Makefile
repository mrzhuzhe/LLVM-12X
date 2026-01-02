bin_path=../../build/bin

all:
	echo 123
genInp:
	${bin_path}/clang -S input/type.c -emit-llvm -o input/type.ll
test:
	${bin_path}/llc -march=cpu0 -filetype=asm input/type.ll -o input/type.s

genInpx86:
	clang -S input/type.c -emit-llvm -o input/typex86.ll
testx86:
	llc -march=x86 -filetype=asm input/typex86.ll -o input/typex-x86.s