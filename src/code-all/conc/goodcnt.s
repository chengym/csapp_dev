	.file	"goodcnt.c"
	.text
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	(%rdi), %ebp
	testl	%ebp, %ebp
	jle	.L2
	movl	$0, %ebx
.L3:
	movl	$mutex, %edi
	call	P
	movl	cnt(%rip), %eax
	addl	$1, %eax
	movl	%eax, cnt(%rip)
	movl	$mutex, %edi
	call	V
	addl	$1, %ebx
	cmpl	%ebp, %ebx
	jne	.L3
.L2:
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
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
	.text
	.globl	main
	.type	main, @function
main:
.LFB92:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	cmpl	$2, %edi
	je	.L6
	movq	(%rsi), %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %edi
	call	exit
.L6:
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 12(%rsp)
	movl	$1, %edx
	movl	$0, %esi
	movl	$mutex, %edi
	call	Sem_init
	leaq	12(%rsp), %rcx
	movl	$thread, %edx
	movl	$0, %esi
	leaq	16(%rsp), %rdi
	call	Pthread_create
	leaq	12(%rsp), %rcx
	movl	$thread, %edx
	movl	$0, %esi
	leaq	24(%rsp), %rdi
	call	Pthread_create
	movl	$0, %esi
	movq	16(%rsp), %rdi
	call	Pthread_join
	movl	$0, %esi
	movq	24(%rsp), %rdi
	call	Pthread_join
	movl	cnt(%rip), %eax
	movl	12(%rsp), %ecx
	leal	(%rcx,%rcx), %edx
	cmpl	%eax, %edx
	je	.L7
	movl	cnt(%rip), %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	jmp	.L8
.L7:
	movl	cnt(%rip), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L8:
	movl	$0, %edi
	call	exit
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
