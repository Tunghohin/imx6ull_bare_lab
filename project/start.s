.global _start

.global _bss_start
_bss_start:
	.word __bss_start

.global _bss_end
_bss_end:
	.word __bss_start

.text

_start:
/*
   set cpu to svc mode
*/
	mrs r0, cpsr
	bic r0, r0, #0x1f
	orr r0, r0, #0x13
	msr cpsr, r0

/*
    clear bss segment
*/
    ldr r0, _bss_start
    ldr r1, _bss_end
    mov r2, #0
clear_bss_loop:
    stmia r0!, {r2}
    cmp r0, r1
    ble clear_bss_loop

/*
    initialize stack pointer
*/
	ldr sp, =0x80200000
	b   main
    
