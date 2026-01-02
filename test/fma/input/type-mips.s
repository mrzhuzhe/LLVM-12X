	.text
	.abicalls
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.text
	.file	"type.c"
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:                                # %entry
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$1, $zero, 0
	sw	$zero, 12($fp)
	lui	$1, 17142
	mtc1	$1, $f0
	swc1	$f0, 8($fp)
	lui	$1, 17380
	mtc1	$1, $f0
	swc1	$f0, 4($fp)
	lwc1	$f0, 8($fp)
	lwc1	$f1, 4($fp)
	mul.s	$f0, $f0, $f1
	swc1	$f0, 0($fp)
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end0:
	.size	main, ($func_end0)-main
                                        # -- End function
	.ident	"clang version 12.0.1 (git@github.com:mrzhuzhe/LLVM-12X.git 06dd364eeb44148f0b3bc63a835d3740f4099e20)"
	.section	".note.GNU-stack","",@progbits
	.text
