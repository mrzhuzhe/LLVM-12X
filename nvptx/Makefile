cuda_path=/opt/cuda
all:
#	clang++	-S kernel.cu --cuda-gpu-arch=sm_70 --cuda-path=${cuda_path} -emit-llvm -v
	${cuda_path}/bin/nvcc --ptx kernel.cu 