export inpit_path=/home/sanszhu/Code/code/lbd/lbdex/input
bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch3.cpp -emit-llvm -o ch3.bc

#  chapter 2 error Could not allocate target machine!
#  chapter 3_1 error ... Assertion failed: (MRI && "Unable to create reg info"), function initAsmInfo
#  chapter 3_2 error does not support generation of this file type!
#  chapter 3_3 LLVM ERROR: Cannot select: t6: ch = Cpu0ISD::Ret t4, Register:i32 $lr
#  chapter 3_3 Hang
bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch3.bc -o ch3.cpu0.s
# bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch3.bc -debug-pass=Structure -o ch3.cpu0.s
# bin/llc -march=cpu0 -relocation-model=pic -filetype=asm -print-before-all -print-after-all ch3.bc -o -    # notice this bc is compiled with O2

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch3_largeframe.cpp -emit-llvm -o ch3_largeframe.bc
bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch3_largeframe.bc -o -

bin/llc -march=cpu0 -relocation-model=pic -filetype=asm $inpit_path/ch4_math.ll -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch4_1_addsuboverflow.cpp -emit-llvm -o ch4_1_addsuboverflow.bc

bin/llc -march=cpu0 -relocation-model=pic -filetype=asm -cpu0-enable-overflow=true ch4_1_addsuboverflow.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch4_1_mult.cpp -emit-llvm -o ch4_1_mult.bc
bin/llc -view-dag-combine1-dags -march=cpu0 -relocation-model=pic -filetype=asm ch4_1_mult.bc -o ch4_1_mult.cpu0.s
xdot /tmp/dag._Z9test_multv-f2a6fb.dot

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch4_1_mod.cpp -emit-llvm -o ch4_1_mod.bc
bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch4_1_mod.bc -debug -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch4_1_rotate.cpp -emit-llvm -o ch4_1_rotate.bc
llvm-dis ch4_1_rotate.bc -o -

bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch4_1_rotate.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch4_2_logic.cpp -emit-llvm -o ch4_2_logic.bc
llvm-dis ch4_2_logic.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=pic -filetype=asm ch4_2_logic.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032II -relocation-model=pic -filetype=asm ch4_2_logic.bc -o -


bin/clang -target mips-unknown-linux-gnu -O2 -c -c $inpit_path/ch4_2_slt_explain.cpp -emit-llvm -o ch4_2_slt_explain.bc
bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=static -filetype=asm ch4_2_slt_explain.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032II -relocation-model=static -filetype=asm ch4_2_slt_explain.bc -o -

# chapter 5
bin/llc -march=cpu0 -relocation-model=pic -filetype=obj ch4_1_mod.bc -o ch4_1_mod.o
bin/llc -march=cpu0el -relocation-model=pic -filetype=obj ch4_1_mod.bc -o ch4_1_mod.cpu0el.o
objdump -s ch4_1_mod.cpu0el.o

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch6_1.cpp -emit-llvm -o ch6_1.bc
bin/llc -march=cpu0 -relocation-model=static -cpu0-use-small-section=false -filetype=asm -debug ch6_1.bc -o -

bin/llc -march=cpu0 -relocation-model=static -cpu0-use-small-section=true -filetype=asm -debug ch6_1.bc -o -
bin/llc -march=cpu0 -relocation-model=pic -cpu0-use-small-section=false -filetype=asm -debug ch6_1.bc -o -
bin/llc -march=cpu0 -relocation-model=pic -cpu0-use-small-section=true -filetype=asm -debug ch6_1.bc -o -

#  https://llvm.org/docs/WritingAnLLVMBackend.html#the-selectiondag-legalize-phase

#   bin/llvm-dis ch3.bc -o -
#   bin/llc -march=cpu0 -mcpu=help