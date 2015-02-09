	.file	"badcnt.c"
	.text
	.p2align 4,,15
	.globl	thread
	.type	thread, @function
thread:
.LFB93:
	.cfi_startproc
	movl	(%rdi), %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jle	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	movl	cnt(%rip), %edx
	addl	$1, %eax
	addl	$1, %edx
	cmpl	%ecx, %eax
	movl	%edx, cnt(%rip)
	jne	.L6
.L5:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE93:
	.size	thread, .-thread
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"usage: %s <niters>\n"
.LC1:
	.string	"BOOM! cnt=%d\n"
.LC2:
	.string	"OK cnt=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB92:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	cmpl	$2, %edi
	je	.L9
	movq	(%rsi), %rdx
	movl	$1, %edi
	movl	$.LC0, %esi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%edi, %edi
	call	exit
.L9:
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	leaq	12(%rsp), %rcx
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	movl	$thread, %edx
	movl	%eax, 12(%rsp)
	call	Pthread_create
	leaq	12(%rsp), %rcx
	leaq	24(%rsp), %rdi
	movl	$thread, %edx
	xorl	%esi, %esi
	call	Pthread_create
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	Pthread_join
	movq	24(%rsp), %rdi
	xorl	%esi, %esi
	call	Pthread_join
	movl	12(%rsp), %ecx
	movl	cnt(%rip), %eax
	leal	(%rcx,%rcx), %edx
	cmpl	%eax, %edx
	movl	cnt(%rip), %edx
	je	.L10
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L11:
	xorl	%edi, %edi
	call	exit
.L10:
	movl	$.LC2, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L11
	.cfi_endproc
.LFE92:
	.size	main, .-main
	.globl	cnt
	.bss
	.align 4
	.type	cnt, @object
	.size	cnt, 4
cnt:
	.zero	4
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
