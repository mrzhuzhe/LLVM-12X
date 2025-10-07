bin/clang -target mips-unknown-linux-gnu -c /home/chernoalpha/Code/lbdex/input/ch3.cpp -emit-llvm -o ch3.bc

#  chapter 2 error Could not allocate target machine!
#  chapter 3_1 error ... Assertion failed: (MRI && "Unable to create reg info"), function initAsmInfo
#  chapter 3_2 error does not support generation of this file type!
bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch3.bc -o ch3.cpu0.s

#   bin/llvm-dis ch3.bc -o -
#   bin/llc -march=cpu0 -mcpu=help