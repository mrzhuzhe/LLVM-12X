# LLVM BACKEND 

> A test playground for llvm backend

Reffer: https://jonathan2251.github.io/lbd/llvmstructure.html

## Base on  

branch origin/release/12.x

commit id e8a397203c67adbeae04763ce25c6a5ae76af52c

## Build 

Baseline

```
cmake --install-prefix $PWD/../install -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang" \
    -DLLVM_OPTIMIZED_TABLEGEN=On \
    -DLLVM_PARALLEL_COMPILE_JOBS=4 -DLLVM_PARALLEL_LINK_JOBS=1 ../llvm

```

Chapter 1

```

```