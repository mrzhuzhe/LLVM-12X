# LLVM BACKEND 

> A test playground for llvm backend

Reffer: https://jonathan2251.github.io/lbd/llvmstructure.html

## Intro

Branch origin/release/12.x

Commit id e8a397203c67adbeae04763ce25c6a5ae76af52c

## Branches 

main(Baseline)

```
cmake --install-prefix $PWD/../install -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang" \
    -DLLVM_OPTIMIZED_TABLEGEN=On \
    -DLLVM_PARALLEL_COMPILE_JOBS=4 -DLLVM_PARALLEL_LINK_JOBS=1 ../llvm

```

Chapter2

add CPU0 target https://github.com/mrzhuzhe/LLVM-12X/commit/7abbd8ae8f4b0926571f732734f3262a50106979

add test case https://github.com/mrzhuzhe/LLVM-12X/commit/13f78de9f0a83c355a02193cb35b5e1cf13d3b34

add target implement  https://github.com/mrzhuzhe/LLVM-12X/commit/86199a22129fa655c7eb0c897ae7ab9eee667568

```

```