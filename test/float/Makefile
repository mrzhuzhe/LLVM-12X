.PHONY: all test golden debug comapre
all:
	../../build/bin/clang -S -emit-llvm fma.c -o outputs/fma.ll
test:
	../../build/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm outputs/fma.ll -o outputs/fma.s
compare:
	../../build/bin/clang -S -emit-llvm compare.c -o outputs/compare.ll
	../../build/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm outputs/compare.ll -o outputs/compare.s

comparefunction:
	../../build/bin/clang -S -emit-llvm comparefunction.c -o outputs/comparefunction.ll
	../../build/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm outputs/comparefunction.ll -o outputs/comparefunction.s

golden:
	llc -march=x86 -O0 -filetype=asm outputs/fma.ll -o outputs/golden.s

goldenfunction:
	llc -march=x86 -O0 -filetype=asm outputs/comparefunction.ll -o outputs/goldenfunction.s

debug:
	gdb --ex "b MachineFrameInfo::print" \
	--args ../../build/bin/llc -march=cpu0 -debug -relocation-model=pic -filetype=asm outputs/fma.ll -o outputs/fma.s

MIPS:
	gdb --ex "b MipsFastISel::selectLoad" \
	 --ex "b MachineFrameInfo::print" \
	--args ../../build/bin/llc -march=mips -debug -relocation-model=pic -filetype=asm outputs/fma.ll -o outputs/fma-mips.s
# MIPS online pipline analysis https://godbolt.org/z/qYKx56eh6