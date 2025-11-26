cuda_path=/opt/cuda
all:
#	clang++	-S kernel.cu --cuda-gpu-arch=sm_70 --cuda-path=${cuda_path} -emit-llvm -v
	${cuda_path}/bin/nvcc --ptx kernel.cu 
	clang++ sample.cpp -o sample.o -g -I${cuda_path}/include -lcuda

asm:
	${cuda_path}/bin/ptxas  kernel.ptx

dump:
	${cuda_path}/bin/cuobjdump --dump-elf elf.o > elf.s