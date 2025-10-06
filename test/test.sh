bin/clang -target mips-unknown-linux-gnu -c /lbdex/input/ch3.cpp -emit-llvm -o ch3.bc

#bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch3.bc -o ch3.cpu0.s

#bin/llvm-dis ch3.bc -o -