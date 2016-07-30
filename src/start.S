.section ".text.startup"

.global _start
.global _get_stack_pointer
.global _enable_interrupts
.global _disable_interrupts

// From the ARM ARM (Architecture Reference Manual). Make sure you get the
// ARMv5 documentation which includes the ARMv6 documentation which is the
// correct processor type for the Broadcom BCM2835. The ARMv6-M manuals
// available on the ARM website are for Cortex-M parts only and are very
// different.
//
// See ARM section A2.2 (Processor Modes)

.equ    CPSR_MODE_USER,         0x10
.equ    CPSR_MODE_FIQ,          0x11
.equ    CPSR_MODE_IRQ,          0x12
.equ    CPSR_MODE_SVR,          0x13
.equ    CPSR_MODE_ABORT,        0x17
.equ    CPSR_MODE_UNDEFINED,    0x1B
.equ    CPSR_MODE_SYSTEM,       0x1F

// See ARM section A2.5 (Program status registers)
.equ    CPSR_IRQ_INHIBIT,       0x80
.equ    CPSR_FIQ_INHIBIT,       0x40
.equ    CPSR_THUMB,             0x20

.equ	SCTLR_ENABLE_DATA_CACHE,        0x4
.equ	SCTLR_ENABLE_BRANCH_PREDICTION, 0x800
.equ	SCTLR_ENABLE_INSTRUCTION_CACHE, 0x1000

_start:
	//interrupt vector table
	ldr 	pc,	_reset_h
	ldr		pc, _undefined_instruction_vector_h
	ldr 	pc, _software_interrupt_vector_h
	ldr 	pc, _prefetch_abort_vector_h
	ldr		pc, _data_abort_vector_h
	ldr 	pc, _unused_handler_h
	ldr 	pc, _interrupt_vector_h
	ldr 	pc, _fast_interrupt_vector_h

_reset_h:							.word	_reset_
_undefined_instruction_vector_h:	.word	undefined_instruction_vector
_software_interrupt_vector_h:		.word	software_interrupt_vector
_prefetch_abort_vector_h:			.word	prefetch_abort_vector 
_data_abort_vector_h:				.word	data_abort_vector 
_unused_handler_h:					.word	_reset_
_interrupt_vector_h:				.word 	interrupt_vector
_fast_interrupt_vector_h: 			.word	fast_interrupt_vector

_reset_:
	//copy interrupt vector table
	mov 	r0, #0x8000
	mov 	r1, #0x0000
	ldmia	r0!,{r2, r3, r4, r5, r6, r7, r8, r9}
	stmia 	r1!,{r2, r3, r4, r5, r6, r7, r8, r9}
	ldmia 	r0!,{r2, r3, r4, r5, r6, r7, r8, r9}
	stmia 	r1!,{r2, r3, r4, r5, r6, r7, r8, r9}

	//set stack stack pointer 		//OLD
	//ldr 	sp, =(64*1024*1024) 	//OLD
	//setup stack pointers, interrupt and application?
	mov 	r0, #(CPSR_MODE_IRQ | CPSR_IRQ_INHIBIT | CPSR_FIQ_INHIBIT )
	msr 	cpsr_c, r0
	mov 	sp, #0x7000

	// Enable L1 Cache 
	mrc 	p15,0,r0,c1,c0,0
	orr 	r0,#SCTLR_ENABLE_BRANCH_PREDICTION
	orr		r0,#SCTLR_ENABLE_DATA_CACHE
	orr 	r0,#SCTLR_ENABLE_INSTRUCTION_CACHE
	mcr		p15,0,r0,c1,c0,0

	//enable VFP
	mrc		p15, #0, r1, c1, c0, #2 	//r1=access control reg
	orr 	r1, r1, #(0xf << 20)		//enable full acces for p10,p11
	mcr 	p15, #0, r1, c1, c0, #2 	
	mov 	r1, #0 						//flush prefetch buffer b/c FMXR below
	mcr 	p15, #0, r1, c7, c5, #4
	mov 	r0, #0x40000000				//enable VFP itself
	fmxr 	fpexc, r0 					//fpexc = r0

	//run the c startup function - will call the main function
	bl		_cstartup

_inf_loop:
	b		_inf_loop

_get_stack_pointer:
	//return stack pointer value
	str 	sp, [sp]
	ldr 	r0, [sp]
	mov		pc, lr

_enable_interrupts:
	mrs		r0, cpsr
	bic		r0, r0, #0x80
	msr		cpsr_c, r0
	mov 	pc, lr
/*
_disable_interrupts:
	//Doesn't work :(
	mrs		r0, cpsr
	orr		r0, r0, #0x80
	msr		cpsr_c, r0
	mov		pc, lr
*/
