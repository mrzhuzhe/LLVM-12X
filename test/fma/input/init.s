	.text
	.section .mdebug.abiO32
	.previous
	.file	"init.c"
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
	.ent	main                            # @main
main:
	.cfi_startproc
	.frame	$fp,8,$lr
	.set	zztest
	.mask 	0x00001000,-4
	.set	noreorder
	.set	nomacro
# %bb.0:                                # %entry
	addiu	$sp, $sp, -8
	.cfi_def_cfa_offset 8
	addu	$zero, 8, $zero
	st	$fp, 4($sp)                     # 4-byte Folded Spill
	.cfi_offset 12, -4
	move	$fp, $sp
	.cfi_def_cfa_register 12
	addiu	$2, $zero, 0
	st	$2, 0($fp)
	move	$sp, $fp
	ld	$fp, 4($sp)                     # 4-byte Folded Reload
	addiu	$sp, $sp, 8
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	main
$func_end0:
	.size	main, ($func_end0)-main
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 12.0.1 (git@github.com:mrzhuzhe/LLVM-12X.git 5e630f6c7fa4722cbb36ad7e676020935b96ef95)"
	.section	".note.GNU-stack","",@progbits
