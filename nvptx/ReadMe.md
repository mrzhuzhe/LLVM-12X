https://llvm.org/docs/NVPTXUsage.html

```
 export llvm_path=/home/sanszhu/Code/code/llvm-project/build
 $llvm_path/bin/llc -mcpu=sm_80 test.ll -o kernel.ptx
 $llvm_path/clang++ sample.cpp -o sample -O2 -g -I/usr/local/cuda-5.5/include -lcuda

```