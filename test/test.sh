export inpit_path=/home/sanszhu/Code/code/lbd/lbdex/input

#   bin/llvm-dis ch3.bc -o -
#   bin/llc -march=cpu0 -mcpu=help

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


bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch7_1_localpointer.cpp -emit-llvm -o ch7_1_localpointer.bc
bin/llvm-dis ch7_1_localpointer.bc -o -

bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch7_1_localpointer.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch7_1_char_in_struct.cpp -emit-llvm -o ch7_1_char_in_struct.bc
bin/llvm-dis ch7_1_char_in_struct.bc -o -

bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch7_1_char_in_struct.bc -o -
bin/llc -march=cpu0 -relocation-model=static -filetype=asm ch7_1_char_short.bc -o -

bin/llvm-dis ch7_1_char_short.bc -o -

bin/llc -march=cpu0 -relocation-model=pic -filetype=asm $inpit_path/ch7_1_bool2.ll -o -
bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch7_1_longlong.cpp -emit-llvm -o ch7_1_longlong.bc
bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=pic -filetype=asm ch7_1_longlong.bc -o -

bin/clang -target mips-unknown-linux-gnu -emit-llvm -S $inpit_path/ch7_1_fmul.c

bin/llc -march=cpu0 ch7_1_fmul.ll -relocation-model=static -o -
# bin/llc -march=cpu0 -relocation-model=static -filetype=asm $inpit_path/ch7_1_globalstructoffset.bc -o -
# bin/llc -march=cpu0 -debug -relocation-model=static -filetype=asm ch6_2.bc -o ch6_2.cpu0.static.s

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch7_1_vector.cpp -emit-llvm -o ch7_1_vector.bc
bin/llvm-dis ch7_1_vector.bc -o -

bin/llc -march=cpu0 -mcpu=cpu032II -relocation-model=pic -filetype=asm ch7_1_vector.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch8_1_1.cpp -emit-llvm -o ch8_1_1.bc
bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=pic -filetype=asm ch8_1_1.bc -o -

bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=pic -filetype=obj ch8_1_1.bc -o ch8_1_1.cpu0.o
hexdump ch8_1_1.cpu0.o

bin/llc -march=cpu0 -mcpu=cpu032II -relocation-model=pic -filetype=asm ch8_1_1.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch8_2_longbranch.cpp -emit-llvm -o ch8_2_longbranch.bc
bin/llvm-dis ch8_2_longbranch.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032II -relocation-model=pic -filetype=asm -force-cpu0-long-branch ch8_2_longbranch.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch8_2_deluselessjmp.cpp -emit-llvm -o ch8_2_deluselessjmp.bc
bin/llc -march=cpu0 -relocation-model=static -filetype=asm -stats ch8_2_deluselessjmp.bc -o -
# -enable-cpu0-del-useless-jmp=fals

bin/clang -O1 -target mips-unknown-linux-gnu -c $inpit_path/ch8_2_select.cpp -emit-llvm -o ch8_2_select.bc
bin/llvm-dis ch8_2_select.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=static -filetype=asm ch8_2_select.bc -o -

bin/clang -O1 -target mips-unknown-linux-gnu -c $inpit_path/ch8_2_select_global_pic.cpp -emit-llvm -o ch8_2_select_global_pic.bc
bin/llvm-dis ch8_2_select_global_pic.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=pic -filetype=asm ch8_2_select_global_pic.bc -o -

bin/clang -O3 -target mips-unknown-linux-gnu -c $inpit_path/ch8_2_phinode.cpp -emit-llvm -o ch8_2_phinode.bc
bin/llvm-dis ch8_2_phinode.bc -o -


bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_1.cpp -emit-llvm -o ch9_1.bc
llc -march=mips -relocation-model=pic -filetype=asm ch9_1.bc -o ch9_1.mips.s

bin/clang -O3 -target mips-unknown-linux-gnu -c $inpit_path/ch9_incoming.cpp -emit-llvm -o ch9_incoming.bc
bin/llvm-dis ch9_incoming.bc -o -
bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch9_1.bc -o ch9_1.cpu0.s

bin/clang -O3 -target mips-unknown-linux-gnu -c $inpit_path/ch9_outgoing.cpp -emit-llvm -o ch9_outgoing.bc
bin/llvm-dis ch9_outgoing.bc -o -

bin/llc -march=cpu0 -mcpu=cpu032I -view-dag-combine1-dags -relocation-model=static -filetype=asm ch9_outgoing.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032I -cpu0-s32-calls=true -relocation-model=pic -filetype=asm ch9_1.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032II -cpu0-s32-calls=false -relocation-model=pic -filetype=asm ch9_1.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_1_2.cpp -emit-llvm -o ch9_1_2.bc
llvm-dis ch9_1_2.bc -o - 
bin/llc -march=cpu0 -mcpu=cpu032II -cpu0-s32-calls=true -relocation-model=static -filetype=asm ch9_1_2.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032II -cpu0-s32-calls=true -relocation-model=static -filetype=asm ch9_1_2.bc -debug -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_1_struct.cpp -emit-llvm -o ch9_1_struct.bc
bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=pic -filetype=asm ch9_1_struct.bc -o -

bin/clang -O1 -target mips-unknown-linux-gnu -c $inpit_path/ch9_2_tailcall.cpp -emit-llvm -o ch9_2_tailcall.bc
bin/llvm-dis ch9_2_tailcall.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032II -relocation-model=static -filetype=asm -enable-cpu0-tail-calls ch9_2_tailcall.bc -stats -o -

bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=static -filetype=asm ch9_2_tailcall.bc -o -

# more args
bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_3_vararg.cpp -emit-llvm -o ch9_3_vararg.bc
bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch9_3_vararg.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_3_alloc.cpp -emit-llvm -o ch9_3_alloc.bc
bin/llc -march=cpu0 -mcpu=cpu032I -cpu0-s32-calls=false -relocation-model=pic -filetype=asm ch9_3_alloc.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_gprestore.cpp -emit-llvm -o ch9_gprestore.bc
bin/llc -march=cpu0 -mcpu=cpu032II-cpu0-s32-calls=true -relocation-model=pic -filetype=asm ch9_gprestore.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032II-cpu0-s32-calls=true -relocation-model=pic -filetype=asm ch9_gprestore.bc -cpu0-no-cpload -cpu0-reserve-gp -o -
bin/llc -march=mips -relocation-model=pic -filetype=asm ch9_gprestore.bc -o -
bin/llc -march=cpu0 -relocation-model=pic -filetype=obj ch9_1.bc -o ch9_1.cpu0.o

hexdump  ch9_1.cpu0.o
cat ch9_1.cpu0.s

llvm-dis ch9_3_alloc.bc -o ch9_3_alloc.ll
bin/llc -march=cpu0 -mcpu=cpu032I -cpu0-s32-calls=false -relocation-model=pic -filetype=asm ch9_3_alloc.bc -o ch9_3_alloc.cpu0.s
cat ch9_3_alloc.cpu0.s

bin/clang -O0 -target mips-unknown-linux-gnu -c $inpit_path/ch9_3_longlongshift.cpp -emit-llvm -o ch9_3_longlongshift.bc
bin/llvm-dis ch9_3_longlongshift.bc -o -

bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=static -filetype=asm ch9_3_longlongshift.bc -o -
bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_3_stacksave.cpp -emit-llvm -o ch9_3_stacksave.bc
bin/llvm-dis ch9_3_stacksave.bc -o -
bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=static -filetype=asm ch9_3_stacksave.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_3_frame_return_addr.cpp -emit-llvm -o ch9_3_frame_return_addr.bc
bin/llvm-dis ch9_3_frame_return_addr.bc -o -
bin/llc -march=cpu0 -relocation-model=static -filetype=asm ch9_3_frame_return_addr.bc -o -

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_3_detect_exception.cpp -emit-llvm -o ch9_3_detect_exception.bc
bin/llvm-dis ch9_3_detect_exception.bc -o -

llvm-readelf -s ch9_1.cpu0.o 
llvm-readelf -tr ch9_1.cpu0.o 
llvm-readelf -h ch9_1.cpu0.o
llvm-readelf -l ch9_1.cpu0.o
llvm-readelf -S ch9_1.cpu0.o

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_1.cpp -emit-llvm -o ch9_1.bc
bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch9_1.bc -o ch9_1.cpu0.s 
cat ch9_1.cpu0.s

bin/llc -march=cpu0 -relocation-model=pic -filetype=obj ch9_1.bc -o ch9_1.cpu0.o
llvm-objdump -s ch9_1.cpu0.o

bin/clang -target mips-unknown-linux-gnu -c $inpit_path/ch9_3.cpp -emit-llvm -o ch9_3.bc

bin/clang -c $inpit_path/ch11_1.cpp -emit-llvm -o ch11_1.bc
bin/llc -march=cpu0 -relocation-model=pic -filetype=obj ch11_1.bc -o ch11_1.cpu0.o

bin/llvm-objdump -d ch11_1.cpu0.o

bin/llc -march=cpu0 -relocation-model=pic -filetype=obj -debug-only=asm-matcher,cpu0-asm-parser ch11_1.bc -o ch11_1.cpu0.o

bin/clang -target mips-unknown-linux-gnu -c ch11_2.cpp -emit-llvm -o ch11_2.bc
bin/llc -march=cpu0 -relocation-model=static -filetype=asm ch11_2.bc -o -
