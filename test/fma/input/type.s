	.text
	.section .mdebug.abiO32
	.previous
	.file	"type.c"
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
	.ent	main                            # @main
main:
	.cfi_startproc
	.frame	$fp,40,$lr
	.mask 	0x00005200,-4
	.set	noreorder
	.set	nomacro
# %bb.0:                                # %entry
	addiu	$sp, $sp, -40
	.cfi_def_cfa_offset 40
	st	$lr, 36($sp)                    # 4-byte Folded Spill
	st	$fp, 32($sp)                    # 4-byte Folded Spill
	st	$9, 28($sp)                     # 4-byte Folded Spill
	.cfi_offset 14, -4
	.cfi_offset 12, -8
	.cfi_offset 9, -12
	move	$fp, $sp
	.cfi_def_cfa_register 12
	addiu	$9, $zero, 0
	st	$9, 24($fp)
	lui	$2, 17142
	st	$2, 20($fp)
	lui	$2, 17380
	st	$2, 16($fp)
	ld	$4, 20($fp)
	ld	$5, 16($fp)
	jsub	__mulsf3
	nop
	st	$2, 12($fp)
	addu	$2, $zero, $9
	move	$sp, $fp
	ld	$9, 28($sp)                     # 4-byte Folded Reload
	ld	$fp, 32($sp)                    # 4-byte Folded Reload
	ld	$lr, 36($sp)                    # 4-byte Folded Reload
	addiu	$sp, $sp, 40
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	main
$func_end0:
	.size	main, ($func_end0)-main
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 12.0.1 (git@github.com:mrzhuzhe/LLVM-12X.git cecc0753a172812bda42ab66b190221f780e710a)"
	.section	".note.GNU-stack","",@progbits
