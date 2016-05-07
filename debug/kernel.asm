
../bin/kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <_start>:
    8000:	e3a000d2 	mov	r0, #210	; 0xd2
    8004:	e121f000 	msr	CPSR_c, r0
    8008:	e3a0da07 	mov	sp, #28672	; 0x7000
    800c:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
    8010:	e3800b02 	orr	r0, r0, #2048	; 0x800
    8014:	e3800004 	orr	r0, r0, #4
    8018:	e3800a01 	orr	r0, r0, #4096	; 0x1000
    801c:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
    8020:	ee111f50 	mrc	15, 0, r1, cr1, cr0, {2}
    8024:	e381160f 	orr	r1, r1, #15728640	; 0xf00000
    8028:	ee011f50 	mcr	15, 0, r1, cr1, cr0, {2}
    802c:	e3a01000 	mov	r1, #0
    8030:	ee071f95 	mcr	15, 0, r1, cr7, cr5, {4}
    8034:	e3a00101 	mov	r0, #1073741824	; 0x40000000
    8038:	eee80a10 	vmsr	fpexc, r0
    803c:	eb00000b 	bl	8070 <_cstartup>

00008040 <_inf_loop>:
    8040:	eafffffe 	b	8040 <_inf_loop>

00008044 <_get_stack_pointer>:
    8044:	e58dd000 	str	sp, [sp]
    8048:	e59d0000 	ldr	r0, [sp]
    804c:	e1a0f00e 	mov	pc, lr

00008050 <_enable_interrupts>:
    8050:	e10f0000 	mrs	r0, CPSR
    8054:	e3c00080 	bic	r0, r0, #128	; 0x80
    8058:	e121f000 	msr	CPSR_c, r0
    805c:	e1a0f00e 	mov	pc, lr

00008060 <_disable_interrupts>:
    8060:	e10f0000 	mrs	r0, CPSR
    8064:	e3800080 	orr	r0, r0, #128	; 0x80
    8068:	e121f000 	msr	CPSR_c, r0
    806c:	e1a0f00e 	mov	pc, lr

00008070 <_cstartup>:
    8070:	e92d4800 	push	{fp, lr}
    8074:	e28db004 	add	fp, sp, #4
    8078:	e24dd018 	sub	sp, sp, #24
    807c:	e50b0010 	str	r0, [fp, #-16]
    8080:	e50b1014 	str	r1, [fp, #-20]
    8084:	e50b2018 	str	r2, [fp, #-24]
    8088:	e59f3048 	ldr	r3, [pc, #72]	; 80d8 <_cstartup+0x68>
    808c:	e50b3008 	str	r3, [fp, #-8]
    8090:	e59f3044 	ldr	r3, [pc, #68]	; 80dc <_cstartup+0x6c>
    8094:	e50b300c 	str	r3, [fp, #-12]
    8098:	ea000005 	b	80b4 <_cstartup+0x44>
    809c:	e51b3008 	ldr	r3, [fp, #-8]
    80a0:	e3a02000 	mov	r2, #0
    80a4:	e5832000 	str	r2, [r3]
    80a8:	e51b3008 	ldr	r3, [fp, #-8]
    80ac:	e2833004 	add	r3, r3, #4
    80b0:	e50b3008 	str	r3, [fp, #-8]
    80b4:	e51b2008 	ldr	r2, [fp, #-8]
    80b8:	e51b300c 	ldr	r3, [fp, #-12]
    80bc:	e1520003 	cmp	r2, r3
    80c0:	3afffff5 	bcc	809c <_cstartup+0x2c>
    80c4:	e51b0010 	ldr	r0, [fp, #-16]
    80c8:	e51b1014 	ldr	r1, [fp, #-20]
    80cc:	e51b2018 	ldr	r2, [fp, #-24]
    80d0:	eb0000fb 	bl	84c4 <kernel_main>
    80d4:	eafffffe 	b	80d4 <_cstartup+0x64>
    80d8:	00009a4c 	andeq	r9, r0, ip, asr #20
    80dc:	00009a8c 	andeq	r9, r0, ip, lsl #21

000080e0 <_exit>:
    80e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    80e4:	e28db000 	add	fp, sp, #0
    80e8:	e24dd00c 	sub	sp, sp, #12
    80ec:	e50b0008 	str	r0, [fp, #-8]
    80f0:	eafffffe 	b	80f0 <_exit+0x10>

000080f4 <_close>:
    80f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    80f8:	e28db000 	add	fp, sp, #0
    80fc:	e24dd00c 	sub	sp, sp, #12
    8100:	e50b0008 	str	r0, [fp, #-8]
    8104:	e3e03000 	mvn	r3, #0
    8108:	e1a00003 	mov	r0, r3
    810c:	e28bd000 	add	sp, fp, #0
    8110:	e8bd0800 	pop	{fp}
    8114:	e12fff1e 	bx	lr

00008118 <execve>:
    8118:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    811c:	e28db000 	add	fp, sp, #0
    8120:	e24dd014 	sub	sp, sp, #20
    8124:	e50b0008 	str	r0, [fp, #-8]
    8128:	e50b100c 	str	r1, [fp, #-12]
    812c:	e50b2010 	str	r2, [fp, #-16]
    8130:	e59f3018 	ldr	r3, [pc, #24]	; 8150 <execve+0x38>
    8134:	e3a0200c 	mov	r2, #12
    8138:	e5832000 	str	r2, [r3]
    813c:	e3e03000 	mvn	r3, #0
    8140:	e1a00003 	mov	r0, r3
    8144:	e28bd000 	add	sp, fp, #0
    8148:	e8bd0800 	pop	{fp}
    814c:	e12fff1e 	bx	lr
    8150:	00009a88 	andeq	r9, r0, r8, lsl #21

00008154 <fork>:
    8154:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8158:	e28db000 	add	fp, sp, #0
    815c:	e59f3018 	ldr	r3, [pc, #24]	; 817c <fork+0x28>
    8160:	e3a0200b 	mov	r2, #11
    8164:	e5832000 	str	r2, [r3]
    8168:	e3e03000 	mvn	r3, #0
    816c:	e1a00003 	mov	r0, r3
    8170:	e28bd000 	add	sp, fp, #0
    8174:	e8bd0800 	pop	{fp}
    8178:	e12fff1e 	bx	lr
    817c:	00009a88 	andeq	r9, r0, r8, lsl #21

00008180 <_fstat>:
    8180:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8184:	e28db000 	add	fp, sp, #0
    8188:	e24dd00c 	sub	sp, sp, #12
    818c:	e50b0008 	str	r0, [fp, #-8]
    8190:	e50b100c 	str	r1, [fp, #-12]
    8194:	e51b300c 	ldr	r3, [fp, #-12]
    8198:	e3a02a02 	mov	r2, #8192	; 0x2000
    819c:	e5832004 	str	r2, [r3, #4]
    81a0:	e3a03000 	mov	r3, #0
    81a4:	e1a00003 	mov	r0, r3
    81a8:	e28bd000 	add	sp, fp, #0
    81ac:	e8bd0800 	pop	{fp}
    81b0:	e12fff1e 	bx	lr

000081b4 <getpid>:
    81b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81b8:	e28db000 	add	fp, sp, #0
    81bc:	e3a03001 	mov	r3, #1
    81c0:	e1a00003 	mov	r0, r3
    81c4:	e28bd000 	add	sp, fp, #0
    81c8:	e8bd0800 	pop	{fp}
    81cc:	e12fff1e 	bx	lr

000081d0 <_isatty>:
    81d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81d4:	e28db000 	add	fp, sp, #0
    81d8:	e24dd00c 	sub	sp, sp, #12
    81dc:	e50b0008 	str	r0, [fp, #-8]
    81e0:	e3a03001 	mov	r3, #1
    81e4:	e1a00003 	mov	r0, r3
    81e8:	e28bd000 	add	sp, fp, #0
    81ec:	e8bd0800 	pop	{fp}
    81f0:	e12fff1e 	bx	lr

000081f4 <kill>:
    81f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81f8:	e28db000 	add	fp, sp, #0
    81fc:	e24dd00c 	sub	sp, sp, #12
    8200:	e50b0008 	str	r0, [fp, #-8]
    8204:	e50b100c 	str	r1, [fp, #-12]
    8208:	e59f3018 	ldr	r3, [pc, #24]	; 8228 <kill+0x34>
    820c:	e3a02016 	mov	r2, #22
    8210:	e5832000 	str	r2, [r3]
    8214:	e3e03000 	mvn	r3, #0
    8218:	e1a00003 	mov	r0, r3
    821c:	e28bd000 	add	sp, fp, #0
    8220:	e8bd0800 	pop	{fp}
    8224:	e12fff1e 	bx	lr
    8228:	00009a88 	andeq	r9, r0, r8, lsl #21

0000822c <link>:
    822c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8230:	e28db000 	add	fp, sp, #0
    8234:	e24dd00c 	sub	sp, sp, #12
    8238:	e50b0008 	str	r0, [fp, #-8]
    823c:	e50b100c 	str	r1, [fp, #-12]
    8240:	e59f3018 	ldr	r3, [pc, #24]	; 8260 <link+0x34>
    8244:	e3a0201f 	mov	r2, #31
    8248:	e5832000 	str	r2, [r3]
    824c:	e3e03000 	mvn	r3, #0
    8250:	e1a00003 	mov	r0, r3
    8254:	e28bd000 	add	sp, fp, #0
    8258:	e8bd0800 	pop	{fp}
    825c:	e12fff1e 	bx	lr
    8260:	00009a88 	andeq	r9, r0, r8, lsl #21

00008264 <_lseek>:
    8264:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8268:	e28db000 	add	fp, sp, #0
    826c:	e24dd014 	sub	sp, sp, #20
    8270:	e50b0008 	str	r0, [fp, #-8]
    8274:	e50b100c 	str	r1, [fp, #-12]
    8278:	e50b2010 	str	r2, [fp, #-16]
    827c:	e3a03000 	mov	r3, #0
    8280:	e1a00003 	mov	r0, r3
    8284:	e28bd000 	add	sp, fp, #0
    8288:	e8bd0800 	pop	{fp}
    828c:	e12fff1e 	bx	lr

00008290 <open>:
    8290:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8294:	e28db000 	add	fp, sp, #0
    8298:	e24dd014 	sub	sp, sp, #20
    829c:	e50b0008 	str	r0, [fp, #-8]
    82a0:	e50b100c 	str	r1, [fp, #-12]
    82a4:	e50b2010 	str	r2, [fp, #-16]
    82a8:	e3e03000 	mvn	r3, #0
    82ac:	e1a00003 	mov	r0, r3
    82b0:	e28bd000 	add	sp, fp, #0
    82b4:	e8bd0800 	pop	{fp}
    82b8:	e12fff1e 	bx	lr

000082bc <_read>:
    82bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    82c0:	e28db000 	add	fp, sp, #0
    82c4:	e24dd014 	sub	sp, sp, #20
    82c8:	e50b0008 	str	r0, [fp, #-8]
    82cc:	e50b100c 	str	r1, [fp, #-12]
    82d0:	e50b2010 	str	r2, [fp, #-16]
    82d4:	e3a03000 	mov	r3, #0
    82d8:	e1a00003 	mov	r0, r3
    82dc:	e28bd000 	add	sp, fp, #0
    82e0:	e8bd0800 	pop	{fp}
    82e4:	e12fff1e 	bx	lr

000082e8 <_sbrk>:
    82e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    82ec:	e28db000 	add	fp, sp, #0
    82f0:	e24dd014 	sub	sp, sp, #20
    82f4:	e50b0010 	str	r0, [fp, #-16]
    82f8:	e59f304c 	ldr	r3, [pc, #76]	; 834c <_sbrk+0x64>
    82fc:	e5933000 	ldr	r3, [r3]
    8300:	e3530000 	cmp	r3, #0
    8304:	1a000002 	bne	8314 <_sbrk+0x2c>
    8308:	e59f303c 	ldr	r3, [pc, #60]	; 834c <_sbrk+0x64>
    830c:	e59f203c 	ldr	r2, [pc, #60]	; 8350 <_sbrk+0x68>
    8310:	e5832000 	str	r2, [r3]
    8314:	e59f3030 	ldr	r3, [pc, #48]	; 834c <_sbrk+0x64>
    8318:	e5933000 	ldr	r3, [r3]
    831c:	e50b3008 	str	r3, [fp, #-8]
    8320:	e59f3024 	ldr	r3, [pc, #36]	; 834c <_sbrk+0x64>
    8324:	e5932000 	ldr	r2, [r3]
    8328:	e51b3010 	ldr	r3, [fp, #-16]
    832c:	e0822003 	add	r2, r2, r3
    8330:	e59f3014 	ldr	r3, [pc, #20]	; 834c <_sbrk+0x64>
    8334:	e5832000 	str	r2, [r3]
    8338:	e51b3008 	ldr	r3, [fp, #-8]
    833c:	e1a00003 	mov	r0, r3
    8340:	e28bd000 	add	sp, fp, #0
    8344:	e8bd0800 	pop	{fp}
    8348:	e12fff1e 	bx	lr
    834c:	00009a50 	andeq	r9, r0, r0, asr sl
    8350:	00009a8c 	andeq	r9, r0, ip, lsl #21

00008354 <stat>:
    8354:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8358:	e28db000 	add	fp, sp, #0
    835c:	e24dd00c 	sub	sp, sp, #12
    8360:	e50b0008 	str	r0, [fp, #-8]
    8364:	e50b100c 	str	r1, [fp, #-12]
    8368:	e51b300c 	ldr	r3, [fp, #-12]
    836c:	e3a02a02 	mov	r2, #8192	; 0x2000
    8370:	e5832004 	str	r2, [r3, #4]
    8374:	e3a03000 	mov	r3, #0
    8378:	e1a00003 	mov	r0, r3
    837c:	e28bd000 	add	sp, fp, #0
    8380:	e8bd0800 	pop	{fp}
    8384:	e12fff1e 	bx	lr

00008388 <times>:
    8388:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    838c:	e28db000 	add	fp, sp, #0
    8390:	e24dd00c 	sub	sp, sp, #12
    8394:	e50b0008 	str	r0, [fp, #-8]
    8398:	e3e03000 	mvn	r3, #0
    839c:	e1a00003 	mov	r0, r3
    83a0:	e28bd000 	add	sp, fp, #0
    83a4:	e8bd0800 	pop	{fp}
    83a8:	e12fff1e 	bx	lr

000083ac <unlink>:
    83ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    83b0:	e28db000 	add	fp, sp, #0
    83b4:	e24dd00c 	sub	sp, sp, #12
    83b8:	e50b0008 	str	r0, [fp, #-8]
    83bc:	e59f3018 	ldr	r3, [pc, #24]	; 83dc <unlink+0x30>
    83c0:	e3a02002 	mov	r2, #2
    83c4:	e5832000 	str	r2, [r3]
    83c8:	e3e03000 	mvn	r3, #0
    83cc:	e1a00003 	mov	r0, r3
    83d0:	e28bd000 	add	sp, fp, #0
    83d4:	e8bd0800 	pop	{fp}
    83d8:	e12fff1e 	bx	lr
    83dc:	00009a88 	andeq	r9, r0, r8, lsl #21

000083e0 <wait>:
    83e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    83e4:	e28db000 	add	fp, sp, #0
    83e8:	e24dd00c 	sub	sp, sp, #12
    83ec:	e50b0008 	str	r0, [fp, #-8]
    83f0:	e59f3018 	ldr	r3, [pc, #24]	; 8410 <wait+0x30>
    83f4:	e3a0200a 	mov	r2, #10
    83f8:	e5832000 	str	r2, [r3]
    83fc:	e3e03000 	mvn	r3, #0
    8400:	e1a00003 	mov	r0, r3
    8404:	e28bd000 	add	sp, fp, #0
    8408:	e8bd0800 	pop	{fp}
    840c:	e12fff1e 	bx	lr
    8410:	00009a88 	andeq	r9, r0, r8, lsl #21

00008414 <outbyte>:
    8414:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8418:	e28db000 	add	fp, sp, #0
    841c:	e24dd00c 	sub	sp, sp, #12
    8420:	e1a03000 	mov	r3, r0
    8424:	e54b3005 	strb	r3, [fp, #-5]
    8428:	e28bd000 	add	sp, fp, #0
    842c:	e8bd0800 	pop	{fp}
    8430:	e12fff1e 	bx	lr

00008434 <_write>:
    8434:	e92d4800 	push	{fp, lr}
    8438:	e28db004 	add	fp, sp, #4
    843c:	e24dd018 	sub	sp, sp, #24
    8440:	e50b0010 	str	r0, [fp, #-16]
    8444:	e50b1014 	str	r1, [fp, #-20]
    8448:	e50b2018 	str	r2, [fp, #-24]
    844c:	e3a03000 	mov	r3, #0
    8450:	e50b3008 	str	r3, [fp, #-8]
    8454:	ea000009 	b	8480 <_write+0x4c>
    8458:	e51b3014 	ldr	r3, [fp, #-20]
    845c:	e5d33000 	ldrb	r3, [r3]
    8460:	e51b2014 	ldr	r2, [fp, #-20]
    8464:	e2822001 	add	r2, r2, #1
    8468:	e50b2014 	str	r2, [fp, #-20]
    846c:	e1a00003 	mov	r0, r3
    8470:	ebffffe7 	bl	8414 <outbyte>
    8474:	e51b3008 	ldr	r3, [fp, #-8]
    8478:	e2833001 	add	r3, r3, #1
    847c:	e50b3008 	str	r3, [fp, #-8]
    8480:	e51b2008 	ldr	r2, [fp, #-8]
    8484:	e51b3018 	ldr	r3, [fp, #-24]
    8488:	e1520003 	cmp	r2, r3
    848c:	bafffff1 	blt	8458 <_write+0x24>
    8490:	e51b3018 	ldr	r3, [fp, #-24]
    8494:	e1a00003 	mov	r0, r3
    8498:	e24bd004 	sub	sp, fp, #4
    849c:	e8bd8800 	pop	{fp, pc}

000084a0 <getGPIOController>:
    84a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    84a4:	e28db000 	add	fp, sp, #0
    84a8:	e59f3010 	ldr	r3, [pc, #16]	; 84c0 <getGPIOController+0x20>
    84ac:	e5933000 	ldr	r3, [r3]
    84b0:	e1a00003 	mov	r0, r3
    84b4:	e28bd000 	add	sp, fp, #0
    84b8:	e8bd0800 	pop	{fp}
    84bc:	e12fff1e 	bx	lr
    84c0:	0000920c 	andeq	r9, r0, ip, lsl #4

000084c4 <kernel_main>:
    84c4:	e92d4800 	push	{fp, lr}
    84c8:	e28db004 	add	fp, sp, #4
    84cc:	e24dd018 	sub	sp, sp, #24
    84d0:	e50b0010 	str	r0, [fp, #-16]
    84d4:	e50b1014 	str	r1, [fp, #-20]
    84d8:	e50b2018 	str	r2, [fp, #-24]
    84dc:	ebffffef 	bl	84a0 <getGPIOController>
    84e0:	e1a03000 	mov	r3, r0
    84e4:	e5932010 	ldr	r2, [r3, #16]
    84e8:	e3822602 	orr	r2, r2, #2097152	; 0x200000
    84ec:	e5832010 	str	r2, [r3, #16]
    84f0:	ebffffea 	bl	84a0 <getGPIOController>
    84f4:	e1a03000 	mov	r3, r0
    84f8:	e3a02902 	mov	r2, #32768	; 0x8000
    84fc:	e5832020 	str	r2, [r3, #32]
    8500:	e3a03000 	mov	r3, #0
    8504:	e50b3008 	str	r3, [fp, #-8]
    8508:	ea000002 	b	8518 <kernel_main+0x54>
    850c:	e51b3008 	ldr	r3, [fp, #-8]
    8510:	e2833001 	add	r3, r3, #1
    8514:	e50b3008 	str	r3, [fp, #-8]
    8518:	e51b2008 	ldr	r2, [fp, #-8]
    851c:	e59f3050 	ldr	r3, [pc, #80]	; 8574 <kernel_main+0xb0>
    8520:	e1520003 	cmp	r2, r3
    8524:	dafffff8 	ble	850c <kernel_main+0x48>
    8528:	ebffffdc 	bl	84a0 <getGPIOController>
    852c:	e1a03000 	mov	r3, r0
    8530:	e3a02902 	mov	r2, #32768	; 0x8000
    8534:	e583202c 	str	r2, [r3, #44]	; 0x2c
    8538:	e3a03000 	mov	r3, #0
    853c:	e50b300c 	str	r3, [fp, #-12]
    8540:	ea000002 	b	8550 <kernel_main+0x8c>
    8544:	e51b300c 	ldr	r3, [fp, #-12]
    8548:	e2833001 	add	r3, r3, #1
    854c:	e50b300c 	str	r3, [fp, #-12]
    8550:	e51b200c 	ldr	r2, [fp, #-12]
    8554:	e59f3018 	ldr	r3, [pc, #24]	; 8574 <kernel_main+0xb0>
    8558:	e1520003 	cmp	r2, r3
    855c:	dafffff8 	ble	8544 <kernel_main+0x80>
    8560:	ebffffce 	bl	84a0 <getGPIOController>
    8564:	e1a03000 	mov	r3, r0
    8568:	e3a02902 	mov	r2, #32768	; 0x8000
    856c:	e5832020 	str	r2, [r3, #32]
    8570:	eaffffe2 	b	8500 <kernel_main+0x3c>
    8574:	0007a11f 	andeq	sl, r7, pc, lsl r1

00008578 <cleanup_glue>:
    8578:	e92d4038 	push	{r3, r4, r5, lr}
    857c:	e1a04001 	mov	r4, r1
    8580:	e5911000 	ldr	r1, [r1]
    8584:	e3510000 	cmp	r1, #0
    8588:	e1a05000 	mov	r5, r0
    858c:	1bfffff9 	blne	8578 <cleanup_glue>
    8590:	e1a00005 	mov	r0, r5
    8594:	e1a01004 	mov	r1, r4
    8598:	eb00009c 	bl	8810 <_free_r>
    859c:	e8bd4038 	pop	{r3, r4, r5, lr}
    85a0:	e12fff1e 	bx	lr

000085a4 <_reclaim_reent>:
    85a4:	e59f30f0 	ldr	r3, [pc, #240]	; 869c <_reclaim_reent+0xf8>
    85a8:	e5933000 	ldr	r3, [r3]
    85ac:	e1500003 	cmp	r0, r3
    85b0:	e92d4070 	push	{r4, r5, r6, lr}
    85b4:	e1a05000 	mov	r5, r0
    85b8:	0a00002b 	beq	866c <_reclaim_reent+0xc8>
    85bc:	e590204c 	ldr	r2, [r0, #76]	; 0x4c
    85c0:	e3520000 	cmp	r2, #0
    85c4:	0a000011 	beq	8610 <_reclaim_reent+0x6c>
    85c8:	e3a03000 	mov	r3, #0
    85cc:	e1a06003 	mov	r6, r3
    85d0:	e7921103 	ldr	r1, [r2, r3, lsl #2]
    85d4:	e3510000 	cmp	r1, #0
    85d8:	0a000005 	beq	85f4 <_reclaim_reent+0x50>
    85dc:	e5914000 	ldr	r4, [r1]
    85e0:	e1a00005 	mov	r0, r5
    85e4:	eb000089 	bl	8810 <_free_r>
    85e8:	e2541000 	subs	r1, r4, #0
    85ec:	1afffffa 	bne	85dc <_reclaim_reent+0x38>
    85f0:	e595204c 	ldr	r2, [r5, #76]	; 0x4c
    85f4:	e2866001 	add	r6, r6, #1
    85f8:	e3560020 	cmp	r6, #32
    85fc:	e1a03006 	mov	r3, r6
    8600:	1afffff2 	bne	85d0 <_reclaim_reent+0x2c>
    8604:	e1a00005 	mov	r0, r5
    8608:	e1a01002 	mov	r1, r2
    860c:	eb00007f 	bl	8810 <_free_r>
    8610:	e5951040 	ldr	r1, [r5, #64]	; 0x40
    8614:	e3510000 	cmp	r1, #0
    8618:	11a00005 	movne	r0, r5
    861c:	1b00007b 	blne	8810 <_free_r>
    8620:	e5951148 	ldr	r1, [r5, #328]	; 0x148
    8624:	e3510000 	cmp	r1, #0
    8628:	0a000008 	beq	8650 <_reclaim_reent+0xac>
    862c:	e2856f53 	add	r6, r5, #332	; 0x14c
    8630:	e1510006 	cmp	r1, r6
    8634:	0a000005 	beq	8650 <_reclaim_reent+0xac>
    8638:	e5914000 	ldr	r4, [r1]
    863c:	e1a00005 	mov	r0, r5
    8640:	eb000072 	bl	8810 <_free_r>
    8644:	e1560004 	cmp	r6, r4
    8648:	e1a01004 	mov	r1, r4
    864c:	1afffff9 	bne	8638 <_reclaim_reent+0x94>
    8650:	e5951054 	ldr	r1, [r5, #84]	; 0x54
    8654:	e3510000 	cmp	r1, #0
    8658:	11a00005 	movne	r0, r5
    865c:	1b00006b 	blne	8810 <_free_r>
    8660:	e5953038 	ldr	r3, [r5, #56]	; 0x38
    8664:	e3530000 	cmp	r3, #0
    8668:	1a000001 	bne	8674 <_reclaim_reent+0xd0>
    866c:	e8bd4070 	pop	{r4, r5, r6, lr}
    8670:	e12fff1e 	bx	lr
    8674:	e1a00005 	mov	r0, r5
    8678:	e595c03c 	ldr	ip, [r5, #60]	; 0x3c
    867c:	e1a0e00f 	mov	lr, pc
    8680:	e12fff1c 	bx	ip
    8684:	e59512e0 	ldr	r1, [r5, #736]	; 0x2e0
    8688:	e3510000 	cmp	r1, #0
    868c:	0afffff6 	beq	866c <_reclaim_reent+0xc8>
    8690:	e1a00005 	mov	r0, r5
    8694:	e8bd4070 	pop	{r4, r5, r6, lr}
    8698:	eaffffb6 	b	8578 <cleanup_glue>
    869c:	00009638 	andeq	r9, r0, r8, lsr r6

000086a0 <_wrapup_reent>:
    86a0:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
    86a4:	e2507000 	subs	r7, r0, #0
    86a8:	059f3060 	ldreq	r3, [pc, #96]	; 8710 <_wrapup_reent+0x70>
    86ac:	05937000 	ldreq	r7, [r3]
    86b0:	e5976148 	ldr	r6, [r7, #328]	; 0x148
    86b4:	e3560000 	cmp	r6, #0
    86b8:	0a00000d 	beq	86f4 <_wrapup_reent+0x54>
    86bc:	e5965004 	ldr	r5, [r6, #4]
    86c0:	e2554001 	subs	r4, r5, #1
    86c4:	52855002 	addpl	r5, r5, #2
    86c8:	50865105 	addpl	r5, r6, r5, lsl #2
    86cc:	4a000005 	bmi	86e8 <_wrapup_reent+0x48>
    86d0:	e5353004 	ldr	r3, [r5, #-4]!
    86d4:	e2444001 	sub	r4, r4, #1
    86d8:	e1a0e00f 	mov	lr, pc
    86dc:	e12fff13 	bx	r3
    86e0:	e3740001 	cmn	r4, #1
    86e4:	1afffff9 	bne	86d0 <_wrapup_reent+0x30>
    86e8:	e5966000 	ldr	r6, [r6]
    86ec:	e3560000 	cmp	r6, #0
    86f0:	1afffff1 	bne	86bc <_wrapup_reent+0x1c>
    86f4:	e597303c 	ldr	r3, [r7, #60]	; 0x3c
    86f8:	e3530000 	cmp	r3, #0
    86fc:	11a00007 	movne	r0, r7
    8700:	11a0e00f 	movne	lr, pc
    8704:	112fff13 	bxne	r3
    8708:	e8bd40f8 	pop	{r3, r4, r5, r6, r7, lr}
    870c:	e12fff1e 	bx	lr
    8710:	00009638 	andeq	r9, r0, r8, lsr r6

00008714 <_malloc_trim_r>:
    8714:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
    8718:	e59f50e4 	ldr	r5, [pc, #228]	; 8804 <_malloc_trim_r+0xf0>
    871c:	e1a07001 	mov	r7, r1
    8720:	e1a04000 	mov	r4, r0
    8724:	eb0002a3 	bl	91b8 <__malloc_lock>
    8728:	e5953008 	ldr	r3, [r5, #8]
    872c:	e5936004 	ldr	r6, [r3, #4]
    8730:	e3c66003 	bic	r6, r6, #3
    8734:	e2863efe 	add	r3, r6, #4064	; 0xfe0
    8738:	e283300f 	add	r3, r3, #15
    873c:	e0677003 	rsb	r7, r7, r3
    8740:	e1a07627 	lsr	r7, r7, #12
    8744:	e2477001 	sub	r7, r7, #1
    8748:	e1a07607 	lsl	r7, r7, #12
    874c:	e3570a01 	cmp	r7, #4096	; 0x1000
    8750:	ba000006 	blt	8770 <_malloc_trim_r+0x5c>
    8754:	e1a00004 	mov	r0, r4
    8758:	e3a01000 	mov	r1, #0
    875c:	eb000297 	bl	91c0 <_sbrk_r>
    8760:	e5953008 	ldr	r3, [r5, #8]
    8764:	e0833006 	add	r3, r3, r6
    8768:	e1500003 	cmp	r0, r3
    876c:	0a000004 	beq	8784 <_malloc_trim_r+0x70>
    8770:	e1a00004 	mov	r0, r4
    8774:	eb000290 	bl	91bc <__malloc_unlock>
    8778:	e3a00000 	mov	r0, #0
    877c:	e8bd40f8 	pop	{r3, r4, r5, r6, r7, lr}
    8780:	e12fff1e 	bx	lr
    8784:	e1a00004 	mov	r0, r4
    8788:	e2671000 	rsb	r1, r7, #0
    878c:	eb00028b 	bl	91c0 <_sbrk_r>
    8790:	e3700001 	cmn	r0, #1
    8794:	0a00000b 	beq	87c8 <_malloc_trim_r+0xb4>
    8798:	e59f3068 	ldr	r3, [pc, #104]	; 8808 <_malloc_trim_r+0xf4>
    879c:	e5952008 	ldr	r2, [r5, #8]
    87a0:	e5931000 	ldr	r1, [r3]
    87a4:	e0676006 	rsb	r6, r7, r6
    87a8:	e3866001 	orr	r6, r6, #1
    87ac:	e0677001 	rsb	r7, r7, r1
    87b0:	e1a00004 	mov	r0, r4
    87b4:	e5826004 	str	r6, [r2, #4]
    87b8:	e5837000 	str	r7, [r3]
    87bc:	eb00027e 	bl	91bc <__malloc_unlock>
    87c0:	e3a00001 	mov	r0, #1
    87c4:	eaffffec 	b	877c <_malloc_trim_r+0x68>
    87c8:	e1a00004 	mov	r0, r4
    87cc:	e3a01000 	mov	r1, #0
    87d0:	eb00027a 	bl	91c0 <_sbrk_r>
    87d4:	e5953008 	ldr	r3, [r5, #8]
    87d8:	e0632000 	rsb	r2, r3, r0
    87dc:	e352000f 	cmp	r2, #15
    87e0:	daffffe2 	ble	8770 <_malloc_trim_r+0x5c>
    87e4:	e59f1020 	ldr	r1, [pc, #32]	; 880c <_malloc_trim_r+0xf8>
    87e8:	e5911000 	ldr	r1, [r1]
    87ec:	e0610000 	rsb	r0, r1, r0
    87f0:	e59f1010 	ldr	r1, [pc, #16]	; 8808 <_malloc_trim_r+0xf4>
    87f4:	e3822001 	orr	r2, r2, #1
    87f8:	e5810000 	str	r0, [r1]
    87fc:	e5832004 	str	r2, [r3, #4]
    8800:	eaffffda 	b	8770 <_malloc_trim_r+0x5c>
    8804:	0000963c 	andeq	r9, r0, ip, lsr r6
    8808:	00009a60 	andeq	r9, r0, r0, ror #20
    880c:	00009a48 	andeq	r9, r0, r8, asr #20

00008810 <_free_r>:
    8810:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
    8814:	e2514000 	subs	r4, r1, #0
    8818:	e1a06000 	mov	r6, r0
    881c:	0a000046 	beq	893c <_free_r+0x12c>
    8820:	eb000264 	bl	91b8 <__malloc_lock>
    8824:	e514e004 	ldr	lr, [r4, #-4]
    8828:	e59f1238 	ldr	r1, [pc, #568]	; 8a68 <_free_r+0x258>
    882c:	e244c008 	sub	ip, r4, #8
    8830:	e3ce3001 	bic	r3, lr, #1
    8834:	e08c2003 	add	r2, ip, r3
    8838:	e5910008 	ldr	r0, [r1, #8]
    883c:	e5925004 	ldr	r5, [r2, #4]
    8840:	e1500002 	cmp	r0, r2
    8844:	e3c55003 	bic	r5, r5, #3
    8848:	0a00004a 	beq	8978 <_free_r+0x168>
    884c:	e21ee001 	ands	lr, lr, #1
    8850:	e5825004 	str	r5, [r2, #4]
    8854:	13a0e000 	movne	lr, #0
    8858:	1a000009 	bne	8884 <_free_r+0x74>
    885c:	e5144008 	ldr	r4, [r4, #-8]
    8860:	e064c00c 	rsb	ip, r4, ip
    8864:	e59c0008 	ldr	r0, [ip, #8]
    8868:	e2817008 	add	r7, r1, #8
    886c:	e1500007 	cmp	r0, r7
    8870:	e0833004 	add	r3, r3, r4
    8874:	159c400c 	ldrne	r4, [ip, #12]
    8878:	1580400c 	strne	r4, [r0, #12]
    887c:	15840008 	strne	r0, [r4, #8]
    8880:	03a0e001 	moveq	lr, #1
    8884:	e0820005 	add	r0, r2, r5
    8888:	e5900004 	ldr	r0, [r0, #4]
    888c:	e3100001 	tst	r0, #1
    8890:	1a000009 	bne	88bc <_free_r+0xac>
    8894:	e35e0000 	cmp	lr, #0
    8898:	e5920008 	ldr	r0, [r2, #8]
    889c:	e0833005 	add	r3, r3, r5
    88a0:	1a000002 	bne	88b0 <_free_r+0xa0>
    88a4:	e59f41c0 	ldr	r4, [pc, #448]	; 8a6c <_free_r+0x25c>
    88a8:	e1500004 	cmp	r0, r4
    88ac:	0a000047 	beq	89d0 <_free_r+0x1c0>
    88b0:	e592200c 	ldr	r2, [r2, #12]
    88b4:	e580200c 	str	r2, [r0, #12]
    88b8:	e5820008 	str	r0, [r2, #8]
    88bc:	e3832001 	orr	r2, r3, #1
    88c0:	e35e0000 	cmp	lr, #0
    88c4:	e58c2004 	str	r2, [ip, #4]
    88c8:	e78c3003 	str	r3, [ip, r3]
    88cc:	1a000018 	bne	8934 <_free_r+0x124>
    88d0:	e3530c02 	cmp	r3, #512	; 0x200
    88d4:	3a00001a 	bcc	8944 <_free_r+0x134>
    88d8:	e1a024a3 	lsr	r2, r3, #9
    88dc:	e3520004 	cmp	r2, #4
    88e0:	8a000042 	bhi	89f0 <_free_r+0x1e0>
    88e4:	e1a0e323 	lsr	lr, r3, #6
    88e8:	e28ee038 	add	lr, lr, #56	; 0x38
    88ec:	e1a0008e 	lsl	r0, lr, #1
    88f0:	e0810100 	add	r0, r1, r0, lsl #2
    88f4:	e5902008 	ldr	r2, [r0, #8]
    88f8:	e1520000 	cmp	r2, r0
    88fc:	e59f1164 	ldr	r1, [pc, #356]	; 8a68 <_free_r+0x258>
    8900:	0a000044 	beq	8a18 <_free_r+0x208>
    8904:	e5921004 	ldr	r1, [r2, #4]
    8908:	e3c11003 	bic	r1, r1, #3
    890c:	e1530001 	cmp	r3, r1
    8910:	2a000002 	bcs	8920 <_free_r+0x110>
    8914:	e5922008 	ldr	r2, [r2, #8]
    8918:	e1500002 	cmp	r0, r2
    891c:	1afffff8 	bne	8904 <_free_r+0xf4>
    8920:	e592300c 	ldr	r3, [r2, #12]
    8924:	e58c300c 	str	r3, [ip, #12]
    8928:	e58c2008 	str	r2, [ip, #8]
    892c:	e582c00c 	str	ip, [r2, #12]
    8930:	e583c008 	str	ip, [r3, #8]
    8934:	e1a00006 	mov	r0, r6
    8938:	eb00021f 	bl	91bc <__malloc_unlock>
    893c:	e8bd40f8 	pop	{r3, r4, r5, r6, r7, lr}
    8940:	e12fff1e 	bx	lr
    8944:	e5912004 	ldr	r2, [r1, #4]
    8948:	e1a031a3 	lsr	r3, r3, #3
    894c:	e1a00143 	asr	r0, r3, #2
    8950:	e3a0e001 	mov	lr, #1
    8954:	e182001e 	orr	r0, r2, lr, lsl r0
    8958:	e0813183 	add	r3, r1, r3, lsl #3
    895c:	e5932008 	ldr	r2, [r3, #8]
    8960:	e58c300c 	str	r3, [ip, #12]
    8964:	e58c2008 	str	r2, [ip, #8]
    8968:	e5810004 	str	r0, [r1, #4]
    896c:	e583c008 	str	ip, [r3, #8]
    8970:	e582c00c 	str	ip, [r2, #12]
    8974:	eaffffee 	b	8934 <_free_r+0x124>
    8978:	e31e0001 	tst	lr, #1
    897c:	e0853003 	add	r3, r5, r3
    8980:	1a000006 	bne	89a0 <_free_r+0x190>
    8984:	e5142008 	ldr	r2, [r4, #-8]
    8988:	e062c00c 	rsb	ip, r2, ip
    898c:	e59c000c 	ldr	r0, [ip, #12]
    8990:	e59ce008 	ldr	lr, [ip, #8]
    8994:	e58e000c 	str	r0, [lr, #12]
    8998:	e580e008 	str	lr, [r0, #8]
    899c:	e0833002 	add	r3, r3, r2
    89a0:	e59f20c8 	ldr	r2, [pc, #200]	; 8a70 <_free_r+0x260>
    89a4:	e5920000 	ldr	r0, [r2]
    89a8:	e3832001 	orr	r2, r3, #1
    89ac:	e1530000 	cmp	r3, r0
    89b0:	e58c2004 	str	r2, [ip, #4]
    89b4:	e581c008 	str	ip, [r1, #8]
    89b8:	3affffdd 	bcc	8934 <_free_r+0x124>
    89bc:	e59f30b0 	ldr	r3, [pc, #176]	; 8a74 <_free_r+0x264>
    89c0:	e1a00006 	mov	r0, r6
    89c4:	e5931000 	ldr	r1, [r3]
    89c8:	ebffff51 	bl	8714 <_malloc_trim_r>
    89cc:	eaffffd8 	b	8934 <_free_r+0x124>
    89d0:	e3832001 	orr	r2, r3, #1
    89d4:	e581c014 	str	ip, [r1, #20]
    89d8:	e581c010 	str	ip, [r1, #16]
    89dc:	e58c000c 	str	r0, [ip, #12]
    89e0:	e58c0008 	str	r0, [ip, #8]
    89e4:	e58c2004 	str	r2, [ip, #4]
    89e8:	e78c3003 	str	r3, [ip, r3]
    89ec:	eaffffd0 	b	8934 <_free_r+0x124>
    89f0:	e3520014 	cmp	r2, #20
    89f4:	9282e05b 	addls	lr, r2, #91	; 0x5b
    89f8:	91a0008e 	lslls	r0, lr, #1
    89fc:	9affffbb 	bls	88f0 <_free_r+0xe0>
    8a00:	e3520054 	cmp	r2, #84	; 0x54
    8a04:	8a00000a 	bhi	8a34 <_free_r+0x224>
    8a08:	e1a0e623 	lsr	lr, r3, #12
    8a0c:	e28ee06e 	add	lr, lr, #110	; 0x6e
    8a10:	e1a0008e 	lsl	r0, lr, #1
    8a14:	eaffffb5 	b	88f0 <_free_r+0xe0>
    8a18:	e5913004 	ldr	r3, [r1, #4]
    8a1c:	e1a0e14e 	asr	lr, lr, #2
    8a20:	e3a00001 	mov	r0, #1
    8a24:	e1830e10 	orr	r0, r3, r0, lsl lr
    8a28:	e1a03002 	mov	r3, r2
    8a2c:	e5810004 	str	r0, [r1, #4]
    8a30:	eaffffbb 	b	8924 <_free_r+0x114>
    8a34:	e3520f55 	cmp	r2, #340	; 0x154
    8a38:	91a0e7a3 	lsrls	lr, r3, #15
    8a3c:	928ee077 	addls	lr, lr, #119	; 0x77
    8a40:	91a0008e 	lslls	r0, lr, #1
    8a44:	9affffa9 	bls	88f0 <_free_r+0xe0>
    8a48:	e59f0028 	ldr	r0, [pc, #40]	; 8a78 <_free_r+0x268>
    8a4c:	e1520000 	cmp	r2, r0
    8a50:	91a0e923 	lsrls	lr, r3, #18
    8a54:	928ee07c 	addls	lr, lr, #124	; 0x7c
    8a58:	91a0008e 	lslls	r0, lr, #1
    8a5c:	83a000fc 	movhi	r0, #252	; 0xfc
    8a60:	83a0e07e 	movhi	lr, #126	; 0x7e
    8a64:	eaffffa1 	b	88f0 <_free_r+0xe0>
    8a68:	0000963c 	andeq	r9, r0, ip, lsr r6
    8a6c:	00009644 	andeq	r9, r0, r4, asr #12
    8a70:	00009a44 	andeq	r9, r0, r4, asr #20
    8a74:	00009a5c 	andeq	r9, r0, ip, asr sl
    8a78:	00000554 	andeq	r0, r0, r4, asr r5

00008a7c <_malloc_r>:
    8a7c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8a80:	e281500b 	add	r5, r1, #11
    8a84:	e3550016 	cmp	r5, #22
    8a88:	83c55007 	bichi	r5, r5, #7
    8a8c:	81a03fa5 	lsrhi	r3, r5, #31
    8a90:	93a03000 	movls	r3, #0
    8a94:	93a05010 	movls	r5, #16
    8a98:	e1550001 	cmp	r5, r1
    8a9c:	21a01003 	movcs	r1, r3
    8aa0:	33831001 	orrcc	r1, r3, #1
    8aa4:	e3510000 	cmp	r1, #0
    8aa8:	13a0300c 	movne	r3, #12
    8aac:	e24dd00c 	sub	sp, sp, #12
    8ab0:	e1a06000 	mov	r6, r0
    8ab4:	15803000 	strne	r3, [r0]
    8ab8:	13a04000 	movne	r4, #0
    8abc:	1a000015 	bne	8b18 <_malloc_r+0x9c>
    8ac0:	eb0001bc 	bl	91b8 <__malloc_lock>
    8ac4:	e3550f7e 	cmp	r5, #504	; 0x1f8
    8ac8:	2a000016 	bcs	8b28 <_malloc_r+0xac>
    8acc:	e59f76c8 	ldr	r7, [pc, #1736]	; 919c <_malloc_r+0x720>
    8ad0:	e1a0e1a5 	lsr	lr, r5, #3
    8ad4:	e087318e 	add	r3, r7, lr, lsl #3
    8ad8:	e593400c 	ldr	r4, [r3, #12]
    8adc:	e1540003 	cmp	r4, r3
    8ae0:	0a00014f 	beq	9024 <_malloc_r+0x5a8>
    8ae4:	e5943004 	ldr	r3, [r4, #4]
    8ae8:	e3c33003 	bic	r3, r3, #3
    8aec:	e0843003 	add	r3, r4, r3
    8af0:	e5930004 	ldr	r0, [r3, #4]
    8af4:	e2841008 	add	r1, r4, #8
    8af8:	e8910006 	ldm	r1, {r1, r2}
    8afc:	e3800001 	orr	r0, r0, #1
    8b00:	e5830004 	str	r0, [r3, #4]
    8b04:	e581200c 	str	r2, [r1, #12]
    8b08:	e5821008 	str	r1, [r2, #8]
    8b0c:	e1a00006 	mov	r0, r6
    8b10:	eb0001a9 	bl	91bc <__malloc_unlock>
    8b14:	e2844008 	add	r4, r4, #8
    8b18:	e1a00004 	mov	r0, r4
    8b1c:	e28dd00c 	add	sp, sp, #12
    8b20:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8b24:	e12fff1e 	bx	lr
    8b28:	e1b0e4a5 	lsrs	lr, r5, #9
    8b2c:	01a0e1a5 	lsreq	lr, r5, #3
    8b30:	01a0108e 	lsleq	r1, lr, #1
    8b34:	1a000061 	bne	8cc0 <_malloc_r+0x244>
    8b38:	e59f765c 	ldr	r7, [pc, #1628]	; 919c <_malloc_r+0x720>
    8b3c:	e0871101 	add	r1, r7, r1, lsl #2
    8b40:	e591400c 	ldr	r4, [r1, #12]
    8b44:	e1510004 	cmp	r1, r4
    8b48:	1a000005 	bne	8b64 <_malloc_r+0xe8>
    8b4c:	ea00000a 	b	8b7c <_malloc_r+0x100>
    8b50:	e3530000 	cmp	r3, #0
    8b54:	aa0000db 	bge	8ec8 <_malloc_r+0x44c>
    8b58:	e594400c 	ldr	r4, [r4, #12]
    8b5c:	e1510004 	cmp	r1, r4
    8b60:	0a000005 	beq	8b7c <_malloc_r+0x100>
    8b64:	e5942004 	ldr	r2, [r4, #4]
    8b68:	e3c22003 	bic	r2, r2, #3
    8b6c:	e0653002 	rsb	r3, r5, r2
    8b70:	e353000f 	cmp	r3, #15
    8b74:	dafffff5 	ble	8b50 <_malloc_r+0xd4>
    8b78:	e24ee001 	sub	lr, lr, #1
    8b7c:	e28ee001 	add	lr, lr, #1
    8b80:	e59f3614 	ldr	r3, [pc, #1556]	; 919c <_malloc_r+0x720>
    8b84:	e5974010 	ldr	r4, [r7, #16]
    8b88:	e2838008 	add	r8, r3, #8
    8b8c:	e1540008 	cmp	r4, r8
    8b90:	05931004 	ldreq	r1, [r3, #4]
    8b94:	0a000016 	beq	8bf4 <_malloc_r+0x178>
    8b98:	e5942004 	ldr	r2, [r4, #4]
    8b9c:	e3c22003 	bic	r2, r2, #3
    8ba0:	e0651002 	rsb	r1, r5, r2
    8ba4:	e351000f 	cmp	r1, #15
    8ba8:	ca0000fb 	bgt	8f9c <_malloc_r+0x520>
    8bac:	e3510000 	cmp	r1, #0
    8bb0:	e5838014 	str	r8, [r3, #20]
    8bb4:	e5838010 	str	r8, [r3, #16]
    8bb8:	aa000046 	bge	8cd8 <_malloc_r+0x25c>
    8bbc:	e3520c02 	cmp	r2, #512	; 0x200
    8bc0:	2a0000d6 	bcs	8f20 <_malloc_r+0x4a4>
    8bc4:	e5930004 	ldr	r0, [r3, #4]
    8bc8:	e1a021a2 	lsr	r2, r2, #3
    8bcc:	e1a01142 	asr	r1, r2, #2
    8bd0:	e3a0c001 	mov	ip, #1
    8bd4:	e180111c 	orr	r1, r0, ip, lsl r1
    8bd8:	e0832182 	add	r2, r3, r2, lsl #3
    8bdc:	e5920008 	ldr	r0, [r2, #8]
    8be0:	e584200c 	str	r2, [r4, #12]
    8be4:	e5840008 	str	r0, [r4, #8]
    8be8:	e5831004 	str	r1, [r3, #4]
    8bec:	e5824008 	str	r4, [r2, #8]
    8bf0:	e580400c 	str	r4, [r0, #12]
    8bf4:	e1a0314e 	asr	r3, lr, #2
    8bf8:	e3a00001 	mov	r0, #1
    8bfc:	e1a00310 	lsl	r0, r0, r3
    8c00:	e1500001 	cmp	r0, r1
    8c04:	8a00003b 	bhi	8cf8 <_malloc_r+0x27c>
    8c08:	e1110000 	tst	r1, r0
    8c0c:	1a000008 	bne	8c34 <_malloc_r+0x1b8>
    8c10:	e1a00080 	lsl	r0, r0, #1
    8c14:	e3cee003 	bic	lr, lr, #3
    8c18:	e1110000 	tst	r1, r0
    8c1c:	e28ee004 	add	lr, lr, #4
    8c20:	1a000003 	bne	8c34 <_malloc_r+0x1b8>
    8c24:	e1a00080 	lsl	r0, r0, #1
    8c28:	e1110000 	tst	r1, r0
    8c2c:	e28ee004 	add	lr, lr, #4
    8c30:	0afffffb 	beq	8c24 <_malloc_r+0x1a8>
    8c34:	e087a18e 	add	sl, r7, lr, lsl #3
    8c38:	e1a0c00a 	mov	ip, sl
    8c3c:	e1a0400e 	mov	r4, lr
    8c40:	e59c300c 	ldr	r3, [ip, #12]
    8c44:	e15c0003 	cmp	ip, r3
    8c48:	1a000005 	bne	8c64 <_malloc_r+0x1e8>
    8c4c:	ea0000df 	b	8fd0 <_malloc_r+0x554>
    8c50:	e3520000 	cmp	r2, #0
    8c54:	aa0000f8 	bge	903c <_malloc_r+0x5c0>
    8c58:	e593300c 	ldr	r3, [r3, #12]
    8c5c:	e15c0003 	cmp	ip, r3
    8c60:	0a0000da 	beq	8fd0 <_malloc_r+0x554>
    8c64:	e5931004 	ldr	r1, [r3, #4]
    8c68:	e3c11003 	bic	r1, r1, #3
    8c6c:	e0652001 	rsb	r2, r5, r1
    8c70:	e352000f 	cmp	r2, #15
    8c74:	dafffff5 	ble	8c50 <_malloc_r+0x1d4>
    8c78:	e1a04003 	mov	r4, r3
    8c7c:	e593000c 	ldr	r0, [r3, #12]
    8c80:	e5b4c008 	ldr	ip, [r4, #8]!
    8c84:	e0831005 	add	r1, r3, r5
    8c88:	e382e001 	orr	lr, r2, #1
    8c8c:	e3855001 	orr	r5, r5, #1
    8c90:	e58c000c 	str	r0, [ip, #12]
    8c94:	e580c008 	str	ip, [r0, #8]
    8c98:	e5835004 	str	r5, [r3, #4]
    8c9c:	e5871014 	str	r1, [r7, #20]
    8ca0:	e5871010 	str	r1, [r7, #16]
    8ca4:	e581800c 	str	r8, [r1, #12]
    8ca8:	e5818008 	str	r8, [r1, #8]
    8cac:	e581e004 	str	lr, [r1, #4]
    8cb0:	e7812002 	str	r2, [r1, r2]
    8cb4:	e1a00006 	mov	r0, r6
    8cb8:	eb00013f 	bl	91bc <__malloc_unlock>
    8cbc:	eaffff95 	b	8b18 <_malloc_r+0x9c>
    8cc0:	e35e0004 	cmp	lr, #4
    8cc4:	8a00008b 	bhi	8ef8 <_malloc_r+0x47c>
    8cc8:	e1a0e325 	lsr	lr, r5, #6
    8ccc:	e28ee038 	add	lr, lr, #56	; 0x38
    8cd0:	e1a0108e 	lsl	r1, lr, #1
    8cd4:	eaffff97 	b	8b38 <_malloc_r+0xbc>
    8cd8:	e0842002 	add	r2, r4, r2
    8cdc:	e5923004 	ldr	r3, [r2, #4]
    8ce0:	e3833001 	orr	r3, r3, #1
    8ce4:	e5823004 	str	r3, [r2, #4]
    8ce8:	e1a00006 	mov	r0, r6
    8cec:	eb000132 	bl	91bc <__malloc_unlock>
    8cf0:	e2844008 	add	r4, r4, #8
    8cf4:	eaffff87 	b	8b18 <_malloc_r+0x9c>
    8cf8:	e5974008 	ldr	r4, [r7, #8]
    8cfc:	e594a004 	ldr	sl, [r4, #4]
    8d00:	e3caa003 	bic	sl, sl, #3
    8d04:	e155000a 	cmp	r5, sl
    8d08:	8a000002 	bhi	8d18 <_malloc_r+0x29c>
    8d0c:	e065300a 	rsb	r3, r5, sl
    8d10:	e353000f 	cmp	r3, #15
    8d14:	ca000061 	bgt	8ea0 <_malloc_r+0x424>
    8d18:	e59fc480 	ldr	ip, [pc, #1152]	; 91a0 <_malloc_r+0x724>
    8d1c:	e59f2480 	ldr	r2, [pc, #1152]	; 91a4 <_malloc_r+0x728>
    8d20:	e59c3000 	ldr	r3, [ip]
    8d24:	e592b000 	ldr	fp, [r2]
    8d28:	e3730001 	cmn	r3, #1
    8d2c:	e085b00b 	add	fp, r5, fp
    8d30:	128bba01 	addne	fp, fp, #4096	; 0x1000
    8d34:	128bb00f 	addne	fp, fp, #15
    8d38:	13cbbeff 	bicne	fp, fp, #4080	; 0xff0
    8d3c:	028bb010 	addeq	fp, fp, #16
    8d40:	13cbb00f 	bicne	fp, fp, #15
    8d44:	e084200a 	add	r2, r4, sl
    8d48:	e1a00006 	mov	r0, r6
    8d4c:	e1a0100b 	mov	r1, fp
    8d50:	e58d2004 	str	r2, [sp, #4]
    8d54:	e58dc000 	str	ip, [sp]
    8d58:	eb000118 	bl	91c0 <_sbrk_r>
    8d5c:	e3700001 	cmn	r0, #1
    8d60:	e1a08000 	mov	r8, r0
    8d64:	e59d2004 	ldr	r2, [sp, #4]
    8d68:	e59dc000 	ldr	ip, [sp]
    8d6c:	0a0000e3 	beq	9100 <_malloc_r+0x684>
    8d70:	e1520000 	cmp	r2, r0
    8d74:	8a0000c0 	bhi	907c <_malloc_r+0x600>
    8d78:	e59f9428 	ldr	r9, [pc, #1064]	; 91a8 <_malloc_r+0x72c>
    8d7c:	e5993000 	ldr	r3, [r9]
    8d80:	e1520008 	cmp	r2, r8
    8d84:	e08b3003 	add	r3, fp, r3
    8d88:	e5893000 	str	r3, [r9]
    8d8c:	0a0000df 	beq	9110 <_malloc_r+0x694>
    8d90:	e59c1000 	ldr	r1, [ip]
    8d94:	e3710001 	cmn	r1, #1
    8d98:	10622008 	rsbne	r2, r2, r8
    8d9c:	059f33fc 	ldreq	r3, [pc, #1020]	; 91a0 <_malloc_r+0x724>
    8da0:	10833002 	addne	r3, r3, r2
    8da4:	05838000 	streq	r8, [r3]
    8da8:	15893000 	strne	r3, [r9]
    8dac:	e2183007 	ands	r3, r8, #7
    8db0:	12632008 	rsbne	r2, r3, #8
    8db4:	10888002 	addne	r8, r8, r2
    8db8:	12633a01 	rsbne	r3, r3, #4096	; 0x1000
    8dbc:	12832008 	addne	r2, r3, #8
    8dc0:	e088300b 	add	r3, r8, fp
    8dc4:	03a02a01 	moveq	r2, #4096	; 0x1000
    8dc8:	e1a03a03 	lsl	r3, r3, #20
    8dcc:	e042ba23 	sub	fp, r2, r3, lsr #20
    8dd0:	e1a0100b 	mov	r1, fp
    8dd4:	e1a00006 	mov	r0, r6
    8dd8:	eb0000f8 	bl	91c0 <_sbrk_r>
    8ddc:	e3700001 	cmn	r0, #1
    8de0:	10682000 	rsbne	r2, r8, r0
    8de4:	e5993000 	ldr	r3, [r9]
    8de8:	108b2002 	addne	r2, fp, r2
    8dec:	03a0b000 	moveq	fp, #0
    8df0:	13822001 	orrne	r2, r2, #1
    8df4:	03a02001 	moveq	r2, #1
    8df8:	e08b3003 	add	r3, fp, r3
    8dfc:	e1540007 	cmp	r4, r7
    8e00:	e5893000 	str	r3, [r9]
    8e04:	e5878008 	str	r8, [r7, #8]
    8e08:	e5882004 	str	r2, [r8, #4]
    8e0c:	0a00000d 	beq	8e48 <_malloc_r+0x3cc>
    8e10:	e35a000f 	cmp	sl, #15
    8e14:	9a0000ac 	bls	90cc <_malloc_r+0x650>
    8e18:	e594c004 	ldr	ip, [r4, #4]
    8e1c:	e24a200c 	sub	r2, sl, #12
    8e20:	e3c22007 	bic	r2, r2, #7
    8e24:	e20cc001 	and	ip, ip, #1
    8e28:	e0841002 	add	r1, r4, r2
    8e2c:	e3a00005 	mov	r0, #5
    8e30:	e182c00c 	orr	ip, r2, ip
    8e34:	e352000f 	cmp	r2, #15
    8e38:	e584c004 	str	ip, [r4, #4]
    8e3c:	e5810004 	str	r0, [r1, #4]
    8e40:	e5810008 	str	r0, [r1, #8]
    8e44:	8a0000b8 	bhi	912c <_malloc_r+0x6b0>
    8e48:	e59f235c 	ldr	r2, [pc, #860]	; 91ac <_malloc_r+0x730>
    8e4c:	e5921000 	ldr	r1, [r2]
    8e50:	e1530001 	cmp	r3, r1
    8e54:	85823000 	strhi	r3, [r2]
    8e58:	e59f2350 	ldr	r2, [pc, #848]	; 91b0 <_malloc_r+0x734>
    8e5c:	e5921000 	ldr	r1, [r2]
    8e60:	e5974008 	ldr	r4, [r7, #8]
    8e64:	e1530001 	cmp	r3, r1
    8e68:	95943004 	ldrls	r3, [r4, #4]
    8e6c:	85941004 	ldrhi	r1, [r4, #4]
    8e70:	85823000 	strhi	r3, [r2]
    8e74:	93c33003 	bicls	r3, r3, #3
    8e78:	83c13003 	bichi	r3, r1, #3
    8e7c:	e1550003 	cmp	r5, r3
    8e80:	e0653003 	rsb	r3, r5, r3
    8e84:	8a000001 	bhi	8e90 <_malloc_r+0x414>
    8e88:	e353000f 	cmp	r3, #15
    8e8c:	ca000003 	bgt	8ea0 <_malloc_r+0x424>
    8e90:	e1a00006 	mov	r0, r6
    8e94:	eb0000c8 	bl	91bc <__malloc_unlock>
    8e98:	e3a04000 	mov	r4, #0
    8e9c:	eaffff1d 	b	8b18 <_malloc_r+0x9c>
    8ea0:	e0842005 	add	r2, r4, r5
    8ea4:	e3833001 	orr	r3, r3, #1
    8ea8:	e3855001 	orr	r5, r5, #1
    8eac:	e5845004 	str	r5, [r4, #4]
    8eb0:	e1a00006 	mov	r0, r6
    8eb4:	e5823004 	str	r3, [r2, #4]
    8eb8:	e5872008 	str	r2, [r7, #8]
    8ebc:	e2844008 	add	r4, r4, #8
    8ec0:	eb0000bd 	bl	91bc <__malloc_unlock>
    8ec4:	eaffff13 	b	8b18 <_malloc_r+0x9c>
    8ec8:	e0842002 	add	r2, r4, r2
    8ecc:	e5920004 	ldr	r0, [r2, #4]
    8ed0:	e2841008 	add	r1, r4, #8
    8ed4:	e891000a 	ldm	r1, {r1, r3}
    8ed8:	e3800001 	orr	r0, r0, #1
    8edc:	e5820004 	str	r0, [r2, #4]
    8ee0:	e581300c 	str	r3, [r1, #12]
    8ee4:	e5831008 	str	r1, [r3, #8]
    8ee8:	e1a00006 	mov	r0, r6
    8eec:	eb0000b2 	bl	91bc <__malloc_unlock>
    8ef0:	e2844008 	add	r4, r4, #8
    8ef4:	eaffff07 	b	8b18 <_malloc_r+0x9c>
    8ef8:	e35e0014 	cmp	lr, #20
    8efc:	928ee05b 	addls	lr, lr, #91	; 0x5b
    8f00:	91a0108e 	lslls	r1, lr, #1
    8f04:	9affff0b 	bls	8b38 <_malloc_r+0xbc>
    8f08:	e35e0054 	cmp	lr, #84	; 0x54
    8f0c:	8a000061 	bhi	9098 <_malloc_r+0x61c>
    8f10:	e1a0e625 	lsr	lr, r5, #12
    8f14:	e28ee06e 	add	lr, lr, #110	; 0x6e
    8f18:	e1a0108e 	lsl	r1, lr, #1
    8f1c:	eaffff05 	b	8b38 <_malloc_r+0xbc>
    8f20:	e1a034a2 	lsr	r3, r2, #9
    8f24:	e3530004 	cmp	r3, #4
    8f28:	9a00004f 	bls	906c <_malloc_r+0x5f0>
    8f2c:	e3530014 	cmp	r3, #20
    8f30:	9283a05b 	addls	sl, r3, #91	; 0x5b
    8f34:	91a0008a 	lslls	r0, sl, #1
    8f38:	9a000004 	bls	8f50 <_malloc_r+0x4d4>
    8f3c:	e3530054 	cmp	r3, #84	; 0x54
    8f40:	8a00007f 	bhi	9144 <_malloc_r+0x6c8>
    8f44:	e1a0a622 	lsr	sl, r2, #12
    8f48:	e28aa06e 	add	sl, sl, #110	; 0x6e
    8f4c:	e1a0008a 	lsl	r0, sl, #1
    8f50:	e0870100 	add	r0, r7, r0, lsl #2
    8f54:	e5903008 	ldr	r3, [r0, #8]
    8f58:	e1530000 	cmp	r3, r0
    8f5c:	e59fc238 	ldr	ip, [pc, #568]	; 919c <_malloc_r+0x720>
    8f60:	0a000052 	beq	90b0 <_malloc_r+0x634>
    8f64:	e5931004 	ldr	r1, [r3, #4]
    8f68:	e3c11003 	bic	r1, r1, #3
    8f6c:	e1520001 	cmp	r2, r1
    8f70:	2a000002 	bcs	8f80 <_malloc_r+0x504>
    8f74:	e5933008 	ldr	r3, [r3, #8]
    8f78:	e1500003 	cmp	r0, r3
    8f7c:	1afffff8 	bne	8f64 <_malloc_r+0x4e8>
    8f80:	e593200c 	ldr	r2, [r3, #12]
    8f84:	e5971004 	ldr	r1, [r7, #4]
    8f88:	e584200c 	str	r2, [r4, #12]
    8f8c:	e5843008 	str	r3, [r4, #8]
    8f90:	e583400c 	str	r4, [r3, #12]
    8f94:	e5824008 	str	r4, [r2, #8]
    8f98:	eaffff15 	b	8bf4 <_malloc_r+0x178>
    8f9c:	e0842005 	add	r2, r4, r5
    8fa0:	e3810001 	orr	r0, r1, #1
    8fa4:	e3855001 	orr	r5, r5, #1
    8fa8:	e5845004 	str	r5, [r4, #4]
    8fac:	e5832014 	str	r2, [r3, #20]
    8fb0:	e5832010 	str	r2, [r3, #16]
    8fb4:	e582800c 	str	r8, [r2, #12]
    8fb8:	e9820101 	stmib	r2, {r0, r8}
    8fbc:	e7821001 	str	r1, [r2, r1]
    8fc0:	e1a00006 	mov	r0, r6
    8fc4:	eb00007c 	bl	91bc <__malloc_unlock>
    8fc8:	e2844008 	add	r4, r4, #8
    8fcc:	eafffed1 	b	8b18 <_malloc_r+0x9c>
    8fd0:	e2844001 	add	r4, r4, #1
    8fd4:	e3140003 	tst	r4, #3
    8fd8:	e28cc008 	add	ip, ip, #8
    8fdc:	1affff17 	bne	8c40 <_malloc_r+0x1c4>
    8fe0:	e31e0003 	tst	lr, #3
    8fe4:	e24a3008 	sub	r3, sl, #8
    8fe8:	0a000062 	beq	9178 <_malloc_r+0x6fc>
    8fec:	e59aa000 	ldr	sl, [sl]
    8ff0:	e15a0003 	cmp	sl, r3
    8ff4:	e24ee001 	sub	lr, lr, #1
    8ff8:	0afffff8 	beq	8fe0 <_malloc_r+0x564>
    8ffc:	e5973004 	ldr	r3, [r7, #4]
    9000:	e1a00080 	lsl	r0, r0, #1
    9004:	e1500003 	cmp	r0, r3
    9008:	8affff3a 	bhi	8cf8 <_malloc_r+0x27c>
    900c:	e3500000 	cmp	r0, #0
    9010:	0affff38 	beq	8cf8 <_malloc_r+0x27c>
    9014:	e1130000 	tst	r3, r0
    9018:	0a00005a 	beq	9188 <_malloc_r+0x70c>
    901c:	e1a0e004 	mov	lr, r4
    9020:	eaffff03 	b	8c34 <_malloc_r+0x1b8>
    9024:	e2843008 	add	r3, r4, #8
    9028:	e5944014 	ldr	r4, [r4, #20]
    902c:	e1530004 	cmp	r3, r4
    9030:	028ee002 	addeq	lr, lr, #2
    9034:	0afffed1 	beq	8b80 <_malloc_r+0x104>
    9038:	eafffea9 	b	8ae4 <_malloc_r+0x68>
    903c:	e0831001 	add	r1, r3, r1
    9040:	e5910004 	ldr	r0, [r1, #4]
    9044:	e1a04003 	mov	r4, r3
    9048:	e5b42008 	ldr	r2, [r4, #8]!
    904c:	e593300c 	ldr	r3, [r3, #12]
    9050:	e3800001 	orr	r0, r0, #1
    9054:	e5810004 	str	r0, [r1, #4]
    9058:	e582300c 	str	r3, [r2, #12]
    905c:	e5832008 	str	r2, [r3, #8]
    9060:	e1a00006 	mov	r0, r6
    9064:	eb000054 	bl	91bc <__malloc_unlock>
    9068:	eafffeaa 	b	8b18 <_malloc_r+0x9c>
    906c:	e1a0a322 	lsr	sl, r2, #6
    9070:	e28aa038 	add	sl, sl, #56	; 0x38
    9074:	e1a0008a 	lsl	r0, sl, #1
    9078:	eaffffb4 	b	8f50 <_malloc_r+0x4d4>
    907c:	e1540007 	cmp	r4, r7
    9080:	0affff3c 	beq	8d78 <_malloc_r+0x2fc>
    9084:	e59f3110 	ldr	r3, [pc, #272]	; 919c <_malloc_r+0x720>
    9088:	e5934008 	ldr	r4, [r3, #8]
    908c:	e5943004 	ldr	r3, [r4, #4]
    9090:	e3c33003 	bic	r3, r3, #3
    9094:	eaffff78 	b	8e7c <_malloc_r+0x400>
    9098:	e35e0f55 	cmp	lr, #340	; 0x154
    909c:	8a00000f 	bhi	90e0 <_malloc_r+0x664>
    90a0:	e1a0e7a5 	lsr	lr, r5, #15
    90a4:	e28ee077 	add	lr, lr, #119	; 0x77
    90a8:	e1a0108e 	lsl	r1, lr, #1
    90ac:	eafffea1 	b	8b38 <_malloc_r+0xbc>
    90b0:	e59c2004 	ldr	r2, [ip, #4]
    90b4:	e1a0a14a 	asr	sl, sl, #2
    90b8:	e3a01001 	mov	r1, #1
    90bc:	e1821a11 	orr	r1, r2, r1, lsl sl
    90c0:	e1a02003 	mov	r2, r3
    90c4:	e58c1004 	str	r1, [ip, #4]
    90c8:	eaffffae 	b	8f88 <_malloc_r+0x50c>
    90cc:	e3a03001 	mov	r3, #1
    90d0:	e5883004 	str	r3, [r8, #4]
    90d4:	e1a04008 	mov	r4, r8
    90d8:	e3a03000 	mov	r3, #0
    90dc:	eaffff66 	b	8e7c <_malloc_r+0x400>
    90e0:	e59f30cc 	ldr	r3, [pc, #204]	; 91b4 <_malloc_r+0x738>
    90e4:	e15e0003 	cmp	lr, r3
    90e8:	91a0e925 	lsrls	lr, r5, #18
    90ec:	928ee07c 	addls	lr, lr, #124	; 0x7c
    90f0:	91a0108e 	lslls	r1, lr, #1
    90f4:	83a010fc 	movhi	r1, #252	; 0xfc
    90f8:	83a0e07e 	movhi	lr, #126	; 0x7e
    90fc:	eafffe8d 	b	8b38 <_malloc_r+0xbc>
    9100:	e5974008 	ldr	r4, [r7, #8]
    9104:	e5943004 	ldr	r3, [r4, #4]
    9108:	e3c33003 	bic	r3, r3, #3
    910c:	eaffff5a 	b	8e7c <_malloc_r+0x400>
    9110:	e1b01a02 	lsls	r1, r2, #20
    9114:	1affff1d 	bne	8d90 <_malloc_r+0x314>
    9118:	e5972008 	ldr	r2, [r7, #8]
    911c:	e08b100a 	add	r1, fp, sl
    9120:	e3811001 	orr	r1, r1, #1
    9124:	e5821004 	str	r1, [r2, #4]
    9128:	eaffff46 	b	8e48 <_malloc_r+0x3cc>
    912c:	e1a00006 	mov	r0, r6
    9130:	e2841008 	add	r1, r4, #8
    9134:	ebfffdb5 	bl	8810 <_free_r>
    9138:	e59f3068 	ldr	r3, [pc, #104]	; 91a8 <_malloc_r+0x72c>
    913c:	e5933000 	ldr	r3, [r3]
    9140:	eaffff40 	b	8e48 <_malloc_r+0x3cc>
    9144:	e3530f55 	cmp	r3, #340	; 0x154
    9148:	91a0a7a2 	lsrls	sl, r2, #15
    914c:	928aa077 	addls	sl, sl, #119	; 0x77
    9150:	91a0008a 	lslls	r0, sl, #1
    9154:	9affff7d 	bls	8f50 <_malloc_r+0x4d4>
    9158:	e59f1054 	ldr	r1, [pc, #84]	; 91b4 <_malloc_r+0x738>
    915c:	e1530001 	cmp	r3, r1
    9160:	91a0a922 	lsrls	sl, r2, #18
    9164:	928aa07c 	addls	sl, sl, #124	; 0x7c
    9168:	91a0008a 	lslls	r0, sl, #1
    916c:	83a000fc 	movhi	r0, #252	; 0xfc
    9170:	83a0a07e 	movhi	sl, #126	; 0x7e
    9174:	eaffff75 	b	8f50 <_malloc_r+0x4d4>
    9178:	e5973004 	ldr	r3, [r7, #4]
    917c:	e1c33000 	bic	r3, r3, r0
    9180:	e5873004 	str	r3, [r7, #4]
    9184:	eaffff9d 	b	9000 <_malloc_r+0x584>
    9188:	e1a00080 	lsl	r0, r0, #1
    918c:	e1130000 	tst	r3, r0
    9190:	e2844004 	add	r4, r4, #4
    9194:	1affffa0 	bne	901c <_malloc_r+0x5a0>
    9198:	eafffffa 	b	9188 <_malloc_r+0x70c>
    919c:	0000963c 	andeq	r9, r0, ip, lsr r6
    91a0:	00009a48 	andeq	r9, r0, r8, asr #20
    91a4:	00009a5c 	andeq	r9, r0, ip, asr sl
    91a8:	00009a60 	andeq	r9, r0, r0, ror #20
    91ac:	00009a58 	andeq	r9, r0, r8, asr sl
    91b0:	00009a54 	andeq	r9, r0, r4, asr sl
    91b4:	00000554 	andeq	r0, r0, r4, asr r5

000091b8 <__malloc_lock>:
    91b8:	e12fff1e 	bx	lr

000091bc <__malloc_unlock>:
    91bc:	e12fff1e 	bx	lr

000091c0 <_sbrk_r>:
    91c0:	e92d4038 	push	{r3, r4, r5, lr}
    91c4:	e59f4030 	ldr	r4, [pc, #48]	; 91fc <_sbrk_r+0x3c>
    91c8:	e3a03000 	mov	r3, #0
    91cc:	e1a05000 	mov	r5, r0
    91d0:	e1a00001 	mov	r0, r1
    91d4:	e5843000 	str	r3, [r4]
    91d8:	ebfffc42 	bl	82e8 <_sbrk>
    91dc:	e3700001 	cmn	r0, #1
    91e0:	0a000001 	beq	91ec <_sbrk_r+0x2c>
    91e4:	e8bd4038 	pop	{r3, r4, r5, lr}
    91e8:	e12fff1e 	bx	lr
    91ec:	e5943000 	ldr	r3, [r4]
    91f0:	e3530000 	cmp	r3, #0
    91f4:	15853000 	strne	r3, [r5]
    91f8:	eafffff9 	b	91e4 <_sbrk_r+0x24>
    91fc:	00009a88 	andeq	r9, r0, r8, lsl #21

Disassembly of section .rodata:

00009200 <_global_impure_ptr-0x4>:
    9200:	00000043 	andeq	r0, r0, r3, asr #32

00009204 <_global_impure_ptr>:
    9204:	00009210 	andeq	r9, r0, r0, lsl r2

Disassembly of section .data:

00009208 <__data_start>:
    9208:	00009a4c 	andeq	r9, r0, ip, asr #20

0000920c <gpioController>:
    920c:	20200000 	eorcs	r0, r0, r0

00009210 <impure_data>:
    9210:	00000000 	andeq	r0, r0, r0
    9214:	000094fc 	strdeq	r9, [r0], -ip
    9218:	00009564 	andeq	r9, r0, r4, ror #10
    921c:	000095cc 	andeq	r9, r0, ip, asr #11
	...
    9244:	00009200 	andeq	r9, r0, r0, lsl #4
	...
    92b8:	00000001 	andeq	r0, r0, r1
    92bc:	00000000 	andeq	r0, r0, r0
    92c0:	abcd330e 	blge	ff355f00 <_stack+0xff2d5f00>
    92c4:	e66d1234 			; <UNDEFINED> instruction: 0xe66d1234
    92c8:	0005deec 	andeq	sp, r5, ip, ror #29
    92cc:	0000000b 	andeq	r0, r0, fp
	...

00009638 <_impure_ptr>:
    9638:	00009210 	andeq	r9, r0, r0, lsl r2

0000963c <__malloc_av_>:
	...
    9644:	0000963c 	andeq	r9, r0, ip, lsr r6
    9648:	0000963c 	andeq	r9, r0, ip, lsr r6
    964c:	00009644 	andeq	r9, r0, r4, asr #12
    9650:	00009644 	andeq	r9, r0, r4, asr #12
    9654:	0000964c 	andeq	r9, r0, ip, asr #12
    9658:	0000964c 	andeq	r9, r0, ip, asr #12
    965c:	00009654 	andeq	r9, r0, r4, asr r6
    9660:	00009654 	andeq	r9, r0, r4, asr r6
    9664:	0000965c 	andeq	r9, r0, ip, asr r6
    9668:	0000965c 	andeq	r9, r0, ip, asr r6
    966c:	00009664 	andeq	r9, r0, r4, ror #12
    9670:	00009664 	andeq	r9, r0, r4, ror #12
    9674:	0000966c 	andeq	r9, r0, ip, ror #12
    9678:	0000966c 	andeq	r9, r0, ip, ror #12
    967c:	00009674 	andeq	r9, r0, r4, ror r6
    9680:	00009674 	andeq	r9, r0, r4, ror r6
    9684:	0000967c 	andeq	r9, r0, ip, ror r6
    9688:	0000967c 	andeq	r9, r0, ip, ror r6
    968c:	00009684 	andeq	r9, r0, r4, lsl #13
    9690:	00009684 	andeq	r9, r0, r4, lsl #13
    9694:	0000968c 	andeq	r9, r0, ip, lsl #13
    9698:	0000968c 	andeq	r9, r0, ip, lsl #13
    969c:	00009694 	muleq	r0, r4, r6
    96a0:	00009694 	muleq	r0, r4, r6
    96a4:	0000969c 	muleq	r0, ip, r6
    96a8:	0000969c 	muleq	r0, ip, r6
    96ac:	000096a4 	andeq	r9, r0, r4, lsr #13
    96b0:	000096a4 	andeq	r9, r0, r4, lsr #13
    96b4:	000096ac 	andeq	r9, r0, ip, lsr #13
    96b8:	000096ac 	andeq	r9, r0, ip, lsr #13
    96bc:	000096b4 			; <UNDEFINED> instruction: 0x000096b4
    96c0:	000096b4 			; <UNDEFINED> instruction: 0x000096b4
    96c4:	000096bc 			; <UNDEFINED> instruction: 0x000096bc
    96c8:	000096bc 			; <UNDEFINED> instruction: 0x000096bc
    96cc:	000096c4 	andeq	r9, r0, r4, asr #13
    96d0:	000096c4 	andeq	r9, r0, r4, asr #13
    96d4:	000096cc 	andeq	r9, r0, ip, asr #13
    96d8:	000096cc 	andeq	r9, r0, ip, asr #13
    96dc:	000096d4 	ldrdeq	r9, [r0], -r4
    96e0:	000096d4 	ldrdeq	r9, [r0], -r4
    96e4:	000096dc 	ldrdeq	r9, [r0], -ip
    96e8:	000096dc 	ldrdeq	r9, [r0], -ip
    96ec:	000096e4 	andeq	r9, r0, r4, ror #13
    96f0:	000096e4 	andeq	r9, r0, r4, ror #13
    96f4:	000096ec 	andeq	r9, r0, ip, ror #13
    96f8:	000096ec 	andeq	r9, r0, ip, ror #13
    96fc:	000096f4 	strdeq	r9, [r0], -r4
    9700:	000096f4 	strdeq	r9, [r0], -r4
    9704:	000096fc 	strdeq	r9, [r0], -ip
    9708:	000096fc 	strdeq	r9, [r0], -ip
    970c:	00009704 	andeq	r9, r0, r4, lsl #14
    9710:	00009704 	andeq	r9, r0, r4, lsl #14
    9714:	0000970c 	andeq	r9, r0, ip, lsl #14
    9718:	0000970c 	andeq	r9, r0, ip, lsl #14
    971c:	00009714 	andeq	r9, r0, r4, lsl r7
    9720:	00009714 	andeq	r9, r0, r4, lsl r7
    9724:	0000971c 	andeq	r9, r0, ip, lsl r7
    9728:	0000971c 	andeq	r9, r0, ip, lsl r7
    972c:	00009724 	andeq	r9, r0, r4, lsr #14
    9730:	00009724 	andeq	r9, r0, r4, lsr #14
    9734:	0000972c 	andeq	r9, r0, ip, lsr #14
    9738:	0000972c 	andeq	r9, r0, ip, lsr #14
    973c:	00009734 	andeq	r9, r0, r4, lsr r7
    9740:	00009734 	andeq	r9, r0, r4, lsr r7
    9744:	0000973c 	andeq	r9, r0, ip, lsr r7
    9748:	0000973c 	andeq	r9, r0, ip, lsr r7
    974c:	00009744 	andeq	r9, r0, r4, asr #14
    9750:	00009744 	andeq	r9, r0, r4, asr #14
    9754:	0000974c 	andeq	r9, r0, ip, asr #14
    9758:	0000974c 	andeq	r9, r0, ip, asr #14
    975c:	00009754 	andeq	r9, r0, r4, asr r7
    9760:	00009754 	andeq	r9, r0, r4, asr r7
    9764:	0000975c 	andeq	r9, r0, ip, asr r7
    9768:	0000975c 	andeq	r9, r0, ip, asr r7
    976c:	00009764 	andeq	r9, r0, r4, ror #14
    9770:	00009764 	andeq	r9, r0, r4, ror #14
    9774:	0000976c 	andeq	r9, r0, ip, ror #14
    9778:	0000976c 	andeq	r9, r0, ip, ror #14
    977c:	00009774 	andeq	r9, r0, r4, ror r7
    9780:	00009774 	andeq	r9, r0, r4, ror r7
    9784:	0000977c 	andeq	r9, r0, ip, ror r7
    9788:	0000977c 	andeq	r9, r0, ip, ror r7
    978c:	00009784 	andeq	r9, r0, r4, lsl #15
    9790:	00009784 	andeq	r9, r0, r4, lsl #15
    9794:	0000978c 	andeq	r9, r0, ip, lsl #15
    9798:	0000978c 	andeq	r9, r0, ip, lsl #15
    979c:	00009794 	muleq	r0, r4, r7
    97a0:	00009794 	muleq	r0, r4, r7
    97a4:	0000979c 	muleq	r0, ip, r7
    97a8:	0000979c 	muleq	r0, ip, r7
    97ac:	000097a4 	andeq	r9, r0, r4, lsr #15
    97b0:	000097a4 	andeq	r9, r0, r4, lsr #15
    97b4:	000097ac 	andeq	r9, r0, ip, lsr #15
    97b8:	000097ac 	andeq	r9, r0, ip, lsr #15
    97bc:	000097b4 			; <UNDEFINED> instruction: 0x000097b4
    97c0:	000097b4 			; <UNDEFINED> instruction: 0x000097b4
    97c4:	000097bc 			; <UNDEFINED> instruction: 0x000097bc
    97c8:	000097bc 			; <UNDEFINED> instruction: 0x000097bc
    97cc:	000097c4 	andeq	r9, r0, r4, asr #15
    97d0:	000097c4 	andeq	r9, r0, r4, asr #15
    97d4:	000097cc 	andeq	r9, r0, ip, asr #15
    97d8:	000097cc 	andeq	r9, r0, ip, asr #15
    97dc:	000097d4 	ldrdeq	r9, [r0], -r4
    97e0:	000097d4 	ldrdeq	r9, [r0], -r4
    97e4:	000097dc 	ldrdeq	r9, [r0], -ip
    97e8:	000097dc 	ldrdeq	r9, [r0], -ip
    97ec:	000097e4 	andeq	r9, r0, r4, ror #15
    97f0:	000097e4 	andeq	r9, r0, r4, ror #15
    97f4:	000097ec 	andeq	r9, r0, ip, ror #15
    97f8:	000097ec 	andeq	r9, r0, ip, ror #15
    97fc:	000097f4 	strdeq	r9, [r0], -r4
    9800:	000097f4 	strdeq	r9, [r0], -r4
    9804:	000097fc 	strdeq	r9, [r0], -ip
    9808:	000097fc 	strdeq	r9, [r0], -ip
    980c:	00009804 	andeq	r9, r0, r4, lsl #16
    9810:	00009804 	andeq	r9, r0, r4, lsl #16
    9814:	0000980c 	andeq	r9, r0, ip, lsl #16
    9818:	0000980c 	andeq	r9, r0, ip, lsl #16
    981c:	00009814 	andeq	r9, r0, r4, lsl r8
    9820:	00009814 	andeq	r9, r0, r4, lsl r8
    9824:	0000981c 	andeq	r9, r0, ip, lsl r8
    9828:	0000981c 	andeq	r9, r0, ip, lsl r8
    982c:	00009824 	andeq	r9, r0, r4, lsr #16
    9830:	00009824 	andeq	r9, r0, r4, lsr #16
    9834:	0000982c 	andeq	r9, r0, ip, lsr #16
    9838:	0000982c 	andeq	r9, r0, ip, lsr #16
    983c:	00009834 	andeq	r9, r0, r4, lsr r8
    9840:	00009834 	andeq	r9, r0, r4, lsr r8
    9844:	0000983c 	andeq	r9, r0, ip, lsr r8
    9848:	0000983c 	andeq	r9, r0, ip, lsr r8
    984c:	00009844 	andeq	r9, r0, r4, asr #16
    9850:	00009844 	andeq	r9, r0, r4, asr #16
    9854:	0000984c 	andeq	r9, r0, ip, asr #16
    9858:	0000984c 	andeq	r9, r0, ip, asr #16
    985c:	00009854 	andeq	r9, r0, r4, asr r8
    9860:	00009854 	andeq	r9, r0, r4, asr r8
    9864:	0000985c 	andeq	r9, r0, ip, asr r8
    9868:	0000985c 	andeq	r9, r0, ip, asr r8
    986c:	00009864 	andeq	r9, r0, r4, ror #16
    9870:	00009864 	andeq	r9, r0, r4, ror #16
    9874:	0000986c 	andeq	r9, r0, ip, ror #16
    9878:	0000986c 	andeq	r9, r0, ip, ror #16
    987c:	00009874 	andeq	r9, r0, r4, ror r8
    9880:	00009874 	andeq	r9, r0, r4, ror r8
    9884:	0000987c 	andeq	r9, r0, ip, ror r8
    9888:	0000987c 	andeq	r9, r0, ip, ror r8
    988c:	00009884 	andeq	r9, r0, r4, lsl #17
    9890:	00009884 	andeq	r9, r0, r4, lsl #17
    9894:	0000988c 	andeq	r9, r0, ip, lsl #17
    9898:	0000988c 	andeq	r9, r0, ip, lsl #17
    989c:	00009894 	muleq	r0, r4, r8
    98a0:	00009894 	muleq	r0, r4, r8
    98a4:	0000989c 	muleq	r0, ip, r8
    98a8:	0000989c 	muleq	r0, ip, r8
    98ac:	000098a4 	andeq	r9, r0, r4, lsr #17
    98b0:	000098a4 	andeq	r9, r0, r4, lsr #17
    98b4:	000098ac 	andeq	r9, r0, ip, lsr #17
    98b8:	000098ac 	andeq	r9, r0, ip, lsr #17
    98bc:	000098b4 			; <UNDEFINED> instruction: 0x000098b4
    98c0:	000098b4 			; <UNDEFINED> instruction: 0x000098b4
    98c4:	000098bc 			; <UNDEFINED> instruction: 0x000098bc
    98c8:	000098bc 			; <UNDEFINED> instruction: 0x000098bc
    98cc:	000098c4 	andeq	r9, r0, r4, asr #17
    98d0:	000098c4 	andeq	r9, r0, r4, asr #17
    98d4:	000098cc 	andeq	r9, r0, ip, asr #17
    98d8:	000098cc 	andeq	r9, r0, ip, asr #17
    98dc:	000098d4 	ldrdeq	r9, [r0], -r4
    98e0:	000098d4 	ldrdeq	r9, [r0], -r4
    98e4:	000098dc 	ldrdeq	r9, [r0], -ip
    98e8:	000098dc 	ldrdeq	r9, [r0], -ip
    98ec:	000098e4 	andeq	r9, r0, r4, ror #17
    98f0:	000098e4 	andeq	r9, r0, r4, ror #17
    98f4:	000098ec 	andeq	r9, r0, ip, ror #17
    98f8:	000098ec 	andeq	r9, r0, ip, ror #17
    98fc:	000098f4 	strdeq	r9, [r0], -r4
    9900:	000098f4 	strdeq	r9, [r0], -r4
    9904:	000098fc 	strdeq	r9, [r0], -ip
    9908:	000098fc 	strdeq	r9, [r0], -ip
    990c:	00009904 	andeq	r9, r0, r4, lsl #18
    9910:	00009904 	andeq	r9, r0, r4, lsl #18
    9914:	0000990c 	andeq	r9, r0, ip, lsl #18
    9918:	0000990c 	andeq	r9, r0, ip, lsl #18
    991c:	00009914 	andeq	r9, r0, r4, lsl r9
    9920:	00009914 	andeq	r9, r0, r4, lsl r9
    9924:	0000991c 	andeq	r9, r0, ip, lsl r9
    9928:	0000991c 	andeq	r9, r0, ip, lsl r9
    992c:	00009924 	andeq	r9, r0, r4, lsr #18
    9930:	00009924 	andeq	r9, r0, r4, lsr #18
    9934:	0000992c 	andeq	r9, r0, ip, lsr #18
    9938:	0000992c 	andeq	r9, r0, ip, lsr #18
    993c:	00009934 	andeq	r9, r0, r4, lsr r9
    9940:	00009934 	andeq	r9, r0, r4, lsr r9
    9944:	0000993c 	andeq	r9, r0, ip, lsr r9
    9948:	0000993c 	andeq	r9, r0, ip, lsr r9
    994c:	00009944 	andeq	r9, r0, r4, asr #18
    9950:	00009944 	andeq	r9, r0, r4, asr #18
    9954:	0000994c 	andeq	r9, r0, ip, asr #18
    9958:	0000994c 	andeq	r9, r0, ip, asr #18
    995c:	00009954 	andeq	r9, r0, r4, asr r9
    9960:	00009954 	andeq	r9, r0, r4, asr r9
    9964:	0000995c 	andeq	r9, r0, ip, asr r9
    9968:	0000995c 	andeq	r9, r0, ip, asr r9
    996c:	00009964 	andeq	r9, r0, r4, ror #18
    9970:	00009964 	andeq	r9, r0, r4, ror #18
    9974:	0000996c 	andeq	r9, r0, ip, ror #18
    9978:	0000996c 	andeq	r9, r0, ip, ror #18
    997c:	00009974 	andeq	r9, r0, r4, ror r9
    9980:	00009974 	andeq	r9, r0, r4, ror r9
    9984:	0000997c 	andeq	r9, r0, ip, ror r9
    9988:	0000997c 	andeq	r9, r0, ip, ror r9
    998c:	00009984 	andeq	r9, r0, r4, lsl #19
    9990:	00009984 	andeq	r9, r0, r4, lsl #19
    9994:	0000998c 	andeq	r9, r0, ip, lsl #19
    9998:	0000998c 	andeq	r9, r0, ip, lsl #19
    999c:	00009994 	muleq	r0, r4, r9
    99a0:	00009994 	muleq	r0, r4, r9
    99a4:	0000999c 	muleq	r0, ip, r9
    99a8:	0000999c 	muleq	r0, ip, r9
    99ac:	000099a4 	andeq	r9, r0, r4, lsr #19
    99b0:	000099a4 	andeq	r9, r0, r4, lsr #19
    99b4:	000099ac 	andeq	r9, r0, ip, lsr #19
    99b8:	000099ac 	andeq	r9, r0, ip, lsr #19
    99bc:	000099b4 			; <UNDEFINED> instruction: 0x000099b4
    99c0:	000099b4 			; <UNDEFINED> instruction: 0x000099b4
    99c4:	000099bc 			; <UNDEFINED> instruction: 0x000099bc
    99c8:	000099bc 			; <UNDEFINED> instruction: 0x000099bc
    99cc:	000099c4 	andeq	r9, r0, r4, asr #19
    99d0:	000099c4 	andeq	r9, r0, r4, asr #19
    99d4:	000099cc 	andeq	r9, r0, ip, asr #19
    99d8:	000099cc 	andeq	r9, r0, ip, asr #19
    99dc:	000099d4 	ldrdeq	r9, [r0], -r4
    99e0:	000099d4 	ldrdeq	r9, [r0], -r4
    99e4:	000099dc 	ldrdeq	r9, [r0], -ip
    99e8:	000099dc 	ldrdeq	r9, [r0], -ip
    99ec:	000099e4 	andeq	r9, r0, r4, ror #19
    99f0:	000099e4 	andeq	r9, r0, r4, ror #19
    99f4:	000099ec 	andeq	r9, r0, ip, ror #19
    99f8:	000099ec 	andeq	r9, r0, ip, ror #19
    99fc:	000099f4 	strdeq	r9, [r0], -r4
    9a00:	000099f4 	strdeq	r9, [r0], -r4
    9a04:	000099fc 	strdeq	r9, [r0], -ip
    9a08:	000099fc 	strdeq	r9, [r0], -ip
    9a0c:	00009a04 	andeq	r9, r0, r4, lsl #20
    9a10:	00009a04 	andeq	r9, r0, r4, lsl #20
    9a14:	00009a0c 	andeq	r9, r0, ip, lsl #20
    9a18:	00009a0c 	andeq	r9, r0, ip, lsl #20
    9a1c:	00009a14 	andeq	r9, r0, r4, lsl sl
    9a20:	00009a14 	andeq	r9, r0, r4, lsl sl
    9a24:	00009a1c 	andeq	r9, r0, ip, lsl sl
    9a28:	00009a1c 	andeq	r9, r0, ip, lsl sl
    9a2c:	00009a24 	andeq	r9, r0, r4, lsr #20
    9a30:	00009a24 	andeq	r9, r0, r4, lsr #20
    9a34:	00009a2c 	andeq	r9, r0, ip, lsr #20
    9a38:	00009a2c 	andeq	r9, r0, ip, lsr #20
    9a3c:	00009a34 	andeq	r9, r0, r4, lsr sl
    9a40:	00009a34 	andeq	r9, r0, r4, lsr sl

00009a44 <__malloc_trim_threshold>:
    9a44:	00020000 	andeq	r0, r2, r0

00009a48 <__malloc_sbrk_base>:
    9a48:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff

Disassembly of section .bss:

00009a4c <__env>:
    9a4c:	00000000 	andeq	r0, r0, r0

00009a50 <heap_end.4281>:
    9a50:	00000000 	andeq	r0, r0, r0

00009a54 <__malloc_max_total_mem>:
    9a54:	00000000 	andeq	r0, r0, r0

00009a58 <__malloc_max_sbrked_mem>:
    9a58:	00000000 	andeq	r0, r0, r0

00009a5c <__malloc_top_pad>:
    9a5c:	00000000 	andeq	r0, r0, r0

00009a60 <__malloc_current_mallinfo>:
	...

00009a88 <errno>:
    9a88:	00000000 	andeq	r0, r0, r0

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <_stack+0x1050d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	204d5241 	subcs	r5, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xd45
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0x464
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2973726f 	ldmdbcs	r3!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}^
  2c:	372e3420 	strcc	r3, [lr, -r0, lsr #8]!
  30:	3220342e 	eorcc	r3, r0, #771751936	; 0x2e000000
  34:	30343130 	eorscc	r3, r4, r0, lsr r1
  38:	20313034 	eorscs	r3, r1, r4, lsr r0
  3c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  40:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  44:	415b2029 	cmpmi	fp, r9, lsr #32
  48:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff2fe <_stack+0xfff7f2fe>
  4c:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  50:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  54:	2d375f34 	ldccs	15, cr5, [r7, #-208]!	; 0xffffff30
  58:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  5c:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  60:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  64:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  68:	31393032 	teqcc	r9, r2, lsr r0
  6c:	005d3539 	subseq	r3, sp, r9, lsr r5

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008070 	andeq	r8, r0, r0, ror r0
  14:	00000070 	andeq	r0, r0, r0, ror r0
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	00b20002 	adcseq	r0, r2, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000080e0 	andeq	r8, r0, r0, ror #1
  34:	000003c0 	andeq	r0, r0, r0, asr #7
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	07b00002 	ldreq	r0, [r0, r2]!
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	000084a0 	andeq	r8, r0, r0, lsr #9
  54:	00000024 	andeq	r0, r0, r4, lsr #32
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	0b040002 	bleq	100074 <_stack+0x80074>
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	000084c4 	andeq	r8, r0, r4, asr #9
  74:	000000b4 	strheq	r0, [r0], -r4
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	0bed0002 	bleq	ffb40094 <_stack+0xffac0094>
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008000 	andeq	r8, r0, r0
  94:	00000070 	andeq	r0, r0, r0, ror r0
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	000000ae 	andeq	r0, r0, lr, lsr #1
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	0000006a 	andeq	r0, r0, sl, rrx
  10:	00005f01 	andeq	r5, r0, r1, lsl #30
  14:	00002000 	andeq	r2, r0, r0
  18:	00807000 	addeq	r7, r0, r0
  1c:	0080e000 	addeq	lr, r0, r0
  20:	00000000 	andeq	r0, r0, r0
  24:	00010200 	andeq	r0, r1, r0, lsl #4
  28:	01000000 	mrseq	r0, (UNDEF: 0)
  2c:	80700110 	rsbshi	r0, r0, r0, lsl r1
  30:	80e00000 	rschi	r0, r0, r0
  34:	00000000 	andeq	r0, r0, r0
  38:	83010000 	movwhi	r0, #4096	; 0x1000
  3c:	03000000 	movweq	r0, #0
  40:	01003072 	tsteq	r0, r2, ror r0
  44:	00008310 	andeq	r8, r0, r0, lsl r3
  48:	6c910200 	lfmvs	f0, 4, [r1], {0}
  4c:	00317203 	eorseq	r7, r1, r3, lsl #4
  50:	00831001 	addeq	r1, r3, r1
  54:	91020000 	mrsls	r0, (UNDEF: 2)
  58:	32720368 	rsbscc	r0, r2, #-1610612735	; 0xa0000001
  5c:	83100100 	tsthi	r0, #0
  60:	02000000 	andeq	r0, r0, #0
  64:	62046491 	andvs	r6, r4, #-1862270976	; 0x91000000
  68:	01007373 	tsteq	r0, r3, ror r3
  6c:	00008a12 	andeq	r8, r0, r2, lsl sl
  70:	74910200 	ldrvc	r0, [r1], #512	; 0x200
  74:	00000a05 	andeq	r0, r0, r5, lsl #20
  78:	8a130100 	bhi	4c0480 <_stack+0x440480>
  7c:	02000000 	andeq	r0, r0, #0
  80:	06007091 			; <UNDEFINED> instruction: 0x06007091
  84:	00cb0704 	sbceq	r0, fp, r4, lsl #14
  88:	04070000 	streq	r0, [r7], #-0
  8c:	00000090 	muleq	r0, r0, r0
  90:	69050408 	stmdbvs	r5, {r3, sl}
  94:	0900746e 	stmdbeq	r0, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
  98:	00000012 	andeq	r0, r0, r2, lsl r0
  9c:	00900b01 	addseq	r0, r0, r1, lsl #22
  a0:	01010000 	mrseq	r0, (UNDEF: 1)
  a4:	00005309 	andeq	r5, r0, r9, lsl #6
  a8:	900c0100 	andls	r0, ip, r0, lsl #2
  ac:	01000000 	mrseq	r0, (UNDEF: 0)
  b0:	06fa0001 	ldrbteq	r0, [sl], r1
  b4:	00020000 	andeq	r0, r2, r0
  b8:	0000008b 	andeq	r0, r0, fp, lsl #1
  bc:	006a0104 	rsbeq	r0, sl, r4, lsl #2
  c0:	5a010000 	bpl	400c8 <__bss_end__+0x3663c>
  c4:	20000001 	andcs	r0, r0, r1
  c8:	e0000000 	and	r0, r0, r0
  cc:	a0000080 	andge	r0, r0, r0, lsl #1
  d0:	49000084 	stmdbmi	r0, {r2, r7}
  d4:	02000000 	andeq	r0, r0, #0
  d8:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
  dc:	01030074 	tsteq	r3, r4, ror r0
  e0:	00022f06 	andeq	r2, r2, r6, lsl #30
  e4:	08010300 	stmdaeq	r1, {r8, r9}
  e8:	0000022d 	andeq	r0, r0, sp, lsr #4
  ec:	3b050203 	blcc	140900 <_stack+0xc0900>
  f0:	03000002 	movweq	r0, #2
  f4:	01ae0702 			; <UNDEFINED> instruction: 0x01ae0702
  f8:	04030000 	streq	r0, [r3], #-0
  fc:	0000cb07 	andeq	ip, r0, r7, lsl #22
 100:	05080300 	streq	r0, [r8, #-768]	; 0x300
 104:	00000106 	andeq	r0, r0, r6, lsl #2
 108:	c1070803 	tstgt	r7, r3, lsl #16
 10c:	04000000 	streq	r0, [r0], #-0
 110:	00000210 	andeq	r0, r0, r0, lsl r2
 114:	00681002 	rsbeq	r1, r8, r2
 118:	04030000 	streq	r0, [r3], #-0
 11c:	00010b05 	andeq	r0, r1, r5, lsl #22
 120:	01630400 	cmneq	r3, r0, lsl #8
 124:	18020000 	stmdane	r2, {}	; <UNPREDICTABLE>
 128:	0000003a 	andeq	r0, r0, sl, lsr r0
 12c:	00027f04 	andeq	r7, r2, r4, lsl #30
 130:	411d0200 	tstmi	sp, r0, lsl #4
 134:	04000000 	streq	r0, [r0], #-0
 138:	000000b3 	strheq	r0, [r0], -r3
 13c:	00412002 	subeq	r2, r1, r2
 140:	04030000 	streq	r0, [r3], #-0
 144:	0001f607 	andeq	pc, r1, r7, lsl #12
 148:	07040300 	streq	r0, [r4, -r0, lsl #6]
 14c:	000000c6 	andeq	r0, r0, r6, asr #1
 150:	00a40405 	adceq	r0, r4, r5, lsl #8
 154:	01030000 	mrseq	r0, (UNDEF: 3)
 158:	00023608 	andeq	r3, r2, r8, lsl #12
 15c:	b1040500 	tstlt	r4, r0, lsl #10
 160:	06000000 	streq	r0, [r0], -r0
 164:	000000a4 	andeq	r0, r0, r4, lsr #1
 168:	00015204 	andeq	r5, r1, r4, lsl #4
 16c:	97680300 	strbls	r0, [r8, -r0, lsl #6]!
 170:	04000000 	streq	r0, [r0], #-0
 174:	00000217 	andeq	r0, r0, r7, lsl r2
 178:	00686d03 	rsbeq	r6, r8, r3, lsl #26
 17c:	68040000 	stmdavs	r4, {}	; <UNPREDICTABLE>
 180:	03000002 	movweq	r0, #2
 184:	00009e7e 	andeq	r9, r0, lr, ror lr
 188:	02ce0400 	sbceq	r0, lr, #0
 18c:	85030000 	strhi	r0, [r3, #-0]
 190:	00000041 	andeq	r0, r0, r1, asr #32
 194:	00021104 	andeq	r1, r2, r4, lsl #2
 198:	5da20300 	stcpl	3, cr0, [r2]
 19c:	04000000 	streq	r0, [r0], #-0
 1a0:	00000165 	andeq	r0, r0, r5, ror #2
 1a4:	006fa303 	rsbeq	sl, pc, r3, lsl #6
 1a8:	81040000 	mrshi	r0, (UNDEF: 4)
 1ac:	03000002 	movweq	r0, #2
 1b0:	00007aa4 	andeq	r7, r0, r4, lsr #21
 1b4:	00b50400 	adcseq	r0, r5, r0, lsl #8
 1b8:	a5030000 	strge	r0, [r3, #-0]
 1bc:	00000085 	andeq	r0, r0, r5, lsl #1
 1c0:	0002a004 	andeq	sl, r2, r4
 1c4:	48c30300 	stmiami	r3, {r8, r9}^
 1c8:	04000000 	streq	r0, [r0], #-0
 1cc:	00000145 	andeq	r0, r0, r5, asr #2
 1d0:	0041c803 	subeq	ip, r1, r3, lsl #16
 1d4:	0b070000 	bleq	1c01dc <_stack+0x1401dc>
 1d8:	3c000002 	stccc	0, cr0, [r0], {2}
 1dc:	021f1904 	andseq	r1, pc, #65536	; 0x10000
 1e0:	a7080000 	strge	r0, [r8, -r0]
 1e4:	04000002 	streq	r0, [r0], #-2
 1e8:	0000ed1b 	andeq	lr, r0, fp, lsl sp
 1ec:	00230200 	eoreq	r0, r3, r0, lsl #4
 1f0:	00011408 	andeq	r1, r1, r8, lsl #8
 1f4:	d71c0400 	ldrle	r0, [ip, -r0, lsl #8]
 1f8:	02000000 	andeq	r0, r0, #0
 1fc:	e7080223 	str	r0, [r8, -r3, lsr #4]
 200:	04000001 	streq	r0, [r0], #-1
 204:	00010e1d 	andeq	r0, r1, sp, lsl lr
 208:	04230200 	strteq	r0, [r3], #-512	; 0x200
 20c:	00022408 	andeq	r2, r2, r8, lsl #8
 210:	191e0400 	ldmdbne	lr, {sl}
 214:	02000001 	andeq	r0, r0, #1
 218:	6b080823 	blvs	2022ac <_stack+0x1822ac>
 21c:	04000001 	streq	r0, [r0], #-1
 220:	0000f81f 	andeq	pc, r0, pc, lsl r8	; <UNPREDICTABLE>
 224:	0a230200 	beq	8c0a2c <_stack+0x840a2c>
 228:	00028708 	andeq	r8, r2, r8, lsl #14
 22c:	03200400 	teqeq	r0, #0
 230:	02000001 	andeq	r0, r0, #1
 234:	70080c23 	andvc	r0, r8, r3, lsr #24
 238:	04000002 	streq	r0, [r0], #-2
 23c:	0000ed21 	andeq	lr, r0, r1, lsr #26
 240:	0e230200 	cdpeq	2, 2, cr0, cr3, cr0, {0}
 244:	0001d808 	andeq	sp, r1, r8, lsl #16
 248:	e2220400 	eor	r0, r2, #0
 24c:	02000000 	andeq	r0, r0, #0
 250:	c9081023 	stmdbgt	r8, {r0, r1, r5, ip}
 254:	04000001 	streq	r0, [r0], #-1
 258:	0000c130 	andeq	ip, r0, r0, lsr r1
 25c:	14230200 	strtne	r0, [r3], #-512	; 0x200
 260:	00017208 	andeq	r7, r1, r8, lsl #4
 264:	68310400 	ldmdavs	r1!, {sl}
 268:	02000000 	andeq	r0, r0, #0
 26c:	bf081823 	svclt	0x00081823
 270:	04000002 	streq	r0, [r0], #-2
 274:	0000c132 	andeq	ip, r0, r2, lsr r1
 278:	1c230200 	sfmne	f0, 4, [r3], #-0
 27c:	00017c08 	andeq	r7, r1, r8, lsl #24
 280:	68330400 	ldmdavs	r3!, {sl}
 284:	02000000 	andeq	r0, r0, #0
 288:	5f082023 	svcpl	0x00082023
 28c:	04000002 	streq	r0, [r0], #-2
 290:	0000c134 	andeq	ip, r0, r4, lsr r1
 294:	24230200 	strtcs	r0, [r3], #-512	; 0x200
 298:	00018608 	andeq	r8, r1, r8, lsl #12
 29c:	68350400 	ldmdavs	r5!, {sl}
 2a0:	02000000 	andeq	r0, r0, #0
 2a4:	4a082823 	bmi	20a338 <_stack+0x18a338>
 2a8:	04000002 	streq	r0, [r0], #-2
 2ac:	00006836 	andeq	r6, r0, r6, lsr r8
 2b0:	2c230200 	sfmcs	f0, 4, [r3], #-0
 2b4:	0000d808 	andeq	sp, r0, r8, lsl #16
 2b8:	68370400 	ldmdavs	r7!, {sl}
 2bc:	02000000 	andeq	r0, r0, #0
 2c0:	90083023 	andls	r3, r8, r3, lsr #32
 2c4:	04000001 	streq	r0, [r0], #-1
 2c8:	00021f38 	andeq	r1, r2, r8, lsr pc
 2cc:	34230200 	strtcc	r0, [r3], #-512	; 0x200
 2d0:	00680900 	rsbeq	r0, r8, r0, lsl #18
 2d4:	022f0000 	eoreq	r0, pc, #0
 2d8:	900a0000 	andls	r0, sl, r0
 2dc:	01000000 	mrseq	r0, (UNDEF: 0)
 2e0:	6d740b00 	vldmdbvs	r4!, {d16-d15}
 2e4:	05100073 	ldreq	r0, [r0, #-115]	; 0x73
 2e8:	00027410 	andeq	r7, r2, r0, lsl r4
 2ec:	02550800 	subseq	r0, r5, #0
 2f0:	11050000 	mrsne	r0, (UNDEF: 5)
 2f4:	000000b6 	strheq	r0, [r0], -r6
 2f8:	08002302 	stmdaeq	r0, {r1, r8, r9, sp}
 2fc:	00000120 	andeq	r0, r0, r0, lsr #2
 300:	00b61205 	adcseq	r1, r6, r5, lsl #4
 304:	23020000 	movwcs	r0, #8192	; 0x2000
 308:	00e20804 	rsceq	r0, r2, r4, lsl #16
 30c:	13050000 	movwne	r0, #20480	; 0x5000
 310:	000000b6 	strheq	r0, [r0], -r6
 314:	08082302 	stmdaeq	r8, {r1, r8, r9, sp}
 318:	0000028e 	andeq	r0, r0, lr, lsl #5
 31c:	00b61405 	adcseq	r1, r6, r5, lsl #8
 320:	23020000 	movwcs	r0, #8192	; 0x2000
 324:	010c000c 	tsteq	ip, ip
 328:	000000f2 	strdeq	r0, [r0], -r2
 32c:	e0014f01 	and	r4, r1, r1, lsl #30
 330:	f4000080 	vst4.32	{d0-d3}, [r0], r0
 334:	2c000080 	stccs	0, cr0, [r0], {128}	; 0x80
 338:	01000000 	mrseq	r0, (UNDEF: 0)
 33c:	0000029d 	muleq	r0, sp, r2
 340:	0002990d 	andeq	r9, r2, sp, lsl #18
 344:	254f0100 	strbcs	r0, [pc, #-256]	; 24c <CPSR_IRQ_INHIBIT+0x1cc>
 348:	02000000 	andeq	r0, r0, #0
 34c:	0e007491 	mcreq	4, 0, r7, cr0, cr1, {4}
 350:	0001a201 	andeq	sl, r1, r1, lsl #4
 354:	015d0100 	cmpeq	sp, r0, lsl #2
 358:	00000025 	andeq	r0, r0, r5, lsr #32
 35c:	000080f4 	strdeq	r8, [r0], -r4
 360:	00008118 	andeq	r8, r0, r8, lsl r1
 364:	00000058 	andeq	r0, r0, r8, asr r0
 368:	0002ca01 	andeq	ip, r2, r1, lsl #20
 36c:	02450d00 	subeq	r0, r5, #0
 370:	5d010000 	stcpl	0, cr0, [r1, #-0]
 374:	00000025 	andeq	r0, r0, r5, lsr #32
 378:	00749102 	rsbseq	r9, r4, r2, lsl #2
 37c:	0131010e 	teqeq	r1, lr, lsl #2
 380:	65010000 	strvs	r0, [r1, #-0]
 384:	00002501 	andeq	r2, r0, r1, lsl #10
 388:	00811800 	addeq	r1, r1, r0, lsl #16
 38c:	00815400 	addeq	r5, r1, r0, lsl #8
 390:	00008400 	andeq	r8, r0, r0, lsl #8
 394:	03130100 	tsteq	r3, #0
 398:	a90d0000 	stmdbge	sp, {}	; <UNPREDICTABLE>
 39c:	01000001 	tsteq	r0, r1
 3a0:	00009e65 	andeq	r9, r0, r5, ror #28
 3a4:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 3a8:	0002ba0d 	andeq	fp, r2, sp, lsl #20
 3ac:	13650100 	cmnne	r5, #0
 3b0:	02000003 	andeq	r0, r0, #3
 3b4:	650f7091 	strvs	r7, [pc, #-145]	; 32b <CPSR_IRQ_INHIBIT+0x2ab>
 3b8:	0100766e 	tsteq	r0, lr, ror #12
 3bc:	00031365 	andeq	r1, r3, r5, ror #6
 3c0:	6c910200 	lfmvs	f0, 4, [r1], {0}
 3c4:	9e040500 	cfsh32ls	mvfx0, mvfx4, #0
 3c8:	10000000 	andne	r0, r0, r0
 3cc:	00014001 	andeq	r4, r1, r1
 3d0:	016e0100 	cmneq	lr, r0, lsl #2
 3d4:	00000025 	andeq	r0, r0, r5, lsr #32
 3d8:	00008154 	andeq	r8, r0, r4, asr r1
 3dc:	00008180 	andeq	r8, r0, r0, lsl #3
 3e0:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 3e4:	09010e01 	stmdbeq	r1, {r0, r9, sl, fp}
 3e8:	01000002 	tsteq	r0, r2
 3ec:	00250179 	eoreq	r0, r5, r9, ror r1
 3f0:	81800000 	orrhi	r0, r0, r0
 3f4:	81b40000 			; <UNDEFINED> instruction: 0x81b40000
 3f8:	00dc0000 	sbcseq	r0, ip, r0
 3fc:	6d010000 	stcvs	0, cr0, [r1, #-0]
 400:	0d000003 	stceq	0, cr0, [r0, #-12]
 404:	00000245 	andeq	r0, r0, r5, asr #4
 408:	00257901 	eoreq	r7, r5, r1, lsl #18
 40c:	91020000 	mrsls	r0, (UNDEF: 2)
 410:	74730f74 	ldrbtvc	r0, [r3], #-3956	; 0xf74
 414:	6d790100 	ldfvse	f0, [r9, #-0]
 418:	02000003 	andeq	r0, r0, #3
 41c:	05007091 	streq	r7, [r0, #-145]	; 0x91
 420:	00012404 	andeq	r2, r1, r4, lsl #8
 424:	78011000 	stmdavc	r1, {ip}
 428:	01000002 	tsteq	r0, r2
 42c:	00250183 	eoreq	r0, r5, r3, lsl #3
 430:	81b40000 			; <UNDEFINED> instruction: 0x81b40000
 434:	81d00000 	bicshi	r0, r0, r0
 438:	01080000 	mrseq	r0, (UNDEF: 8)
 43c:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
 440:	0001c101 	andeq	ip, r1, r1, lsl #2
 444:	018c0100 	orreq	r0, ip, r0, lsl #2
 448:	00000025 	andeq	r0, r0, r5, lsr #32
 44c:	000081d0 	ldrdeq	r8, [r0], -r0
 450:	000081f4 	strdeq	r8, [r0], -r4
 454:	00000134 	andeq	r0, r0, r4, lsr r1
 458:	0003ba01 	andeq	fp, r3, r1, lsl #20
 45c:	02450d00 	subeq	r0, r5, #0
 460:	8c010000 	stchi	0, cr0, [r1], {-0}
 464:	00000025 	andeq	r0, r0, r5, lsr #32
 468:	00749102 	rsbseq	r9, r4, r2, lsl #2
 46c:	00ed010e 	rsceq	r0, sp, lr, lsl #2
 470:	93010000 	movwls	r0, #4096	; 0x1000
 474:	00002501 	andeq	r2, r0, r1, lsl #10
 478:	0081f400 	addeq	pc, r1, r0, lsl #8
 47c:	00822c00 	addeq	r2, r2, r0, lsl #24
 480:	00016000 	andeq	r6, r1, r0
 484:	03f50100 	mvnseq	r0, #0
 488:	700f0000 	andvc	r0, pc, r0
 48c:	01006469 	tsteq	r0, r9, ror #8
 490:	00002593 	muleq	r0, r3, r5
 494:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 498:	6769730f 	strbvs	r7, [r9, -pc, lsl #6]!
 49c:	25930100 	ldrcs	r0, [r3, #256]	; 0x100
 4a0:	02000000 	andeq	r0, r0, #0
 4a4:	0e007091 	mcreq	0, 0, r7, cr0, cr1, {4}
 4a8:	00022801 	andeq	r2, r2, r1, lsl #16
 4ac:	019b0100 	orrseq	r0, fp, r0, lsl #2
 4b0:	00000025 	andeq	r0, r0, r5, lsr #32
 4b4:	0000822c 	andeq	r8, r0, ip, lsr #4
 4b8:	00008264 	andeq	r8, r0, r4, ror #4
 4bc:	0000018c 	andeq	r0, r0, ip, lsl #3
 4c0:	00043001 	andeq	r3, r4, r1
 4c4:	6c6f0f00 	stclvs	15, cr0, [pc], #-0	; 4cc <CPSR_IRQ_INHIBIT+0x44c>
 4c8:	9b010064 	blls	40660 <__bss_end__+0x36bd4>
 4cc:	0000009e 	muleq	r0, lr, r0
 4d0:	0f749102 	svceq	0x00749102
 4d4:	0077656e 	rsbseq	r6, r7, lr, ror #10
 4d8:	009e9b01 	addseq	r9, lr, r1, lsl #22
 4dc:	91020000 	mrsls	r0, (UNDEF: 2)
 4e0:	010e0070 	tsteq	lr, r0, ror r0
 4e4:	0000012a 	andeq	r0, r0, sl, lsr #2
 4e8:	2501a301 	strcs	sl, [r1, #-769]	; 0x301
 4ec:	64000000 	strvs	r0, [r0], #-0
 4f0:	90000082 	andls	r0, r0, r2, lsl #1
 4f4:	b8000082 	stmdalt	r0, {r1, r7}
 4f8:	01000001 	tsteq	r0, r1
 4fc:	00000479 	andeq	r0, r0, r9, ror r4
 500:	0002450d 	andeq	r4, r2, sp, lsl #10
 504:	25a30100 	strcs	r0, [r3, #256]!	; 0x100
 508:	02000000 	andeq	r0, r0, #0
 50c:	700f7491 	mulvc	pc, r1, r4	; <UNPREDICTABLE>
 510:	01007274 	tsteq	r0, r4, ror r2
 514:	000025a3 	andeq	r2, r0, r3, lsr #11
 518:	70910200 	addsvc	r0, r1, r0, lsl #4
 51c:	7269640f 	rsbvc	r6, r9, #251658240	; 0xf000000
 520:	25a30100 	strcs	r0, [r3, #256]!	; 0x100
 524:	02000000 	andeq	r0, r0, #0
 528:	0e006c91 	mcreq	12, 0, r6, cr0, cr1, {4}
 52c:	0001ff01 	andeq	pc, r1, r1, lsl #30
 530:	01aa0100 			; <UNDEFINED> instruction: 0x01aa0100
 534:	00000025 	andeq	r0, r0, r5, lsr #32
 538:	00008290 	muleq	r0, r0, r2
 53c:	000082bc 			; <UNDEFINED> instruction: 0x000082bc
 540:	000001e4 	andeq	r0, r0, r4, ror #3
 544:	0004c201 	andeq	ip, r4, r1, lsl #4
 548:	01a90d00 			; <UNDEFINED> instruction: 0x01a90d00
 54c:	aa010000 	bge	40554 <__bss_end__+0x36ac8>
 550:	000000ab 	andeq	r0, r0, fp, lsr #1
 554:	0d749102 	ldfeqp	f1, [r4, #-8]!
 558:	000002ae 	andeq	r0, r0, lr, lsr #5
 55c:	0025aa01 	eoreq	sl, r5, r1, lsl #20
 560:	91020000 	mrsls	r0, (UNDEF: 2)
 564:	01ea0d70 	mvneq	r0, r0, ror sp
 568:	aa010000 	bge	40570 <__bss_end__+0x36ae4>
 56c:	00000025 	andeq	r0, r0, r5, lsr #32
 570:	006c9102 	rsbeq	r9, ip, r2, lsl #2
 574:	021e010e 	andseq	r0, lr, #-2147483645	; 0x80000003
 578:	b1010000 	mrslt	r0, (UNDEF: 1)
 57c:	00002501 	andeq	r2, r0, r1, lsl #10
 580:	0082bc00 	addeq	fp, r2, r0, lsl #24
 584:	0082e800 	addeq	lr, r2, r0, lsl #16
 588:	00021000 	andeq	r1, r2, r0
 58c:	050b0100 	streq	r0, [fp, #-256]	; 0x100
 590:	450d0000 	strmi	r0, [sp, #-0]
 594:	01000002 	tsteq	r0, r2
 598:	000025b1 			; <UNDEFINED> instruction: 0x000025b1
 59c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 5a0:	7274700f 	rsbsvc	r7, r4, #15
 5a4:	9eb10100 	frdlss	f0, f1, f0
 5a8:	02000000 	andeq	r0, r0, #0
 5ac:	6c0f7091 	stcvs	0, cr7, [pc], {145}	; 0x91
 5b0:	01006e65 	tsteq	r0, r5, ror #28
 5b4:	000025b1 			; <UNDEFINED> instruction: 0x000025b1
 5b8:	6c910200 	lfmvs	f0, 4, [r1], {0}
 5bc:	c8010e00 	stmdagt	r1, {r9, sl, fp}
 5c0:	01000002 	tsteq	r0, r2
 5c4:	00cc01bb 	strheq	r0, [ip], #27
 5c8:	82e80000 	rschi	r0, r8, #0
 5cc:	83540000 	cmphi	r4, #0
 5d0:	023c0000 	eorseq	r0, ip, #0
 5d4:	64010000 	strvs	r0, [r1], #-0
 5d8:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
 5dc:	0000014d 	andeq	r0, r0, sp, asr #2
 5e0:	0025bb01 	eoreq	fp, r5, r1, lsl #22
 5e4:	91020000 	mrsls	r0, (UNDEF: 2)
 5e8:	0101116c 	tsteq	r1, ip, ror #2
 5ec:	bd010000 	stclt	0, cr0, [r1, #-0]
 5f0:	000000a4 	andeq	r0, r0, r4, lsr #1
 5f4:	fd120101 	ldc2	1, cr0, [r2, #-4]
 5f8:	01000000 	mrseq	r0, (UNDEF: 0)
 5fc:	00009ebe 			; <UNDEFINED> instruction: 0x00009ebe
 600:	50030500 	andpl	r0, r3, r0, lsl #10
 604:	1200009a 	andne	r0, r0, #154	; 0x9a
 608:	000000f8 	strdeq	r0, [r0], -r8
 60c:	009ebf01 	addseq	fp, lr, r1, lsl #30
 610:	91020000 	mrsls	r0, (UNDEF: 2)
 614:	010e0074 	tsteq	lr, r4, ror r0
 618:	0000020b 	andeq	r0, r0, fp, lsl #4
 61c:	25019604 	strcs	r9, [r1, #-1540]	; 0x604
 620:	54000000 	strpl	r0, [r0], #-0
 624:	88000083 	stmdahi	r0, {r0, r1, r7}
 628:	68000083 	stmdavs	r0, {r0, r1, r7}
 62c:	01000002 	tsteq	r0, r2
 630:	0000059e 	muleq	r0, lr, r5
 634:	0002450d 	andeq	r4, r2, sp, lsl #10
 638:	abcc0100 	blge	ff300a40 <_stack+0xff280a40>
 63c:	02000000 	andeq	r0, r0, #0
 640:	730f7491 	movwvc	r7, #62609	; 0xf491
 644:	cc010074 	stcgt	0, cr0, [r1], {116}	; 0x74
 648:	0000036d 	andeq	r0, r0, sp, ror #6
 64c:	00709102 	rsbseq	r9, r0, r2, lsl #2
 650:	02b4010e 	adcseq	r0, r4, #-2147483645	; 0x80000003
 654:	17050000 	strne	r0, [r5, -r0]
 658:	0000b601 	andeq	fp, r0, r1, lsl #12
 65c:	00838800 	addeq	r8, r3, r0, lsl #16
 660:	0083ac00 	addeq	sl, r3, r0, lsl #24
 664:	00029400 	andeq	r9, r2, r0, lsl #8
 668:	05cb0100 	strbeq	r0, [fp, #256]	; 0x100
 66c:	620f0000 	andvs	r0, pc, #0
 670:	01006675 	tsteq	r0, r5, ror r6
 674:	0005cbd4 	ldrdeq	ip, [r5], -r4
 678:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 67c:	2f040500 	svccs	0x00040500
 680:	0e000002 	cdpeq	0, 0, cr0, cr0, cr2, {0}
 684:	0001ef01 	andeq	lr, r1, r1, lsl #30
 688:	01db0100 	bicseq	r0, fp, r0, lsl #2
 68c:	00000025 	andeq	r0, r0, r5, lsr #32
 690:	000083ac 	andeq	r8, r0, ip, lsr #7
 694:	000083e0 	andeq	r8, r0, r0, ror #7
 698:	000002c0 	andeq	r0, r0, r0, asr #5
 69c:	0005fe01 	andeq	pc, r5, r1, lsl #28
 6a0:	01a90d00 			; <UNDEFINED> instruction: 0x01a90d00
 6a4:	db010000 	blle	406ac <__bss_end__+0x36c20>
 6a8:	0000009e 	muleq	r0, lr, r0
 6ac:	00749102 	rsbseq	r9, r4, r2, lsl #2
 6b0:	011b010e 	tsteq	fp, lr, lsl #2
 6b4:	e3010000 	movw	r0, #4096	; 0x1000
 6b8:	00002501 	andeq	r2, r0, r1, lsl #10
 6bc:	0083e000 	addeq	lr, r3, r0
 6c0:	00841400 	addeq	r1, r4, r0, lsl #8
 6c4:	0002ec00 	andeq	lr, r2, r0, lsl #24
 6c8:	062b0100 	strteq	r0, [fp], -r0, lsl #2
 6cc:	990d0000 	stmdbls	sp, {}	; <UNPREDICTABLE>
 6d0:	01000002 	tsteq	r0, r2
 6d4:	00062be3 	andeq	r2, r6, r3, ror #23
 6d8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 6dc:	25040500 	strcs	r0, [r4, #-1280]	; 0x500
 6e0:	0c000000 	stceq	0, cr0, [r0], {-0}
 6e4:	00013801 	andeq	r3, r1, r1, lsl #16
 6e8:	01ea0100 	mvneq	r0, r0, lsl #2
 6ec:	00008414 	andeq	r8, r0, r4, lsl r4
 6f0:	00008434 	andeq	r8, r0, r4, lsr r4
 6f4:	00000318 	andeq	r0, r0, r8, lsl r3
 6f8:	00065801 	andeq	r5, r6, r1, lsl #16
 6fc:	00620f00 	rsbeq	r0, r2, r0, lsl #30
 700:	00a4ea01 	adceq	lr, r4, r1, lsl #20
 704:	91020000 	mrsls	r0, (UNDEF: 2)
 708:	01130077 	tsteq	r3, r7, ror r0
 70c:	000001e0 	andeq	r0, r0, r0, ror #3
 710:	2501f701 	strcs	pc, [r1, #-1793]	; 0x701
 714:	34000000 	strcc	r0, [r0], #-0
 718:	a0000084 	andge	r0, r0, r4, lsl #1
 71c:	44000084 	strmi	r0, [r0], #-132	; 0x84
 720:	01000003 	tsteq	r0, r3
 724:	000006af 	andeq	r0, r0, pc, lsr #13
 728:	0002450d 	andeq	r4, r2, sp, lsl #10
 72c:	25f70100 	ldrbcs	r0, [r7, #256]!	; 0x100
 730:	02000000 	andeq	r0, r0, #0
 734:	700f6c91 	mulvc	pc, r1, ip	; <UNPREDICTABLE>
 738:	01007274 	tsteq	r0, r4, ror r2
 73c:	00009ef7 	strdeq	r9, [r0], -r7
 740:	68910200 	ldmvs	r1, {r9}
 744:	6e656c0f 	cdpvs	12, 6, cr6, cr5, cr15, {0}
 748:	25f70100 	ldrbcs	r0, [r7, #256]!	; 0x100
 74c:	02000000 	andeq	r0, r0, #0
 750:	04126491 	ldreq	r6, [r2], #-1169	; 0x491
 754:	01000002 	tsteq	r0, r2
 758:	000025f9 	strdeq	r2, [r0], -r9
 75c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 760:	01d21100 	bicseq	r1, r2, r0, lsl #2
 764:	39010000 	stmdbcc	r1, {}	; <UNPREDICTABLE>
 768:	00000025 	andeq	r0, r0, r5, lsr #32
 76c:	9e090101 	adflse	f0, f1, f1
 770:	cc000000 	stcgt	0, cr0, [r0], {-0}
 774:	0a000006 	beq	794 <CPSR_IRQ_INHIBIT+0x714>
 778:	00000090 	muleq	r0, r0, r0
 77c:	bb140000 	bllt	500784 <_stack+0x480784>
 780:	01000000 	mrseq	r0, (UNDEF: 0)
 784:	0006bc46 	andeq	fp, r6, r6, asr #24
 788:	03050100 	movweq	r0, #20736	; 0x5100
 78c:	00009a4c 	andeq	r9, r0, ip, asr #20
 790:	00019a14 	andeq	r9, r1, r4, lsl sl
 794:	13470100 	movtne	r0, #28928	; 0x7100
 798:	01000003 	tsteq	r0, r3
 79c:	92080305 	andls	r0, r8, #335544320	; 0x14000000
 7a0:	01110000 	tsteq	r1, r0
 7a4:	01000001 	tsteq	r0, r1
 7a8:	0000a4bd 			; <UNDEFINED> instruction: 0x0000a4bd
 7ac:	00010100 	andeq	r0, r1, r0, lsl #2
 7b0:	00000350 	andeq	r0, r0, r0, asr r3
 7b4:	01cc0002 	biceq	r0, ip, r2
 7b8:	01040000 	mrseq	r0, (UNDEF: 4)
 7bc:	0000006a 	andeq	r0, r0, sl, rrx
 7c0:	00041b01 	andeq	r1, r4, r1, lsl #22
 7c4:	00002000 	andeq	r2, r0, r0
 7c8:	0084a000 	addeq	sl, r4, r0
 7cc:	0084c400 	addeq	ip, r4, r0, lsl #8
 7d0:	00018400 	andeq	r8, r1, r0, lsl #8
 7d4:	06010200 	streq	r0, [r1], -r0, lsl #4
 7d8:	0000022f 	andeq	r0, r0, pc, lsr #4
 7dc:	0003aa03 	andeq	sl, r3, r3, lsl #20
 7e0:	372a0200 	strcc	r0, [sl, -r0, lsl #4]!
 7e4:	02000000 	andeq	r0, r0, #0
 7e8:	022d0801 	eoreq	r0, sp, #65536	; 0x10000
 7ec:	02020000 	andeq	r0, r2, #0
 7f0:	00023b05 	andeq	r3, r2, r5, lsl #22
 7f4:	07020200 	streq	r0, [r2, -r0, lsl #4]
 7f8:	000001ae 	andeq	r0, r0, lr, lsr #3
 7fc:	0b050402 	bleq	14180c <_stack+0xc180c>
 800:	03000001 	movweq	r0, #1
 804:	0000034e 	andeq	r0, r0, lr, asr #6
 808:	005e5002 	subseq	r5, lr, r2
 80c:	04020000 	streq	r0, [r2], #-0
 810:	0000c607 	andeq	ip, r0, r7, lsl #12
 814:	05080200 	streq	r0, [r8, #-512]	; 0x200
 818:	00000106 	andeq	r0, r0, r6, lsl #2
 81c:	c1070802 	tstgt	r7, r2, lsl #16
 820:	04000000 	streq	r0, [r0], #-0
 824:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 828:	04020074 	streq	r0, [r2], #-116	; 0x74
 82c:	0000cb07 	andeq	ip, r0, r7, lsl #22
 830:	03b40500 			; <UNDEFINED> instruction: 0x03b40500
 834:	00030d3a 	andeq	r0, r3, sl, lsr sp
 838:	04350600 	ldrteq	r0, [r5], #-1536	; 0x600
 83c:	3b030000 	blcc	c0844 <_stack+0x40844>
 840:	0000030d 	andeq	r0, r0, sp, lsl #6
 844:	06002302 	streq	r2, [r0], -r2, lsl #6
 848:	0000043b 	andeq	r0, r0, fp, lsr r4
 84c:	030d3c03 	movweq	r3, #56323	; 0xdc03
 850:	23020000 	movwcs	r0, #8192	; 0x2000
 854:	04410604 	strbeq	r0, [r1], #-1540	; 0x604
 858:	3d030000 	stccc	0, cr0, [r3, #-0]
 85c:	0000030d 	andeq	r0, r0, sp, lsl #6
 860:	06082302 	streq	r2, [r8], -r2, lsl #6
 864:	000002d4 	ldrdeq	r0, [r0], -r4
 868:	030d3e03 	movweq	r3, #56835	; 0xde03
 86c:	23020000 	movwcs	r0, #8192	; 0x2000
 870:	02da060c 	sbcseq	r0, sl, #12582912	; 0xc00000
 874:	3f030000 	svccc	0x00030000
 878:	0000030d 	andeq	r0, r0, sp, lsl #6
 87c:	06102302 	ldreq	r2, [r0], -r2, lsl #6
 880:	000002e0 	andeq	r0, r0, r0, ror #5
 884:	030d4003 	movweq	r4, #53251	; 0xd003
 888:	23020000 	movwcs	r0, #8192	; 0x2000
 88c:	03a00614 	moveq	r0, #20971520	; 0x1400000
 890:	41030000 	mrsmi	r0, (UNDEF: 3)
 894:	0000030d 	andeq	r0, r0, sp, lsl #6
 898:	06182302 	ldreq	r2, [r8], -r2, lsl #6
 89c:	000003f8 	strdeq	r0, [r0], -r8
 8a0:	030d4203 	movweq	r4, #53763	; 0xd203
 8a4:	23020000 	movwcs	r0, #8192	; 0x2000
 8a8:	03fd061c 	mvnseq	r0, #29360128	; 0x1c00000
 8ac:	43030000 	movwmi	r0, #12288	; 0x3000
 8b0:	0000030d 	andeq	r0, r0, sp, lsl #6
 8b4:	06202302 	strteq	r2, [r0], -r2, lsl #6
 8b8:	0000031e 	andeq	r0, r0, lr, lsl r3
 8bc:	030d4403 	movweq	r4, #54275	; 0xd403
 8c0:	23020000 	movwcs	r0, #8192	; 0x2000
 8c4:	03ee0624 	mvneq	r0, #37748736	; 0x2400000
 8c8:	45030000 	strmi	r0, [r3, #-0]
 8cc:	0000030d 	andeq	r0, r0, sp, lsl #6
 8d0:	06282302 	strteq	r2, [r8], -r2, lsl #6
 8d4:	000003f3 	strdeq	r0, [r0], -r3
 8d8:	030d4603 	movweq	r4, #54787	; 0xd603
 8dc:	23020000 	movwcs	r0, #8192	; 0x2000
 8e0:	0328062c 	teqeq	r8, #46137344	; 0x2c00000
 8e4:	47030000 	strmi	r0, [r3, -r0]
 8e8:	0000030d 	andeq	r0, r0, sp, lsl #6
 8ec:	06302302 	ldrteq	r2, [r0], -r2, lsl #6
 8f0:	00000332 	andeq	r0, r0, r2, lsr r3
 8f4:	030d4803 	movweq	r4, #55299	; 0xd803
 8f8:	23020000 	movwcs	r0, #8192	; 0x2000
 8fc:	03370634 	teqeq	r7, #54525952	; 0x3400000
 900:	49030000 	stmdbmi	r3, {}	; <UNPREDICTABLE>
 904:	0000030d 	andeq	r0, r0, sp, lsl #6
 908:	06382302 	ldrteq	r2, [r8], -r2, lsl #6
 90c:	000003b2 			; <UNDEFINED> instruction: 0x000003b2
 910:	030d4a03 	movweq	r4, #55811	; 0xda03
 914:	23020000 	movwcs	r0, #8192	; 0x2000
 918:	0411063c 	ldreq	r0, [r1], #-1596	; 0x63c
 91c:	4b030000 	blmi	c0924 <_stack+0x40924>
 920:	0000030d 	andeq	r0, r0, sp, lsl #6
 924:	06402302 	strbeq	r2, [r0], -r2, lsl #6
 928:	00000416 	andeq	r0, r0, r6, lsl r4
 92c:	030d4c03 	movweq	r4, #56323	; 0xdc03
 930:	23020000 	movwcs	r0, #8192	; 0x2000
 934:	03bc0644 			; <UNDEFINED> instruction: 0x03bc0644
 938:	4d030000 	stcmi	0, cr0, [r3, #-0]
 93c:	0000030d 	andeq	r0, r0, sp, lsl #6
 940:	06482302 	strbeq	r2, [r8], -r2, lsl #6
 944:	0000030f 	andeq	r0, r0, pc, lsl #6
 948:	030d4e03 	movweq	r4, #56835	; 0xde03
 94c:	23020000 	movwcs	r0, #8192	; 0x2000
 950:	0428064c 	strteq	r0, [r8], #-1612	; 0x64c
 954:	4f030000 	svcmi	0x00030000
 958:	0000030d 	andeq	r0, r0, sp, lsl #6
 95c:	06502302 	ldrbeq	r2, [r0], -r2, lsl #6
 960:	000003c6 	andeq	r0, r0, r6, asr #7
 964:	030d5003 	movweq	r5, #53251	; 0xd003
 968:	23020000 	movwcs	r0, #8192	; 0x2000
 96c:	02f70654 	rscseq	r0, r7, #88080384	; 0x5400000
 970:	51030000 	mrspl	r0, (UNDEF: 3)
 974:	0000030d 	andeq	r0, r0, sp, lsl #6
 978:	06582302 	ldrbeq	r2, [r8], -r2, lsl #6
 97c:	000002f1 	strdeq	r0, [r0], -r1
 980:	030d5203 	movweq	r5, #53763	; 0xd203
 984:	23020000 	movwcs	r0, #8192	; 0x2000
 988:	03d0065c 	bicseq	r0, r0, #96468992	; 0x5c00000
 98c:	53030000 	movwpl	r0, #12288	; 0x3000
 990:	0000030d 	andeq	r0, r0, sp, lsl #6
 994:	06602302 	strbteq	r2, [r0], -r2, lsl #6
 998:	00000314 	andeq	r0, r0, r4, lsl r3
 99c:	030d5403 	movweq	r5, #54275	; 0xd403
 9a0:	23020000 	movwcs	r0, #8192	; 0x2000
 9a4:	03190664 	tsteq	r9, #104857600	; 0x6400000
 9a8:	55030000 	strpl	r0, [r3, #-0]
 9ac:	0000030d 	andeq	r0, r0, sp, lsl #6
 9b0:	06682302 	strbteq	r2, [r8], -r2, lsl #6
 9b4:	000003da 	ldrdeq	r0, [r0], -sl
 9b8:	030d5603 	movweq	r5, #54787	; 0xd603
 9bc:	23020000 	movwcs	r0, #8192	; 0x2000
 9c0:	02e6066c 	rsceq	r0, r6, #113246208	; 0x6c00000
 9c4:	57030000 	strpl	r0, [r3, -r0]
 9c8:	0000030d 	andeq	r0, r0, sp, lsl #6
 9cc:	06702302 	ldrbteq	r2, [r0], -r2, lsl #6
 9d0:	000002eb 	andeq	r0, r0, fp, ror #5
 9d4:	030d5803 	movweq	r5, #55299	; 0xd803
 9d8:	23020000 	movwcs	r0, #8192	; 0x2000
 9dc:	03e40674 	mvneq	r0, #121634816	; 0x7400000
 9e0:	59030000 	stmdbpl	r3, {}	; <UNPREDICTABLE>
 9e4:	0000030d 	andeq	r0, r0, sp, lsl #6
 9e8:	06782302 	ldrbteq	r2, [r8], -r2, lsl #6
 9ec:	0000030e 	andeq	r0, r0, lr, lsl #6
 9f0:	030d5a03 	movweq	r5, #55811	; 0xda03
 9f4:	23020000 	movwcs	r0, #8192	; 0x2000
 9f8:	0427067c 	strteq	r0, [r7], #-1660	; 0x67c
 9fc:	5b030000 	blpl	c0a04 <_stack+0x40a04>
 a00:	0000030d 	andeq	r0, r0, sp, lsl #6
 a04:	01802303 	orreq	r2, r0, r3, lsl #6
 a08:	00033c06 	andeq	r3, r3, r6, lsl #24
 a0c:	0d5c0300 	ldcleq	3, cr0, [ip, #-0]
 a10:	03000003 	movweq	r0, #3
 a14:	06018423 	streq	r8, [r1], -r3, lsr #8
 a18:	000002f6 	strdeq	r0, [r0], -r6
 a1c:	030d5d03 	movweq	r5, #56579	; 0xdd03
 a20:	23030000 	movwcs	r0, #12288	; 0x3000
 a24:	f0060188 			; <UNDEFINED> instruction: 0xf0060188
 a28:	03000002 	movweq	r0, #2
 a2c:	00030d5e 	andeq	r0, r3, lr, asr sp
 a30:	8c230300 	stchi	3, cr0, [r3], #-0
 a34:	03570601 	cmpeq	r7, #1048576	; 0x100000
 a38:	5f030000 	svcpl	0x00030000
 a3c:	0000030d 	andeq	r0, r0, sp, lsl #6
 a40:	01902303 	orrseq	r2, r0, r3, lsl #6
 a44:	44555007 	ldrbmi	r5, [r5], #-7
 a48:	0d600300 	stcleq	3, cr0, [r0, #-0]
 a4c:	03000003 	movweq	r0, #3
 a50:	06019423 	streq	r9, [r1], -r3, lsr #8
 a54:	0000042d 	andeq	r0, r0, sp, lsr #8
 a58:	030d6103 	movweq	r6, #53507	; 0xd103
 a5c:	23030000 	movwcs	r0, #12288	; 0x3000
 a60:	46060198 			; <UNDEFINED> instruction: 0x46060198
 a64:	03000003 	movweq	r0, #3
 a68:	00030d62 	andeq	r0, r3, r2, ror #26
 a6c:	9c230300 	stcls	3, cr0, [r3], #-0
 a70:	03620601 	cmneq	r2, #1048576	; 0x100000
 a74:	63030000 	movwvs	r0, #12288	; 0x3000
 a78:	0000030d 	andeq	r0, r0, sp, lsl #6
 a7c:	01a02303 	lsleq	r2, r3, #6
 a80:	00036d06 	andeq	r6, r3, r6, lsl #26
 a84:	0d640300 	stcleq	3, cr0, [r4, #-0]
 a88:	03000003 	movweq	r0, #3
 a8c:	0601a423 	streq	sl, [r1], -r3, lsr #8
 a90:	00000378 	andeq	r0, r0, r8, ror r3
 a94:	030d6503 	movweq	r6, #54531	; 0xd503
 a98:	23030000 	movwcs	r0, #12288	; 0x3000
 a9c:	830601a8 	movwhi	r0, #25000	; 0x61a8
 aa0:	03000003 	movweq	r0, #3
 aa4:	00030d66 	andeq	r0, r3, r6, ror #26
 aa8:	ac230300 	stcge	3, cr0, [r3], #-0
 aac:	04220601 	strteq	r0, [r2], #-1537	; 0x601
 ab0:	67030000 	strvs	r0, [r3, -r0]
 ab4:	00000312 	andeq	r0, r0, r2, lsl r3
 ab8:	01b02303 	lslseq	r2, r3, #6
 abc:	00530800 	subseq	r0, r3, r0, lsl #16
 ac0:	2c080000 	stccs	0, cr0, [r8], {-0}
 ac4:	03000000 	movweq	r0, #0
 ac8:	000002fc 	strdeq	r0, [r0], -ip
 acc:	00816803 	addeq	r6, r1, r3, lsl #16
 ad0:	01090000 	mrseq	r0, (UNDEF: 9)
 ad4:	0000038e 	andeq	r0, r0, lr, lsl #7
 ad8:	3c010601 	stccc	6, cr0, [r1], {1}
 adc:	a0000003 	andge	r0, r0, r3
 ae0:	c4000084 	strgt	r0, [r0], #-132	; 0x84
 ae4:	70000084 	andvc	r0, r0, r4, lsl #1
 ae8:	01000003 	tsteq	r0, r3
 aec:	0317040a 	tsteq	r7, #167772160	; 0xa000000
 af0:	020b0000 	andeq	r0, fp, #0
 af4:	01000004 	tsteq	r0, r4
 af8:	00033c04 	andeq	r3, r3, r4, lsl #24
 afc:	0c030500 	cfstr32eq	mvfx0, [r3], {-0}
 b00:	00000092 	muleq	r0, r2, r0
 b04:	000000e5 	andeq	r0, r0, r5, ror #1
 b08:	02670002 	rsbeq	r0, r7, #2
 b0c:	01040000 	mrseq	r0, (UNDEF: 4)
 b10:	0000006a 	andeq	r0, r0, sl, rrx
 b14:	00044701 	andeq	r4, r4, r1, lsl #14
 b18:	00002000 	andeq	r2, r0, r0
 b1c:	0084c400 	addeq	ip, r4, r0, lsl #8
 b20:	00857800 	addeq	r7, r5, r0, lsl #16
 b24:	00024800 	andeq	r4, r2, r0, lsl #16
 b28:	07040200 	streq	r0, [r4, -r0, lsl #4]
 b2c:	000000cb 	andeq	r0, r0, fp, asr #1
 b30:	2f060102 	svccs	0x00060102
 b34:	02000002 	andeq	r0, r0, #2
 b38:	022d0801 	eoreq	r0, sp, #65536	; 0x10000
 b3c:	02020000 	andeq	r0, r2, #0
 b40:	00023b05 	andeq	r3, r2, r5, lsl #22
 b44:	07020200 	streq	r0, [r2, -r0, lsl #4]
 b48:	000001ae 	andeq	r0, r0, lr, lsr #3
 b4c:	69050403 	stmdbvs	r5, {r0, r1, sl}
 b50:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 b54:	01060508 	tsteq	r6, r8, lsl #10
 b58:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 b5c:	0000c107 	andeq	ip, r0, r7, lsl #2
 b60:	05040200 	streq	r0, [r4, #-512]	; 0x200
 b64:	0000010b 	andeq	r0, r0, fp, lsl #2
 b68:	f6070402 			; <UNDEFINED> instruction: 0xf6070402
 b6c:	02000001 	andeq	r0, r0, #1
 b70:	00c60704 	sbceq	r0, r6, r4, lsl #14
 b74:	01020000 	mrseq	r0, (UNDEF: 2)
 b78:	00023608 	andeq	r3, r2, r8, lsl #12
 b7c:	54010400 	strpl	r0, [r1], #-1024	; 0x400
 b80:	01000004 	tsteq	r0, r4
 b84:	84c40107 	strbhi	r0, [r4], #263	; 0x107
 b88:	85780000 	ldrbhi	r0, [r8, #-0]!
 b8c:	039c0000 	orrseq	r0, ip, #0
 b90:	05010000 	streq	r0, [r1, #-0]
 b94:	01003072 	tsteq	r0, r2, ror r0
 b98:	00002507 	andeq	r2, r0, r7, lsl #10
 b9c:	6c910200 	lfmvs	f0, 4, [r1], {0}
 ba0:	00317205 	eorseq	r7, r1, r5, lsl #4
 ba4:	00250701 	eoreq	r0, r5, r1, lsl #14
 ba8:	91020000 	mrsls	r0, (UNDEF: 2)
 bac:	044e0668 	strbeq	r0, [lr], #-1640	; 0x668
 bb0:	07010000 	streq	r0, [r1, -r0]
 bb4:	00000025 	andeq	r0, r0, r5, lsr #32
 bb8:	07649102 	strbeq	r9, [r4, -r2, lsl #2]!
 bbc:	00008500 	andeq	r8, r0, r0, lsl #10
 bc0:	00008528 	andeq	r8, r0, r8, lsr #10
 bc4:	000000d1 	ldrdeq	r0, [r0], -r1
 bc8:	01006908 	tsteq	r0, r8, lsl #18
 bcc:	00004810 	andeq	r4, r0, r0, lsl r8
 bd0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 bd4:	85380900 	ldrhi	r0, [r8, #-2304]!	; 0x900
 bd8:	85600000 	strbhi	r0, [r0, #-0]!
 bdc:	69080000 	stmdbvs	r8, {}	; <UNPREDICTABLE>
 be0:	48120100 	ldmdami	r2, {r8}
 be4:	02000000 	andeq	r0, r0, #0
 be8:	00007091 	muleq	r0, r1, r0
 bec:	00005f00 	andeq	r5, r0, r0, lsl #30
 bf0:	ea000200 	b	13f8 <SCTLR_ENABLE_INSTRUCTION_CACHE+0x3f8>
 bf4:	04000002 	streq	r0, [r0], #-2
 bf8:	00029b01 	andeq	r9, r2, r1, lsl #22
 bfc:	00800000 	addeq	r0, r0, r0
 c00:	00807000 	addeq	r7, r0, r0
 c04:	61747300 	cmnvs	r4, r0, lsl #6
 c08:	532e7472 	teqpl	lr, #1912602624	; 0x72000000
 c0c:	5c3a4400 	cfldrspl	mvf4, [sl], #-0
 c10:	4420794d 	strtmi	r7, [r0], #-2381	; 0x94d
 c14:	6d75636f 	ldclvs	3, cr6, [r5, #-444]!	; 0xfffffe44
 c18:	73746e65 	cmnvc	r4, #1616	; 0x650
 c1c:	6f72505c 	svcvs	0x0072505c
 c20:	7463656a 	strbtvc	r6, [r3], #-1386	; 0x56a
 c24:	70725c73 	rsbsvc	r5, r2, r3, ror ip
 c28:	70725c69 	rsbsvc	r5, r2, r9, ror #24
 c2c:	72655a69 	rsbvc	r5, r5, #430080	; 0x69000
 c30:	61625f6f 	cmnvs	r2, pc, ror #30
 c34:	656d6572 	strbvs	r6, [sp, #-1394]!	; 0x572
 c38:	5c6c6174 	stfple	f6, [ip], #-464	; 0xfffffe30
 c3c:	00637273 	rsbeq	r7, r3, r3, ror r2
 c40:	20554e47 	subscs	r4, r5, r7, asr #28
 c44:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
 c48:	2e32322e 	cdpcs	2, 3, cr3, cr2, cr14, {1}
 c4c:	80010030 	andhi	r0, r1, r0, lsr r0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10011201 	andne	r1, r1, r1, lsl #4
  10:	02000006 	andeq	r0, r0, #6
  14:	0c3f012e 	ldfeqs	f0, [pc], #-184	; ffffff64 <_stack+0xfff7ff64>
  18:	0b3a0e03 	bleq	e8382c <_stack+0xe0382c>
  1c:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
  20:	01120111 	tsteq	r2, r1, lsl r1
  24:	42960640 	addsmi	r0, r6, #67108864	; 0x4000000
  28:	0013010c 	andseq	r0, r3, ip, lsl #2
  2c:	00050300 	andeq	r0, r5, r0, lsl #6
  30:	0b3a0803 	bleq	e82044 <_stack+0xe02044>
  34:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  38:	00000a02 	andeq	r0, r0, r2, lsl #20
  3c:	03003404 	movweq	r3, #1028	; 0x404
  40:	3b0b3a08 	blcc	2ce868 <_stack+0x24e868>
  44:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  48:	0500000a 	streq	r0, [r0, #-10]
  4c:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  50:	0b3b0b3a 	bleq	ec2d40 <_stack+0xe42d40>
  54:	0a021349 	beq	84d80 <_stack+0x4d80>
  58:	24060000 	strcs	r0, [r6], #-0
  5c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  60:	000e030b 	andeq	r0, lr, fp, lsl #6
  64:	000f0700 	andeq	r0, pc, r0, lsl #14
  68:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  6c:	24080000 	strcs	r0, [r8], #-0
  70:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  74:	0008030b 	andeq	r0, r8, fp, lsl #6
  78:	00340900 	eorseq	r0, r4, r0, lsl #18
  7c:	0b3a0e03 	bleq	e83890 <_stack+0xe03890>
  80:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  84:	0c3c0c3f 	ldceq	12, cr0, [ip], #-252	; 0xffffff04
  88:	01000000 	mrseq	r0, (UNDEF: 0)
  8c:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
  90:	0e030b13 	vmoveq.32	d3[0], r0
  94:	01110e1b 	tsteq	r1, fp, lsl lr
  98:	06100112 			; <UNDEFINED> instruction: 0x06100112
  9c:	24020000 	strcs	r0, [r2], #-0
  a0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  a4:	0008030b 	andeq	r0, r8, fp, lsl #6
  a8:	00240300 	eoreq	r0, r4, r0, lsl #6
  ac:	0b3e0b0b 	bleq	f82ce0 <_stack+0xf02ce0>
  b0:	00000e03 	andeq	r0, r0, r3, lsl #28
  b4:	03001604 	movweq	r1, #1540	; 0x604
  b8:	3b0b3a0e 	blcc	2ce8f8 <_stack+0x24e8f8>
  bc:	0013490b 	andseq	r4, r3, fp, lsl #18
  c0:	000f0500 	andeq	r0, pc, r0, lsl #10
  c4:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  c8:	26060000 	strcs	r0, [r6], -r0
  cc:	00134900 	andseq	r4, r3, r0, lsl #18
  d0:	01130700 	tsteq	r3, r0, lsl #14
  d4:	0b0b0e03 	bleq	2c38e8 <_stack+0x2438e8>
  d8:	0b3b0b3a 	bleq	ec2dc8 <_stack+0xe42dc8>
  dc:	00001301 	andeq	r1, r0, r1, lsl #6
  e0:	03000d08 	movweq	r0, #3336	; 0xd08
  e4:	3b0b3a0e 	blcc	2ce924 <_stack+0x24e924>
  e8:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
  ec:	0900000a 	stmdbeq	r0, {r1, r3}
  f0:	13490101 	movtne	r0, #37121	; 0x9101
  f4:	00001301 	andeq	r1, r0, r1, lsl #6
  f8:	4900210a 	stmdbmi	r0, {r1, r3, r8, sp}
  fc:	000b2f13 	andeq	r2, fp, r3, lsl pc
 100:	01130b00 	tsteq	r3, r0, lsl #22
 104:	0b0b0803 	bleq	2c2118 <_stack+0x242118>
 108:	0b3b0b3a 	bleq	ec2df8 <_stack+0xe42df8>
 10c:	00001301 	andeq	r1, r0, r1, lsl #6
 110:	3f012e0c 	svccc	0x00012e0c
 114:	3a0e030c 	bcc	380d4c <_stack+0x300d4c>
 118:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 11c:	1201110c 	andne	r1, r1, #3
 120:	97064001 	strls	r4, [r6, -r1]
 124:	13010c42 	movwne	r0, #7234	; 0x1c42
 128:	050d0000 	streq	r0, [sp, #-0]
 12c:	3a0e0300 	bcc	380d34 <_stack+0x300d34>
 130:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 134:	000a0213 	andeq	r0, sl, r3, lsl r2
 138:	012e0e00 	teqeq	lr, r0, lsl #28
 13c:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 140:	0b3b0b3a 	bleq	ec2e30 <_stack+0xe42e30>
 144:	13490c27 	movtne	r0, #39975	; 0x9c27
 148:	01120111 	tsteq	r2, r1, lsl r1
 14c:	42970640 	addsmi	r0, r7, #67108864	; 0x4000000
 150:	0013010c 	andseq	r0, r3, ip, lsl #2
 154:	00050f00 	andeq	r0, r5, r0, lsl #30
 158:	0b3a0803 	bleq	e8216c <_stack+0xe0216c>
 15c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 160:	00000a02 	andeq	r0, r0, r2, lsl #20
 164:	3f002e10 	svccc	0x00002e10
 168:	3a0e030c 	bcc	380da0 <_stack+0x300da0>
 16c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 170:	1113490c 	tstne	r3, ip, lsl #18
 174:	40011201 	andmi	r1, r1, r1, lsl #4
 178:	0c429706 	mcrreq	7, 0, r9, r2, cr6
 17c:	34110000 	ldrcc	r0, [r1], #-0
 180:	3a0e0300 	bcc	380d88 <_stack+0x300d88>
 184:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 188:	3c0c3f13 	stccc	15, cr3, [ip], {19}
 18c:	1200000c 	andne	r0, r0, #12
 190:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 194:	0b3b0b3a 	bleq	ec2e84 <_stack+0xe42e84>
 198:	0a021349 	beq	84ec4 <_stack+0x4ec4>
 19c:	2e130000 	cdpcs	0, 1, cr0, cr3, cr0, {0}
 1a0:	030c3f01 	movweq	r3, #52993	; 0xcf01
 1a4:	3b0b3a0e 	blcc	2ce9e4 <_stack+0x24e9e4>
 1a8:	490c270b 	stmdbmi	ip, {r0, r1, r3, r8, r9, sl, sp}
 1ac:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 1b0:	96064001 	strls	r4, [r6], -r1
 1b4:	13010c42 	movwne	r0, #7234	; 0x1c42
 1b8:	34140000 	ldrcc	r0, [r4], #-0
 1bc:	3a0e0300 	bcc	380dc4 <_stack+0x300dc4>
 1c0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1c4:	020c3f13 	andeq	r3, ip, #76	; 0x4c
 1c8:	0000000a 	andeq	r0, r0, sl
 1cc:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 1d0:	030b130e 	movweq	r1, #45838	; 0xb30e
 1d4:	110e1b0e 	tstne	lr, lr, lsl #22
 1d8:	10011201 	andne	r1, r1, r1, lsl #4
 1dc:	02000006 	andeq	r0, r0, #6
 1e0:	0b0b0024 	bleq	2c0278 <_stack+0x240278>
 1e4:	0e030b3e 	vmoveq.16	d3[0], r0
 1e8:	16030000 	strne	r0, [r3], -r0
 1ec:	3a0e0300 	bcc	380df4 <_stack+0x300df4>
 1f0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1f4:	04000013 	streq	r0, [r0], #-19
 1f8:	0b0b0024 	bleq	2c0290 <_stack+0x240290>
 1fc:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 200:	13050000 	movwne	r0, #20480	; 0x5000
 204:	3a0b0b01 	bcc	2c2e10 <_stack+0x242e10>
 208:	010b3b0b 	tsteq	fp, fp, lsl #22
 20c:	06000013 			; <UNDEFINED> instruction: 0x06000013
 210:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 214:	0b3b0b3a 	bleq	ec2f04 <_stack+0xe42f04>
 218:	0a381349 	beq	e04f44 <_stack+0xd84f44>
 21c:	0d070000 	stceq	0, cr0, [r7, #-0]
 220:	3a080300 	bcc	200e28 <_stack+0x180e28>
 224:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 228:	000a3813 	andeq	r3, sl, r3, lsl r8
 22c:	00350800 	eorseq	r0, r5, r0, lsl #16
 230:	00001349 	andeq	r1, r0, r9, asr #6
 234:	3f002e09 	svccc	0x00002e09
 238:	3a0e030c 	bcc	380e70 <_stack+0x300e70>
 23c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 240:	1113490c 	tstne	r3, ip, lsl #18
 244:	40011201 	andmi	r1, r1, r1, lsl #4
 248:	0c429706 	mcrreq	7, 0, r9, r2, cr6
 24c:	0f0a0000 	svceq	0x000a0000
 250:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 254:	0b000013 	bleq	2a8 <CPSR_IRQ_INHIBIT+0x228>
 258:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 25c:	0b3b0b3a 	bleq	ec2f4c <_stack+0xe42f4c>
 260:	0a021349 	beq	84f8c <_stack+0x4f8c>
 264:	01000000 	mrseq	r0, (UNDEF: 0)
 268:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 26c:	0e030b13 	vmoveq.32	d3[0], r0
 270:	01110e1b 	tsteq	r1, fp, lsl lr
 274:	06100112 			; <UNDEFINED> instruction: 0x06100112
 278:	24020000 	strcs	r0, [r2], #-0
 27c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 280:	000e030b 	andeq	r0, lr, fp, lsl #6
 284:	00240300 	eoreq	r0, r4, r0, lsl #6
 288:	0b3e0b0b 	bleq	f82ebc <_stack+0xf02ebc>
 28c:	00000803 	andeq	r0, r0, r3, lsl #16
 290:	3f012e04 	svccc	0x00012e04
 294:	3a0e030c 	bcc	380ecc <_stack+0x300ecc>
 298:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 29c:	1201110c 	andne	r1, r1, #3
 2a0:	96064001 	strls	r4, [r6], -r1
 2a4:	00000c42 	andeq	r0, r0, r2, asr #24
 2a8:	03000505 	movweq	r0, #1285	; 0x505
 2ac:	3b0b3a08 	blcc	2cead4 <_stack+0x24ead4>
 2b0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 2b4:	0600000a 	streq	r0, [r0], -sl
 2b8:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 2bc:	0b3b0b3a 	bleq	ec2fac <_stack+0xe42fac>
 2c0:	0a021349 	beq	84fec <_stack+0x4fec>
 2c4:	0b070000 	bleq	1c02cc <_stack+0x1402cc>
 2c8:	12011101 	andne	r1, r1, #1073741824	; 0x40000000
 2cc:	00130101 	andseq	r0, r3, r1, lsl #2
 2d0:	00340800 	eorseq	r0, r4, r0, lsl #16
 2d4:	0b3a0803 	bleq	e822e8 <_stack+0xe022e8>
 2d8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 2dc:	00000a02 	andeq	r0, r0, r2, lsl #20
 2e0:	11010b09 	tstne	r1, r9, lsl #22
 2e4:	00011201 	andeq	r1, r1, r1, lsl #4
 2e8:	11010000 	mrsne	r0, (UNDEF: 1)
 2ec:	11061000 	mrsne	r1, (UNDEF: 6)
 2f0:	03011201 	movweq	r1, #4609	; 0x1201
 2f4:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 2f8:	00051308 	andeq	r1, r5, r8, lsl #6
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000045 	andeq	r0, r0, r5, asr #32
   4:	00210002 	eoreq	r0, r1, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	00010000 	andeq	r0, r1, r0
  1c:	61747363 	cmnvs	r4, r3, ror #6
  20:	70757472 	rsbsvc	r7, r5, r2, ror r4
  24:	0000632e 	andeq	r6, r0, lr, lsr #6
  28:	00000000 	andeq	r0, r0, r0
  2c:	80700205 	rsbshi	r0, r0, r5, lsl #4
  30:	10030000 	andne	r0, r3, r0
  34:	4d4bbb01 	vstrmi	d27, [fp, #-4]
  38:	0402002f 	streq	r0, [r2], #-47	; 0x2f
  3c:	0086b901 	addeq	fp, r6, r1, lsl #18
  40:	86010402 	strhi	r0, [r1], -r2, lsl #8
  44:	01000602 	tsteq	r0, r2, lsl #12
  48:	00013701 	andeq	r3, r1, r1, lsl #14
  4c:	c7000200 	strgt	r0, [r0, -r0, lsl #4]
  50:	02000000 	andeq	r0, r0, #0
  54:	0d0efb01 	vstreq	d15, [lr, #-4]
  58:	01010100 	mrseq	r0, (UNDEF: 17)
  5c:	00000001 	andeq	r0, r0, r1
  60:	01000001 	tsteq	r0, r1
  64:	705c3a63 	subsvc	r3, ip, r3, ror #20
  68:	72676f72 	rsbvc	r6, r7, #456	; 0x1c8
  6c:	66206d61 	strtvs	r6, [r0], -r1, ror #26
  70:	73656c69 	cmnvc	r5, #26880	; 0x6900
  74:	756e675c 	strbvc	r6, [lr, #-1884]!	; 0x75c
  78:	6f6f7420 	svcvs	0x006f7420
  7c:	6120736c 	teqvs	r0, ip, ror #6
  80:	65206d72 	strvs	r6, [r0, #-3442]!	; 0xd72
  84:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  88:	5c646564 	cfstr64pl	mvdx6, [r4], #-400	; 0xfffffe70
  8c:	20372e34 	eorscs	r2, r7, r4, lsr lr
  90:	34313032 	ldrtcc	r3, [r1], #-50	; 0x32
  94:	625c3271 	subsvs	r3, ip, #268435463	; 0x10000007
  98:	2e5c6e69 	cdpcs	14, 5, cr6, cr12, cr9, {3}
  9c:	696c2f2e 	stmdbvs	ip!, {r1, r2, r3, r5, r8, r9, sl, fp, sp}^
  a0:	63672f62 	cmnvs	r7, #392	; 0x188
  a4:	72612f63 	rsbvc	r2, r1, #396	; 0x18c
  a8:	6f6e2d6d 	svcvs	0x006e2d6d
  ac:	652d656e 	strvs	r6, [sp, #-1390]!	; 0x56e
  b0:	2f696261 	svccs	0x00696261
  b4:	2e372e34 	mrccs	14, 1, r2, cr7, cr4, {1}
  b8:	2e2e2f34 	mcrcs	15, 1, r2, cr14, cr4, {1}
  bc:	2f2e2e2f 	svccs	0x002e2e2f
  c0:	2e2f2e2e 	cdpcs	14, 2, cr2, cr15, cr14, {1}
  c4:	72612f2e 	rsbvc	r2, r1, #184	; 0xb8
  c8:	6f6e2d6d 	svcvs	0x006e2d6d
  cc:	652d656e 	strvs	r6, [sp, #-1390]!	; 0x56e
  d0:	2f696261 	svccs	0x00696261
  d4:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
  d8:	2f656475 	svccs	0x00656475
  dc:	00737973 	rsbseq	r7, r3, r3, ror r9
  e0:	74736300 	ldrbtvc	r6, [r3], #-768	; 0x300
  e4:	2e736275 	mrccs	2, 3, r6, cr3, cr5, {3}
  e8:	00000063 	andeq	r0, r0, r3, rrx
  ec:	79745f00 	ldmdbvc	r4!, {r8, r9, sl, fp, ip, lr}^
  f0:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
  f4:	00010068 	andeq	r0, r1, r8, rrx
  f8:	70797400 	rsbsvc	r7, r9, r0, lsl #8
  fc:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 100:	00000100 	andeq	r0, r0, r0, lsl #2
 104:	74617473 	strbtvc	r7, [r1], #-1139	; 0x473
 108:	0100682e 	tsteq	r0, lr, lsr #16
 10c:	69740000 	ldmdbvs	r4!, {}^	; <UNPREDICTABLE>
 110:	2e73656d 	cdpcs	5, 7, cr6, cr3, cr13, {3}
 114:	00010068 	andeq	r0, r1, r8, rrx
 118:	05000000 	streq	r0, [r0, #-0]
 11c:	0080e002 	addeq	lr, r0, r2
 120:	00cf0300 	sbceq	r0, pc, r0, lsl #6
 124:	04020001 	streq	r0, [r2], #-1
 128:	83358901 	teqhi	r5, #16384	; 0x4000
 12c:	67bb882f 	ldrvs	r8, [fp, pc, lsr #16]!
 130:	674ba42f 	strbvs	sl, [fp, -pc, lsr #8]
 134:	679fa62f 	ldrvs	sl, [pc, pc, lsr #12]
 138:	2f4b892f 	svccs	0x004b892f
 13c:	872f8389 	strhi	r8, [pc, -r9, lsl #7]!
 140:	a32f679f 	teqge	pc, #41680896	; 0x27c0000
 144:	a32f679f 	teqge	pc, #41680896	; 0x27c0000
 148:	bb872fbb 	bllt	fe1cc03c <_stack+0xfe14c03c>
 14c:	2fbb872f 	svccs	0x00bb872f
 150:	6883878a 	stmvs	r3, {r1, r3, r7, r8, r9, sl, pc}
 154:	bf2fbc67 	svclt	0x002fbc67
 158:	872f679f 			; <UNDEFINED> instruction: 0x872f679f
 15c:	83872f83 	orrhi	r2, r7, #524	; 0x20c
 160:	83a32f67 			; <UNDEFINED> instruction: 0x83a32f67
 164:	a1a22f67 			; <UNDEFINED> instruction: 0xa1a22f67
 168:	bd660a03 	vstmdblt	r6!, {s1-s3}
 16c:	02040200 	andeq	r0, r4, #0
 170:	04020067 	streq	r0, [r2], #-103	; 0x67
 174:	0200d502 	andeq	sp, r0, #8388608	; 0x800000
 178:	66060104 	strvs	r0, [r6], -r4, lsl #2
 17c:	022f8506 	eoreq	r8, pc, #25165824	; 0x1800000
 180:	01010006 	tsteq	r1, r6
 184:	000000c0 	andeq	r0, r0, r0, asr #1
 188:	00ab0002 	adceq	r0, fp, r2
 18c:	01020000 	mrseq	r0, (UNDEF: 2)
 190:	000d0efb 	strdeq	r0, [sp], -fp
 194:	01010101 	tsteq	r1, r1, lsl #2
 198:	01000000 	mrseq	r0, (UNDEF: 0)
 19c:	63010000 	movwvs	r0, #4096	; 0x1000
 1a0:	72705c3a 	rsbsvc	r5, r0, #14848	; 0x3a00
 1a4:	6172676f 	cmnvs	r2, pc, ror #14
 1a8:	6966206d 	stmdbvs	r6!, {r0, r2, r3, r5, r6, sp}^
 1ac:	5c73656c 	cfldr64pl	mvdx6, [r3], #-432	; 0xfffffe50
 1b0:	20756e67 	rsbscs	r6, r5, r7, ror #28
 1b4:	6c6f6f74 	stclvs	15, cr6, [pc], #-464	; ffffffec <_stack+0xfff7ffec>
 1b8:	72612073 	rsbvc	r2, r1, #115	; 0x73
 1bc:	6d65206d 	stclvs	0, cr2, [r5, #-436]!	; 0xfffffe4c
 1c0:	64646562 	strbtvs	r6, [r4], #-1378	; 0x562
 1c4:	345c6465 	ldrbcc	r6, [ip], #-1125	; 0x465
 1c8:	3220372e 	eorcc	r3, r0, #12058624	; 0xb80000
 1cc:	71343130 	teqvc	r4, r0, lsr r1
 1d0:	69625c32 	stmdbvs	r2!, {r1, r4, r5, sl, fp, ip, lr}^
 1d4:	2e2e5c6e 	cdpcs	12, 2, cr5, cr14, cr14, {3}
 1d8:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 1dc:	6363672f 	cmnvs	r3, #12320768	; 0xbc0000
 1e0:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 1e4:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 1e8:	61652d65 	cmnvs	r5, r5, ror #26
 1ec:	342f6962 	strtcc	r6, [pc], #-2402	; 1f4 <CPSR_IRQ_INHIBIT+0x174>
 1f0:	342e372e 	strtcc	r3, [lr], #-1838	; 0x72e
 1f4:	2f2e2e2f 	svccs	0x002e2e2f
 1f8:	2e2f2e2e 	cdpcs	14, 2, cr2, cr15, cr14, {1}
 1fc:	2e2e2f2e 	cdpcs	15, 2, cr2, cr14, cr14, {1}
 200:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 204:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 208:	61652d65 	cmnvs	r5, r5, ror #26
 20c:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
 210:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 214:	00006564 	andeq	r6, r0, r4, ror #10
 218:	6f697067 	svcvs	0x00697067
 21c:	0000632e 	andeq	r6, r0, lr, lsr #6
 220:	74730000 	ldrbtvc	r0, [r3], #-0
 224:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 228:	0100682e 	tsteq	r0, lr, lsr #16
 22c:	70670000 	rsbvc	r0, r7, r0
 230:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 234:	00000000 	andeq	r0, r0, r0
 238:	02050000 	andeq	r0, r5, #0
 23c:	000084a0 	andeq	r8, r0, r0, lsr #9
 240:	024b4b18 	subeq	r4, fp, #24576	; 0x6000
 244:	0101000a 	tsteq	r1, sl
 248:	0000004f 	andeq	r0, r0, pc, asr #32
 24c:	001d0002 	andseq	r0, sp, r2
 250:	01020000 	mrseq	r0, (UNDEF: 2)
 254:	000d0efb 	strdeq	r0, [sp], -fp
 258:	01010101 	tsteq	r1, r1, lsl #2
 25c:	01000000 	mrseq	r0, (UNDEF: 0)
 260:	00010000 	andeq	r0, r1, r0
 264:	6e69616d 	powvsez	f6, f1, #5.0
 268:	0000632e 	andeq	r6, r0, lr, lsr #6
 26c:	00000000 	andeq	r0, r0, r0
 270:	84c40205 	strbhi	r0, [r4], #517	; 0x205
 274:	bc190000 	ldclt	0, cr0, [r9], {-0}
 278:	020085a1 	andeq	r8, r0, #675282944	; 0x28400000
 27c:	66060204 	strvs	r0, [r6], -r4, lsl #4
 280:	01040200 	mrseq	r0, R12_usr
 284:	83830666 	orrhi	r0, r3, #106954752	; 0x6600000
 288:	02040200 	andeq	r0, r4, #0
 28c:	02006606 	andeq	r6, r0, #6291456	; 0x600000
 290:	06660104 	strbteq	r0, [r6], -r4, lsl #2
 294:	04028383 	streq	r8, [r2], #-899	; 0x383
 298:	4f010100 	svcmi	0x00010100
 29c:	02000000 	andeq	r0, r0, #0
 2a0:	00001e00 	andeq	r1, r0, r0, lsl #28
 2a4:	fb010200 	blx	40aae <__bss_end__+0x37022>
 2a8:	01000d0e 	tsteq	r0, lr, lsl #26
 2ac:	00010101 	andeq	r0, r1, r1, lsl #2
 2b0:	00010000 	andeq	r0, r1, r0
 2b4:	73000100 	movwvc	r0, #256	; 0x100
 2b8:	74726174 	ldrbtvc	r6, [r2], #-372	; 0x174
 2bc:	0000532e 	andeq	r5, r0, lr, lsr #6
 2c0:	00000000 	andeq	r0, r0, r0
 2c4:	80000205 	andhi	r0, r0, r5, lsl #4
 2c8:	c0030000 	andgt	r0, r3, r0
 2cc:	2f2f0100 	svccs	0x002f0100
 2d0:	2f2f2f31 	svccs	0x002f2f31
 2d4:	2f2f312f 	svccs	0x002f312f
 2d8:	2f2f2f2f 	svccs	0x002f2f2f
 2dc:	2f323131 	svccs	0x00323131
 2e0:	2f2f312f 	svccs	0x002f312f
 2e4:	2f2f322f 	svccs	0x002f322f
 2e8:	0002022f 	andeq	r0, r2, pc, lsr #4
 2ec:	Address 0x000002ec is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000018 	andeq	r0, r0, r8, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008070 	andeq	r8, r0, r0, ror r0
  1c:	00000070 	andeq	r0, r0, r0, ror r0
  20:	8b080e42 	blhi	203930 <_stack+0x183930>
  24:	42018e02 	andmi	r8, r1, #32
  28:	00040b0c 	andeq	r0, r4, ip, lsl #22
  2c:	0000000c 	andeq	r0, r0, ip
  30:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  34:	7c020001 	stcvc	0, cr0, [r2], {1}
  38:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  3c:	00000014 	andeq	r0, r0, r4, lsl r0
  40:	0000002c 	andeq	r0, r0, ip, lsr #32
  44:	000080e0 	andeq	r8, r0, r0, ror #1
  48:	00000014 	andeq	r0, r0, r4, lsl r0
  4c:	8b040e42 	blhi	10395c <_stack+0x8395c>
  50:	0b0d4201 	bleq	35085c <_stack+0x2d085c>
  54:	00000014 	andeq	r0, r0, r4, lsl r0
  58:	0000002c 	andeq	r0, r0, ip, lsr #32
  5c:	000080f4 	strdeq	r8, [r0], -r4
  60:	00000024 	andeq	r0, r0, r4, lsr #32
  64:	8b040e42 	blhi	103974 <_stack+0x83974>
  68:	0b0d4201 	bleq	350874 <_stack+0x2d0874>
  6c:	00000014 	andeq	r0, r0, r4, lsl r0
  70:	0000002c 	andeq	r0, r0, ip, lsr #32
  74:	00008118 	andeq	r8, r0, r8, lsl r1
  78:	0000003c 	andeq	r0, r0, ip, lsr r0
  7c:	8b040e42 	blhi	10398c <_stack+0x8398c>
  80:	0b0d4201 	bleq	35088c <_stack+0x2d088c>
  84:	00000014 	andeq	r0, r0, r4, lsl r0
  88:	0000002c 	andeq	r0, r0, ip, lsr #32
  8c:	00008154 	andeq	r8, r0, r4, asr r1
  90:	0000002c 	andeq	r0, r0, ip, lsr #32
  94:	8b040e42 	blhi	1039a4 <_stack+0x839a4>
  98:	0b0d4201 	bleq	3508a4 <_stack+0x2d08a4>
  9c:	00000014 	andeq	r0, r0, r4, lsl r0
  a0:	0000002c 	andeq	r0, r0, ip, lsr #32
  a4:	00008180 	andeq	r8, r0, r0, lsl #3
  a8:	00000034 	andeq	r0, r0, r4, lsr r0
  ac:	8b040e42 	blhi	1039bc <_stack+0x839bc>
  b0:	0b0d4201 	bleq	3508bc <_stack+0x2d08bc>
  b4:	00000014 	andeq	r0, r0, r4, lsl r0
  b8:	0000002c 	andeq	r0, r0, ip, lsr #32
  bc:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	8b040e42 	blhi	1039d4 <_stack+0x839d4>
  c8:	0b0d4201 	bleq	3508d4 <_stack+0x2d08d4>
  cc:	00000014 	andeq	r0, r0, r4, lsl r0
  d0:	0000002c 	andeq	r0, r0, ip, lsr #32
  d4:	000081d0 	ldrdeq	r8, [r0], -r0
  d8:	00000024 	andeq	r0, r0, r4, lsr #32
  dc:	8b040e42 	blhi	1039ec <_stack+0x839ec>
  e0:	0b0d4201 	bleq	3508ec <_stack+0x2d08ec>
  e4:	00000014 	andeq	r0, r0, r4, lsl r0
  e8:	0000002c 	andeq	r0, r0, ip, lsr #32
  ec:	000081f4 	strdeq	r8, [r0], -r4
  f0:	00000038 	andeq	r0, r0, r8, lsr r0
  f4:	8b040e42 	blhi	103a04 <_stack+0x83a04>
  f8:	0b0d4201 	bleq	350904 <_stack+0x2d0904>
  fc:	00000014 	andeq	r0, r0, r4, lsl r0
 100:	0000002c 	andeq	r0, r0, ip, lsr #32
 104:	0000822c 	andeq	r8, r0, ip, lsr #4
 108:	00000038 	andeq	r0, r0, r8, lsr r0
 10c:	8b040e42 	blhi	103a1c <_stack+0x83a1c>
 110:	0b0d4201 	bleq	35091c <_stack+0x2d091c>
 114:	00000014 	andeq	r0, r0, r4, lsl r0
 118:	0000002c 	andeq	r0, r0, ip, lsr #32
 11c:	00008264 	andeq	r8, r0, r4, ror #4
 120:	0000002c 	andeq	r0, r0, ip, lsr #32
 124:	8b040e42 	blhi	103a34 <_stack+0x83a34>
 128:	0b0d4201 	bleq	350934 <_stack+0x2d0934>
 12c:	00000014 	andeq	r0, r0, r4, lsl r0
 130:	0000002c 	andeq	r0, r0, ip, lsr #32
 134:	00008290 	muleq	r0, r0, r2
 138:	0000002c 	andeq	r0, r0, ip, lsr #32
 13c:	8b040e42 	blhi	103a4c <_stack+0x83a4c>
 140:	0b0d4201 	bleq	35094c <_stack+0x2d094c>
 144:	00000014 	andeq	r0, r0, r4, lsl r0
 148:	0000002c 	andeq	r0, r0, ip, lsr #32
 14c:	000082bc 			; <UNDEFINED> instruction: 0x000082bc
 150:	0000002c 	andeq	r0, r0, ip, lsr #32
 154:	8b040e42 	blhi	103a64 <_stack+0x83a64>
 158:	0b0d4201 	bleq	350964 <_stack+0x2d0964>
 15c:	00000014 	andeq	r0, r0, r4, lsl r0
 160:	0000002c 	andeq	r0, r0, ip, lsr #32
 164:	000082e8 	andeq	r8, r0, r8, ror #5
 168:	0000006c 	andeq	r0, r0, ip, rrx
 16c:	8b040e42 	blhi	103a7c <_stack+0x83a7c>
 170:	0b0d4201 	bleq	35097c <_stack+0x2d097c>
 174:	00000014 	andeq	r0, r0, r4, lsl r0
 178:	0000002c 	andeq	r0, r0, ip, lsr #32
 17c:	00008354 	andeq	r8, r0, r4, asr r3
 180:	00000034 	andeq	r0, r0, r4, lsr r0
 184:	8b040e42 	blhi	103a94 <_stack+0x83a94>
 188:	0b0d4201 	bleq	350994 <_stack+0x2d0994>
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000002c 	andeq	r0, r0, ip, lsr #32
 194:	00008388 	andeq	r8, r0, r8, lsl #7
 198:	00000024 	andeq	r0, r0, r4, lsr #32
 19c:	8b040e42 	blhi	103aac <_stack+0x83aac>
 1a0:	0b0d4201 	bleq	3509ac <_stack+0x2d09ac>
 1a4:	00000014 	andeq	r0, r0, r4, lsl r0
 1a8:	0000002c 	andeq	r0, r0, ip, lsr #32
 1ac:	000083ac 	andeq	r8, r0, ip, lsr #7
 1b0:	00000034 	andeq	r0, r0, r4, lsr r0
 1b4:	8b040e42 	blhi	103ac4 <_stack+0x83ac4>
 1b8:	0b0d4201 	bleq	3509c4 <_stack+0x2d09c4>
 1bc:	00000014 	andeq	r0, r0, r4, lsl r0
 1c0:	0000002c 	andeq	r0, r0, ip, lsr #32
 1c4:	000083e0 	andeq	r8, r0, r0, ror #7
 1c8:	00000034 	andeq	r0, r0, r4, lsr r0
 1cc:	8b040e42 	blhi	103adc <_stack+0x83adc>
 1d0:	0b0d4201 	bleq	3509dc <_stack+0x2d09dc>
 1d4:	00000014 	andeq	r0, r0, r4, lsl r0
 1d8:	0000002c 	andeq	r0, r0, ip, lsr #32
 1dc:	00008414 	andeq	r8, r0, r4, lsl r4
 1e0:	00000020 	andeq	r0, r0, r0, lsr #32
 1e4:	8b040e42 	blhi	103af4 <_stack+0x83af4>
 1e8:	0b0d4201 	bleq	3509f4 <_stack+0x2d09f4>
 1ec:	00000018 	andeq	r0, r0, r8, lsl r0
 1f0:	0000002c 	andeq	r0, r0, ip, lsr #32
 1f4:	00008434 	andeq	r8, r0, r4, lsr r4
 1f8:	0000006c 	andeq	r0, r0, ip, rrx
 1fc:	8b080e42 	blhi	203b0c <_stack+0x183b0c>
 200:	42018e02 	andmi	r8, r1, #32
 204:	00040b0c 	andeq	r0, r4, ip, lsl #22
 208:	0000000c 	andeq	r0, r0, ip
 20c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 210:	7c020001 	stcvc	0, cr0, [r2], {1}
 214:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 218:	00000014 	andeq	r0, r0, r4, lsl r0
 21c:	00000208 	andeq	r0, r0, r8, lsl #4
 220:	000084a0 	andeq	r8, r0, r0, lsr #9
 224:	00000024 	andeq	r0, r0, r4, lsr #32
 228:	8b040e42 	blhi	103b38 <_stack+0x83b38>
 22c:	0b0d4201 	bleq	350a38 <_stack+0x2d0a38>
 230:	0000000c 	andeq	r0, r0, ip
 234:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 238:	7c020001 	stcvc	0, cr0, [r2], {1}
 23c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 240:	00000018 	andeq	r0, r0, r8, lsl r0
 244:	00000230 	andeq	r0, r0, r0, lsr r2
 248:	000084c4 	andeq	r8, r0, r4, asr #9
 24c:	000000b4 	strheq	r0, [r0], -r4
 250:	8b080e42 	blhi	203b60 <_stack+0x183b60>
 254:	42018e02 	andmi	r8, r1, #32
 258:	00040b0c 	andeq	r0, r4, ip, lsl #22
 25c:	0000000c 	andeq	r0, r0, ip
 260:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 264:	7c020001 	stcvc	0, cr0, [r2], {1}
 268:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 26c:	00000018 	andeq	r0, r0, r8, lsl r0
 270:	0000025c 	andeq	r0, r0, ip, asr r2
 274:	00008578 	andeq	r8, r0, r8, ror r5
 278:	0000002c 	andeq	r0, r0, ip, lsr #32
 27c:	83100e42 	tsthi	r0, #1056	; 0x420
 280:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 284:	00018e02 	andeq	r8, r1, r2, lsl #28
 288:	00000018 	andeq	r0, r0, r8, lsl r0
 28c:	0000025c 	andeq	r0, r0, ip, asr r2
 290:	000085a4 	andeq	r8, r0, r4, lsr #11
 294:	000000fc 	strdeq	r0, [r0], -ip
 298:	84100e48 	ldrhi	r0, [r0], #-3656	; 0xe48
 29c:	86038504 	strhi	r8, [r3], -r4, lsl #10
 2a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 2a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 2a8:	0000025c 	andeq	r0, r0, ip, asr r2
 2ac:	000086a0 	andeq	r8, r0, r0, lsr #13
 2b0:	00000074 	andeq	r0, r0, r4, ror r0
 2b4:	83180e42 	tsthi	r8, #1056	; 0x420
 2b8:	85058406 	strhi	r8, [r5, #-1030]	; 0x406
 2bc:	87038604 	strhi	r8, [r3, -r4, lsl #12]
 2c0:	00018e02 	andeq	r8, r1, r2, lsl #28
 2c4:	0000000c 	andeq	r0, r0, ip
 2c8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2cc:	7c020001 	stcvc	0, cr0, [r2], {1}
 2d0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2d4:	0000001c 	andeq	r0, r0, ip, lsl r0
 2d8:	000002c4 	andeq	r0, r0, r4, asr #5
 2dc:	00008714 	andeq	r8, r0, r4, lsl r7
 2e0:	000000fc 	strdeq	r0, [r0], -ip
 2e4:	83180e42 	tsthi	r8, #1056	; 0x420
 2e8:	85058406 	strhi	r8, [r5, #-1030]	; 0x406
 2ec:	87038604 	strhi	r8, [r3, -r4, lsl #12]
 2f0:	00018e02 	andeq	r8, r1, r2, lsl #28
 2f4:	0000001c 	andeq	r0, r0, ip, lsl r0
 2f8:	000002c4 	andeq	r0, r0, r4, asr #5
 2fc:	00008810 	andeq	r8, r0, r0, lsl r8
 300:	0000026c 	andeq	r0, r0, ip, ror #4
 304:	83180e42 	tsthi	r8, #1056	; 0x420
 308:	85058406 	strhi	r8, [r5, #-1030]	; 0x406
 30c:	87038604 	strhi	r8, [r3, -r4, lsl #12]
 310:	00018e02 	andeq	r8, r1, r2, lsl #28
 314:	0000000c 	andeq	r0, r0, ip
 318:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 31c:	7c020001 	stcvc	0, cr0, [r2], {1}
 320:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 324:	00000024 	andeq	r0, r0, r4, lsr #32
 328:	00000314 	andeq	r0, r0, r4, lsl r3
 32c:	00008a7c 	andeq	r8, r0, ip, ror sl
 330:	0000073c 	andeq	r0, r0, ip, lsr r7
 334:	84240e42 	strthi	r0, [r4], #-3650	; 0xe42
 338:	86088509 	strhi	r8, [r8], -r9, lsl #10
 33c:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
 340:	8a048905 	bhi	12275c <_stack+0xa275c>
 344:	8e028b03 	vmlahi.f64	d8, d2, d3
 348:	300e5801 	andcc	r5, lr, r1, lsl #16
 34c:	0000000c 	andeq	r0, r0, ip
 350:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 354:	7c020001 	stcvc	0, cr0, [r2], {1}
 358:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 35c:	0000000c 	andeq	r0, r0, ip
 360:	0000034c 	andeq	r0, r0, ip, asr #6
 364:	000091b8 			; <UNDEFINED> instruction: 0x000091b8
 368:	00000004 	andeq	r0, r0, r4
 36c:	0000000c 	andeq	r0, r0, ip
 370:	0000034c 	andeq	r0, r0, ip, asr #6
 374:	000091bc 			; <UNDEFINED> instruction: 0x000091bc
 378:	00000004 	andeq	r0, r0, r4
 37c:	0000000c 	andeq	r0, r0, ip
 380:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 384:	7c020001 	stcvc	0, cr0, [r2], {1}
 388:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 38c:	00000018 	andeq	r0, r0, r8, lsl r0
 390:	0000037c 	andeq	r0, r0, ip, ror r3
 394:	000091c0 	andeq	r9, r0, r0, asr #3
 398:	00000040 	andeq	r0, r0, r0, asr #32
 39c:	83100e42 	tsthi	r0, #1056	; 0x420
 3a0:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
 3a4:	00018e02 	andeq	r8, r1, r2, lsl #28

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	7473635f 	ldrbtvc	r6, [r3], #-863	; 0x35f
   4:	75747261 	ldrbvc	r7, [r4, #-609]!	; 0x261
   8:	73620070 	cmnvc	r2, #112	; 0x70
   c:	6e655f73 	mcrvs	15, 3, r5, cr5, cr3, {3}
  10:	5f5f0064 	svcpl	0x005f0064
  14:	5f737362 	svcpl	0x00737362
  18:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
  1c:	005f5f74 	subseq	r5, pc, r4, ror pc	; <UNPREDICTABLE>
  20:	4d5c3a44 	vldrmi	s7, [ip, #-272]	; 0xfffffef0
  24:	6f442079 	svcvs	0x00442079
  28:	656d7563 	strbvs	r7, [sp, #-1379]!	; 0x563
  2c:	5c73746e 	cfldrdpl	mvd7, [r3], #-440	; 0xfffffe48
  30:	6a6f7250 	bvs	1bdc978 <_stack+0x1b5c978>
  34:	73746365 	cmnvc	r4, #-1811939327	; 0x94000001
  38:	6970725c 	ldmdbvs	r0!, {r2, r3, r4, r6, r9, ip, sp, lr}^
  3c:	6970725c 	ldmdbvs	r0!, {r2, r3, r4, r6, r9, ip, sp, lr}^
  40:	6f72655a 	svcvs	0x0072655a
  44:	7261625f 	rsbvc	r6, r1, #-268435451	; 0xf0000005
  48:	74656d65 	strbtvc	r6, [r5], #-3429	; 0xd65
  4c:	735c6c61 	cmpvc	ip, #24832	; 0x6100
  50:	5f006372 	svcpl	0x00006372
  54:	7373625f 	cmnvc	r3, #-268435451	; 0xf0000005
  58:	646e655f 	strbtvs	r6, [lr], #-1375	; 0x55f
  5c:	63005f5f 	movwvs	r5, #3935	; 0xf5f
  60:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
  64:	2e707574 	mrccs	5, 3, r7, cr0, cr4, {3}
  68:	4e470063 	cdpmi	0, 4, cr0, cr7, cr3, {3}
  6c:	20432055 	subcs	r2, r3, r5, asr r0
  70:	2e372e34 	mrccs	14, 1, r2, cr7, cr4, {1}
  74:	30322034 	eorscc	r2, r2, r4, lsr r0
  78:	34303431 	ldrtcc	r3, [r0], #-1073	; 0x431
  7c:	28203130 	stmdacs	r0!, {r4, r5, r8, ip, sp}
  80:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0x572
  84:	29657361 	stmdbcs	r5!, {r0, r5, r6, r8, r9, ip, sp, lr}^
  88:	52415b20 	subpl	r5, r1, #32768	; 0x8000
  8c:	6d652f4d 	stclvs	15, cr2, [r5, #-308]!	; 0xfffffecc
  90:	64646562 	strbtvs	r6, [r4], #-1378	; 0x562
  94:	342d6465 	strtcc	r6, [sp], #-1125	; 0x465
  98:	622d375f 	eorvs	r3, sp, #24903680	; 0x17c0000
  9c:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
  a0:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0x68
  a4:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
  a8:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
  ac:	39313930 	ldmdbcc	r1!, {r4, r5, r8, fp, ip, sp}
  b0:	5f005d35 	svcpl	0x00005d35
  b4:	6469675f 	strbtvs	r6, [r9], #-1887	; 0x75f
  b8:	5f00745f 	svcpl	0x0000745f
  bc:	766e655f 			; <UNDEFINED> instruction: 0x766e655f
  c0:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
  c4:	6f6c2067 	svcvs	0x006c2067
  c8:	7520676e 	strvc	r6, [r0, #-1902]!	; 0x76e
  cc:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
  d0:	2064656e 	rsbcs	r6, r4, lr, ror #10
  d4:	00746e69 	rsbseq	r6, r4, r9, ror #28
  d8:	625f7473 	subsvs	r7, pc, #1929379840	; 0x73000000
  dc:	6b636f6c 	blvs	18dbe94 <_stack+0x185be94>
  e0:	6d740073 	ldclvs	0, cr0, [r4, #-460]!	; 0xfffffe34
  e4:	75635f73 	strbvc	r5, [r3, #-3955]!	; 0xf73
  e8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
  ec:	6c696b00 	stclvs	11, cr6, [r9], #-0
  f0:	655f006c 	ldrbvs	r0, [pc, #-108]	; 8c <CPSR_IRQ_INHIBIT+0xc>
  f4:	00746978 	rsbseq	r6, r4, r8, ror r9
  f8:	76657270 			; <UNDEFINED> instruction: 0x76657270
  fc:	6165685f 	cmnvs	r5, pc, asr r8
 100:	6e655f70 	mcrvs	15, 3, r5, cr5, cr0, {3}
 104:	6f6c0064 	svcvs	0x006c0064
 108:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
 10c:	20676e6f 	rsbcs	r6, r7, pc, ror #28
 110:	00746e69 	rsbseq	r6, r4, r9, ror #28
 114:	695f7473 	ldmdbvs	pc, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 118:	77006f6e 	strvc	r6, [r0, -lr, ror #30]
 11c:	00746961 	rsbseq	r6, r4, r1, ror #18
 120:	5f736d74 	svcpl	0x00736d74
 124:	6d697473 	cfstrdvs	mvd7, [r9, #-460]!	; 0xfffffe34
 128:	6c5f0065 	mrrcvs	0, 6, r0, pc, cr5	; <UNPREDICTABLE>
 12c:	6b656573 	blvs	1959700 <_stack+0x18d9700>
 130:	65786500 	ldrbvs	r6, [r8, #-1280]!	; 0x500
 134:	00657663 	rsbeq	r7, r5, r3, ror #12
 138:	6274756f 	rsbsvs	r7, r4, #465567744	; 0x1bc00000
 13c:	00657479 	rsbeq	r7, r5, r9, ror r4
 140:	6b726f66 	blvs	1c9bee0 <_stack+0x1c1bee0>
 144:	696c6e00 	stmdbvs	ip!, {r9, sl, fp, sp, lr}^
 148:	745f6b6e 	ldrbvc	r6, [pc], #-2926	; 150 <CPSR_IRQ_INHIBIT+0xd0>
 14c:	636e6900 	cmnvs	lr, #0
 150:	6c630072 	stclvs	0, cr0, [r3], #-456	; 0xfffffe38
 154:	5f6b636f 	svcpl	0x006b636f
 158:	73630074 	cmnvc	r3, #116	; 0x74
 15c:	73627574 	cmnvc	r2, #486539264	; 0x1d000000
 160:	5f00632e 	svcpl	0x0000632e
 164:	7665645f 			; <UNDEFINED> instruction: 0x7665645f
 168:	7300745f 	movwvc	r7, #1119	; 0x45f
 16c:	69755f74 	ldmdbvs	r5!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 170:	74730064 	ldrbtvc	r0, [r3], #-100	; 0x64
 174:	6170735f 	cmnvs	r0, pc, asr r3
 178:	00316572 	eorseq	r6, r1, r2, ror r5
 17c:	735f7473 	cmpvc	pc, #1929379840	; 0x73000000
 180:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0x170
 184:	74730032 	ldrbtvc	r0, [r3], #-50	; 0x32
 188:	6170735f 	cmnvs	r0, pc, asr r3
 18c:	00336572 	eorseq	r6, r3, r2, ror r5
 190:	735f7473 	cmpvc	pc, #1929379840	; 0x73000000
 194:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0x170
 198:	6e650034 	mcrvs	0, 3, r0, cr5, cr4, {1}
 19c:	6f726976 	svcvs	0x00726976
 1a0:	635f006e 	cmpvs	pc, #110	; 0x6e
 1a4:	65736f6c 	ldrbvs	r6, [r3, #-3948]!	; 0xf6c
 1a8:	6d616e00 	stclvs	14, cr6, [r1, #-0]
 1ac:	68730065 	ldmdavs	r3!, {r0, r2, r5, r6}^
 1b0:	2074726f 	rsbscs	r7, r4, pc, ror #4
 1b4:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 1b8:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
 1bc:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
 1c0:	73695f00 	cmnvc	r9, #0
 1c4:	79747461 	ldmdbvc	r4!, {r0, r5, r6, sl, ip, sp, lr}^
 1c8:	5f747300 	svcpl	0x00747300
 1cc:	6d697461 	cfstrdvs	mvd7, [r9, #-388]!	; 0xfffffe7c
 1d0:	72650065 	rsbvc	r0, r5, #101	; 0x65
 1d4:	006f6e72 	rsbeq	r6, pc, r2, ror lr	; <UNPREDICTABLE>
 1d8:	735f7473 	cmpvc	pc, #1929379840	; 0x73000000
 1dc:	00657a69 	rsbeq	r7, r5, r9, ror #20
 1e0:	6972775f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
 1e4:	73006574 	movwvc	r6, #1396	; 0x574
 1e8:	6f6d5f74 	svcvs	0x006d5f74
 1ec:	75006564 	strvc	r6, [r0, #-1380]	; 0x564
 1f0:	6e696c6e 	cdpvs	12, 6, cr6, cr9, cr14, {3}
 1f4:	6973006b 	ldmdbvs	r3!, {r0, r1, r3, r5, r6}^
 1f8:	7974657a 	ldmdbvc	r4!, {r1, r3, r4, r5, r6, r8, sl, sp, lr}^
 1fc:	6f006570 	svcvs	0x00006570
 200:	006e6570 	rsbeq	r6, lr, r0, ror r5
 204:	6f646f74 	svcvs	0x00646f74
 208:	73665f00 	cmnvc	r6, #0
 20c:	00746174 	rsbseq	r6, r4, r4, ror r1
 210:	66666f5f 	uqsaxvs	r6, r6, pc	; <UNPREDICTABLE>
 214:	7400745f 	strvc	r7, [r0], #-1119	; 0x45f
 218:	5f656d69 	svcpl	0x00656d69
 21c:	725f0074 	subsvc	r0, pc, #116	; 0x74
 220:	00646165 	rsbeq	r6, r4, r5, ror #2
 224:	6e5f7473 	mrcvs	4, 2, r7, cr15, cr3, {3}
 228:	6b6e696c 	blvs	1b9a7e0 <_stack+0x1b1a7e0>
 22c:	736e7500 	cmnvc	lr, #0
 230:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
 234:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
 238:	73007261 	movwvc	r7, #609	; 0x261
 23c:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xf68
 240:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
 244:	6c696600 	stclvs	6, cr6, [r9], #-0
 248:	74730065 	ldrbtvc	r0, [r3], #-101	; 0x65
 24c:	6b6c625f 	blvs	1b18bd0 <_stack+0x1a98bd0>
 250:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0x973
 254:	736d7400 	cmnvc	sp, #0
 258:	6974755f 	ldmdbvs	r4!, {r0, r1, r2, r3, r4, r6, r8, sl, ip, sp, lr}^
 25c:	7300656d 	movwvc	r6, #1389	; 0x56d
 260:	74635f74 	strbtvc	r5, [r3], #-3956	; 0xf74
 264:	00656d69 	rsbeq	r6, r5, r9, ror #26
 268:	64646163 	strbtvs	r6, [r4], #-355	; 0x163
 26c:	00745f72 	rsbseq	r5, r4, r2, ror pc
 270:	725f7473 	subsvc	r7, pc, #1929379840	; 0x73000000
 274:	00766564 	rsbseq	r6, r6, r4, ror #10
 278:	70746567 	rsbsvc	r6, r4, r7, ror #10
 27c:	5f006469 	svcpl	0x00006469
 280:	6469755f 	strbtvs	r7, [r9], #-1375	; 0x55f
 284:	7300745f 	movwvc	r7, #1119	; 0x45f
 288:	69675f74 	stmdbvs	r7!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 28c:	6d740064 	ldclvs	0, cr0, [r4, #-400]!	; 0xfffffe70
 290:	73635f73 	cmnvc	r3, #460	; 0x1cc
 294:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 298:	61747300 	cmnvs	r4, r0, lsl #6
 29c:	00737574 	rsbseq	r7, r3, r4, ror r5
 2a0:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xf6d
 2a4:	7300745f 	movwvc	r7, #1119	; 0x45f
 2a8:	65645f74 	strbvs	r5, [r4, #-3956]!	; 0xf74
 2ac:	6c660076 	stclvs	0, cr0, [r6], #-472	; 0xfffffe28
 2b0:	00736761 	rsbseq	r6, r3, r1, ror #14
 2b4:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 2b8:	72610073 	rsbvc	r0, r1, #115	; 0x73
 2bc:	73007667 	movwvc	r7, #1639	; 0x667
 2c0:	746d5f74 	strbtvc	r5, [sp], #-3956	; 0xf74
 2c4:	00656d69 	rsbeq	r6, r5, r9, ror #26
 2c8:	7262735f 	rsbvc	r7, r2, #2080374785	; 0x7c000001
 2cc:	6e69006b 	cdpvs	0, 6, cr0, cr9, cr11, {3}
 2d0:	00745f6f 	rsbseq	r5, r4, pc, ror #30
 2d4:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 2d8:	53460033 	movtpl	r0, #24627	; 0x6033
 2dc:	00344c45 	eorseq	r4, r4, r5, asr #24
 2e0:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 2e4:	454c0035 	strbmi	r0, [ip, #-53]	; 0x35
 2e8:	4c00304e 	stcmi	0, cr3, [r0], {78}	; 0x4e
 2ec:	00314e45 	eorseq	r4, r1, r5, asr #28
 2f0:	4e454641 	cdpmi	6, 4, cr4, cr5, cr1, {2}
 2f4:	46410031 			; <UNDEFINED> instruction: 0x46410031
 2f8:	00304e45 	eorseq	r4, r0, r5, asr #28
 2fc:	6f697067 	svcvs	0x00697067
 300:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 304:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 13c <CPSR_IRQ_INHIBIT+0xbc>
 308:	5f72656c 	svcpl	0x0072656c
 30c:	52410074 	subpl	r0, r1, #116	; 0x74
 310:	00304e45 	eorseq	r4, r0, r5, asr #28
 314:	304e4548 	subcc	r4, lr, r8, asr #10
 318:	4e454800 	cdpmi	8, 4, cr4, cr5, cr0, {0}
 31c:	65520031 	ldrbvs	r0, [r2, #-49]	; 0x31
 320:	76726573 			; <UNDEFINED> instruction: 0x76726573
 324:	00316465 	eorseq	r6, r1, r5, ror #8
 328:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0x552
 32c:	64657672 	strbtvs	r7, [r5], #-1650	; 0x672
 330:	454c0032 	strbmi	r0, [ip, #-50]	; 0x32
 334:	4c003056 	stcmi	0, cr3, [r0], {86}	; 0x56
 338:	00315645 	eorseq	r5, r1, r5, asr #12
 33c:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0x552
 340:	64657672 	strbtvs	r7, [r5], #-1650	; 0x672
 344:	55500039 	ldrbpl	r0, [r0, #-57]	; 0x39
 348:	4b4c4344 	blmi	1311060 <_stack+0x1291060>
 34c:	69750031 	ldmdbvs	r5!, {r0, r4, r5}^
 350:	3233746e 	eorscc	r7, r3, #1845493760	; 0x6e000000
 354:	5200745f 	andpl	r7, r0, #1593835520	; 0x5f000000
 358:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 35c:	31646576 	smccc	18006	; 0x4656
 360:	65520030 	ldrbvs	r0, [r2, #-48]	; 0x30
 364:	76726573 			; <UNDEFINED> instruction: 0x76726573
 368:	31316465 	teqcc	r1, r5, ror #8
 36c:	73655200 	cmnvc	r5, #0
 370:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0x265
 374:	00323164 	eorseq	r3, r2, r4, ror #2
 378:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0x552
 37c:	64657672 	strbtvs	r7, [r5], #-1650	; 0x672
 380:	52003331 	andpl	r3, r0, #-1006632960	; 0xc4000000
 384:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 388:	31646576 	smccc	18006	; 0x4656
 38c:	65670034 	strbvs	r0, [r7, #-52]!	; 0x34
 390:	49504774 	ldmdbmi	r0, {r2, r4, r5, r6, r8, r9, sl, lr}^
 394:	6e6f434f 	cdpvs	3, 6, cr4, cr15, cr15, {2}
 398:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 1d0 <CPSR_IRQ_INHIBIT+0x150>
 39c:	0072656c 	rsbseq	r6, r2, ip, ror #10
 3a0:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0x552
 3a4:	64657672 	strbtvs	r7, [r5], #-1650	; 0x672
 3a8:	69750030 	ldmdbvs	r5!, {r4, r5}^
 3ac:	5f38746e 	svcpl	0x0038746e
 3b0:	65520074 	ldrbvs	r0, [r2, #-116]	; 0x74
 3b4:	76726573 			; <UNDEFINED> instruction: 0x76726573
 3b8:	00336465 	eorseq	r6, r3, r5, ror #8
 3bc:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0x552
 3c0:	64657672 	strbtvs	r7, [r5], #-1650	; 0x672
 3c4:	65520034 	ldrbvs	r0, [r2, #-52]	; 0x34
 3c8:	76726573 			; <UNDEFINED> instruction: 0x76726573
 3cc:	00356465 	eorseq	r6, r5, r5, ror #8
 3d0:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0x552
 3d4:	64657672 	strbtvs	r7, [r5], #-1650	; 0x672
 3d8:	65520036 	ldrbvs	r0, [r2, #-54]	; 0x36
 3dc:	76726573 			; <UNDEFINED> instruction: 0x76726573
 3e0:	00376465 	eorseq	r6, r7, r5, ror #8
 3e4:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0x552
 3e8:	64657672 	strbtvs	r7, [r5], #-1650	; 0x672
 3ec:	4c430038 	mcrrmi	0, 3, r0, r3, cr8
 3f0:	43003052 	movwmi	r3, #82	; 0x52
 3f4:	0031524c 	eorseq	r5, r1, ip, asr #4
 3f8:	30544553 	subscc	r4, r4, r3, asr r5
 3fc:	54455300 	strbpl	r5, [r5], #-768	; 0x300
 400:	70670031 	rsbvc	r0, r7, r1, lsr r0
 404:	6f436f69 	svcvs	0x00436f69
 408:	6f72746e 	svcvs	0x0072746e
 40c:	72656c6c 	rsbvc	r6, r5, #27648	; 0x6c00
 410:	53444500 	movtpl	r4, #17664	; 0x4500
 414:	44450030 	strbmi	r0, [r5], #-48	; 0x30
 418:	67003153 	smlsdvs	r0, r3, r1, r3
 41c:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
 420:	65540063 	ldrbvs	r0, [r4, #-99]	; 0x63
 424:	41007473 	tstmi	r0, r3, ror r4
 428:	314e4552 	cmpcc	lr, r2, asr r5
 42c:	44555000 	ldrbmi	r5, [r5], #-0
 430:	304b4c43 	subcc	r4, fp, r3, asr #24
 434:	45534600 	ldrbmi	r4, [r3, #-1536]	; 0x600
 438:	4600304c 	strmi	r3, [r0], -ip, asr #32
 43c:	314c4553 	cmpcc	ip, r3, asr r5
 440:	45534600 	ldrbmi	r4, [r3, #-1536]	; 0x600
 444:	6d00324c 	sfmvs	f3, 4, [r0, #-304]	; 0xfffffed0
 448:	2e6e6961 	cdpcs	9, 6, cr6, cr14, cr1, {3}
 44c:	74610063 	strbtvc	r0, [r1], #-99	; 0x63
 450:	00736761 	rsbseq	r6, r3, r1, ror #14
 454:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 458:	6d5f6c65 	ldclvs	12, cr6, [pc, #-404]	; 2cc <CPSR_IRQ_INHIBIT+0x24c>
 45c:	006e6961 	rsbeq	r6, lr, r1, ror #18

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000004 	andeq	r0, r0, r4
   8:	007d0002 	rsbseq	r0, sp, r2
   c:	00000004 	andeq	r0, r0, r4
  10:	00000008 	andeq	r0, r0, r8
  14:	087d0002 	ldmdaeq	sp!, {r1}^
  18:	00000008 	andeq	r0, r0, r8
  1c:	00000070 	andeq	r0, r0, r0, ror r0
  20:	047b0002 	ldrbteq	r0, [fp], #-2
	...
  30:	00000004 	andeq	r0, r0, r4
  34:	007d0002 	rsbseq	r0, sp, r2
  38:	00000004 	andeq	r0, r0, r4
  3c:	00000008 	andeq	r0, r0, r8
  40:	047d0002 	ldrbteq	r0, [sp], #-2
  44:	00000008 	andeq	r0, r0, r8
  48:	00000014 	andeq	r0, r0, r4, lsl r0
  4c:	047b0002 	ldrbteq	r0, [fp], #-2
	...
  58:	00000014 	andeq	r0, r0, r4, lsl r0
  5c:	00000018 	andeq	r0, r0, r8, lsl r0
  60:	007d0002 	rsbseq	r0, sp, r2
  64:	00000018 	andeq	r0, r0, r8, lsl r0
  68:	0000001c 	andeq	r0, r0, ip, lsl r0
  6c:	047d0002 	ldrbteq	r0, [sp], #-2
  70:	0000001c 	andeq	r0, r0, ip, lsl r0
  74:	00000038 	andeq	r0, r0, r8, lsr r0
  78:	047b0002 	ldrbteq	r0, [fp], #-2
	...
  84:	00000038 	andeq	r0, r0, r8, lsr r0
  88:	0000003c 	andeq	r0, r0, ip, lsr r0
  8c:	007d0002 	rsbseq	r0, sp, r2
  90:	0000003c 	andeq	r0, r0, ip, lsr r0
  94:	00000040 	andeq	r0, r0, r0, asr #32
  98:	047d0002 	ldrbteq	r0, [sp], #-2
  9c:	00000040 	andeq	r0, r0, r0, asr #32
  a0:	00000074 	andeq	r0, r0, r4, ror r0
  a4:	047b0002 	ldrbteq	r0, [fp], #-2
	...
  b0:	00000074 	andeq	r0, r0, r4, ror r0
  b4:	00000078 	andeq	r0, r0, r8, ror r0
  b8:	007d0002 	rsbseq	r0, sp, r2
  bc:	00000078 	andeq	r0, r0, r8, ror r0
  c0:	0000007c 	andeq	r0, r0, ip, ror r0
  c4:	047d0002 	ldrbteq	r0, [sp], #-2
  c8:	0000007c 	andeq	r0, r0, ip, ror r0
  cc:	000000a0 	andeq	r0, r0, r0, lsr #1
  d0:	047b0002 	ldrbteq	r0, [fp], #-2
	...
  dc:	000000a0 	andeq	r0, r0, r0, lsr #1
  e0:	000000a4 	andeq	r0, r0, r4, lsr #1
  e4:	007d0002 	rsbseq	r0, sp, r2
  e8:	000000a4 	andeq	r0, r0, r4, lsr #1
  ec:	000000a8 	andeq	r0, r0, r8, lsr #1
  f0:	047d0002 	ldrbteq	r0, [sp], #-2
  f4:	000000a8 	andeq	r0, r0, r8, lsr #1
  f8:	000000d4 	ldrdeq	r0, [r0], -r4
  fc:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 108:	000000d4 	ldrdeq	r0, [r0], -r4
 10c:	000000d8 	ldrdeq	r0, [r0], -r8
 110:	007d0002 	rsbseq	r0, sp, r2
 114:	000000d8 	ldrdeq	r0, [r0], -r8
 118:	000000dc 	ldrdeq	r0, [r0], -ip
 11c:	047d0002 	ldrbteq	r0, [sp], #-2
 120:	000000dc 	ldrdeq	r0, [r0], -ip
 124:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 128:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 134:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 138:	000000f4 	strdeq	r0, [r0], -r4
 13c:	007d0002 	rsbseq	r0, sp, r2
 140:	000000f4 	strdeq	r0, [r0], -r4
 144:	000000f8 	strdeq	r0, [r0], -r8
 148:	047d0002 	ldrbteq	r0, [sp], #-2
 14c:	000000f8 	strdeq	r0, [r0], -r8
 150:	00000114 	andeq	r0, r0, r4, lsl r1
 154:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 160:	00000114 	andeq	r0, r0, r4, lsl r1
 164:	00000118 	andeq	r0, r0, r8, lsl r1
 168:	007d0002 	rsbseq	r0, sp, r2
 16c:	00000118 	andeq	r0, r0, r8, lsl r1
 170:	0000011c 	andeq	r0, r0, ip, lsl r1
 174:	047d0002 	ldrbteq	r0, [sp], #-2
 178:	0000011c 	andeq	r0, r0, ip, lsl r1
 17c:	0000014c 	andeq	r0, r0, ip, asr #2
 180:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 18c:	0000014c 	andeq	r0, r0, ip, asr #2
 190:	00000150 	andeq	r0, r0, r0, asr r1
 194:	007d0002 	rsbseq	r0, sp, r2
 198:	00000150 	andeq	r0, r0, r0, asr r1
 19c:	00000154 	andeq	r0, r0, r4, asr r1
 1a0:	047d0002 	ldrbteq	r0, [sp], #-2
 1a4:	00000154 	andeq	r0, r0, r4, asr r1
 1a8:	00000184 	andeq	r0, r0, r4, lsl #3
 1ac:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 1b8:	00000184 	andeq	r0, r0, r4, lsl #3
 1bc:	00000188 	andeq	r0, r0, r8, lsl #3
 1c0:	007d0002 	rsbseq	r0, sp, r2
 1c4:	00000188 	andeq	r0, r0, r8, lsl #3
 1c8:	0000018c 	andeq	r0, r0, ip, lsl #3
 1cc:	047d0002 	ldrbteq	r0, [sp], #-2
 1d0:	0000018c 	andeq	r0, r0, ip, lsl #3
 1d4:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 1d8:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 1e4:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 1e8:	000001b4 			; <UNDEFINED> instruction: 0x000001b4
 1ec:	007d0002 	rsbseq	r0, sp, r2
 1f0:	000001b4 			; <UNDEFINED> instruction: 0x000001b4
 1f4:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 1f8:	047d0002 	ldrbteq	r0, [sp], #-2
 1fc:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 200:	000001dc 	ldrdeq	r0, [r0], -ip
 204:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 210:	000001dc 	ldrdeq	r0, [r0], -ip
 214:	000001e0 	andeq	r0, r0, r0, ror #3
 218:	007d0002 	rsbseq	r0, sp, r2
 21c:	000001e0 	andeq	r0, r0, r0, ror #3
 220:	000001e4 	andeq	r0, r0, r4, ror #3
 224:	047d0002 	ldrbteq	r0, [sp], #-2
 228:	000001e4 	andeq	r0, r0, r4, ror #3
 22c:	00000208 	andeq	r0, r0, r8, lsl #4
 230:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 23c:	00000208 	andeq	r0, r0, r8, lsl #4
 240:	0000020c 	andeq	r0, r0, ip, lsl #4
 244:	007d0002 	rsbseq	r0, sp, r2
 248:	0000020c 	andeq	r0, r0, ip, lsl #4
 24c:	00000210 	andeq	r0, r0, r0, lsl r2
 250:	047d0002 	ldrbteq	r0, [sp], #-2
 254:	00000210 	andeq	r0, r0, r0, lsl r2
 258:	00000274 	andeq	r0, r0, r4, ror r2
 25c:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 268:	00000274 	andeq	r0, r0, r4, ror r2
 26c:	00000278 	andeq	r0, r0, r8, ror r2
 270:	007d0002 	rsbseq	r0, sp, r2
 274:	00000278 	andeq	r0, r0, r8, ror r2
 278:	0000027c 	andeq	r0, r0, ip, ror r2
 27c:	047d0002 	ldrbteq	r0, [sp], #-2
 280:	0000027c 	andeq	r0, r0, ip, ror r2
 284:	000002a8 	andeq	r0, r0, r8, lsr #5
 288:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 294:	000002a8 	andeq	r0, r0, r8, lsr #5
 298:	000002ac 	andeq	r0, r0, ip, lsr #5
 29c:	007d0002 	rsbseq	r0, sp, r2
 2a0:	000002ac 	andeq	r0, r0, ip, lsr #5
 2a4:	000002b0 			; <UNDEFINED> instruction: 0x000002b0
 2a8:	047d0002 	ldrbteq	r0, [sp], #-2
 2ac:	000002b0 			; <UNDEFINED> instruction: 0x000002b0
 2b0:	000002cc 	andeq	r0, r0, ip, asr #5
 2b4:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 2c0:	000002cc 	andeq	r0, r0, ip, asr #5
 2c4:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 2c8:	007d0002 	rsbseq	r0, sp, r2
 2cc:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 2d0:	000002d4 	ldrdeq	r0, [r0], -r4
 2d4:	047d0002 	ldrbteq	r0, [sp], #-2
 2d8:	000002d4 	ldrdeq	r0, [r0], -r4
 2dc:	00000300 	andeq	r0, r0, r0, lsl #6
 2e0:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 2ec:	00000300 	andeq	r0, r0, r0, lsl #6
 2f0:	00000304 	andeq	r0, r0, r4, lsl #6
 2f4:	007d0002 	rsbseq	r0, sp, r2
 2f8:	00000304 	andeq	r0, r0, r4, lsl #6
 2fc:	00000308 	andeq	r0, r0, r8, lsl #6
 300:	047d0002 	ldrbteq	r0, [sp], #-2
 304:	00000308 	andeq	r0, r0, r8, lsl #6
 308:	00000334 	andeq	r0, r0, r4, lsr r3
 30c:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 318:	00000334 	andeq	r0, r0, r4, lsr r3
 31c:	00000338 	andeq	r0, r0, r8, lsr r3
 320:	007d0002 	rsbseq	r0, sp, r2
 324:	00000338 	andeq	r0, r0, r8, lsr r3
 328:	0000033c 	andeq	r0, r0, ip, lsr r3
 32c:	047d0002 	ldrbteq	r0, [sp], #-2
 330:	0000033c 	andeq	r0, r0, ip, lsr r3
 334:	00000354 	andeq	r0, r0, r4, asr r3
 338:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 344:	00000354 	andeq	r0, r0, r4, asr r3
 348:	00000358 	andeq	r0, r0, r8, asr r3
 34c:	007d0002 	rsbseq	r0, sp, r2
 350:	00000358 	andeq	r0, r0, r8, asr r3
 354:	0000035c 	andeq	r0, r0, ip, asr r3
 358:	087d0002 	ldmdaeq	sp!, {r1}^
 35c:	0000035c 	andeq	r0, r0, ip, asr r3
 360:	000003c0 	andeq	r0, r0, r0, asr #7
 364:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 374:	00000004 	andeq	r0, r0, r4
 378:	007d0002 	rsbseq	r0, sp, r2
 37c:	00000004 	andeq	r0, r0, r4
 380:	00000008 	andeq	r0, r0, r8
 384:	047d0002 	ldrbteq	r0, [sp], #-2
 388:	00000008 	andeq	r0, r0, r8
 38c:	00000024 	andeq	r0, r0, r4, lsr #32
 390:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 3a0:	00000004 	andeq	r0, r0, r4
 3a4:	007d0002 	rsbseq	r0, sp, r2
 3a8:	00000004 	andeq	r0, r0, r4
 3ac:	00000008 	andeq	r0, r0, r8
 3b0:	087d0002 	ldmdaeq	sp!, {r1}^
 3b4:	00000008 	andeq	r0, r0, r8
 3b8:	000000b4 	strheq	r0, [r0], -r4
 3bc:	047b0002 	ldrbteq	r0, [fp], #-2
	...

Disassembly of section .ARM.attributes:

00000000 <_stack-0x80000>:
   0:	00003241 	andeq	r3, r0, r1, asr #4
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000028 	andeq	r0, r0, r8, lsr #32
  10:	4b5a3605 	blmi	168d82c <_stack+0x160d82c>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	0a010901 	beq	42424 <__bss_end__+0x38998>
  1c:	14041202 	strne	r1, [r4], #-514	; 0x202
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end__+0x3c5ac>
  28:	1c031b01 	stcne	11, cr1, [r3], {1}
  2c:	22061e01 	andcs	r1, r6, #16
  30:	Address 0x00000030 is out of bounds.

