	.file	"goodcnt.c"
	.text
	.p2align 4,,15
	.globl	thread
	.type	thread, @function
thread:
.LFB93:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	(%rdi), %ebp
	testl	%ebp, %ebp
	jle	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$mutex, %edi
	addl	$1, %ebx
	call	P
	movl	cnt(%rip), %eax
	movl	$mutex, %edi
	addl	$1, %eax
	movl	%eax, cnt(%rip)
	call	V
	cmpl	%ebp, %ebx
	jne	.L6
.L5:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
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
	je	.L10
	movq	(%rsi), %rdx
	movl	$1, %edi
	movl	$.LC0, %esi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%edi, %edi
	call	exit
.L10:
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	xorl	%esi, %esi
	movl	$1, %edx
	movl	$mutex, %edi
	movl	%eax, 12(%rsp)
	call	Sem_init
	leaq	12(%rsp), %rcx
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	movl	$thread, %edx
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
	je	.L11
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L12:
	xorl	%edi, %edi
	call	exit
.L11:
	movl	$.LC2, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L12
	.cfi_endproc
.LFE92:
	.size	main, .-main
	.comm	mutex,32,32
	.globl	cnt
	.bss
	.align 4
	.type	cnt, @object
	.size	cnt, 4
cnt:
	.zero	4
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
