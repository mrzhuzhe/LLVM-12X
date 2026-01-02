	.file	"type.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function main
.LCPI0_0:
	.long	0x43e40000                      # float 456
.LCPI0_1:
	.long	0x42f60000                      # float 123
	.text
	.globl	main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$16, %esp
	movl	$0, -16(%ebp)
	movss	.LCPI0_1, %xmm0                 # xmm0 = [1.23E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, -8(%ebp)
	movss	.LCPI0_0, %xmm0                 # xmm0 = [4.56E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, -4(%ebp)
	movss	-8(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	mulss	-4(%ebp), %xmm0
	movss	%xmm0, -12(%ebp)
	xorl	%eax, %eax
	addl	$16, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 22.0.0git (https://github.com/llvm/llvm-project.git 08c1e9e80a3dcda4112751db0d8bd8828e1dc6bb)"
	.section	".note.GNU-stack","",@progbits
