/* linux/include/asm-arm/arch-rpc/debug-macro.S
 *
 * Debugging macro include header
 *
 *  Copyright (C) 1994-1999 Russell King
 *  Moved from linux/arch/arm/kernel/debug.S by Ben Dooks
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
*/

		.macro	addruart,rx
		mov	\rx, #0xe0000000
		orr	\rx, \rx, #0x00010000
		orr	\rx, \rx, #0x00000fe0
		.endm

		.macro	senduart,rd,rx
		strb	\rd, [\rx]
		.endm

		.macro	busyuart,rd,rx
1001:		ldrb	\rd, [\rx, #0x14]
		and	\rd, \rd, #0x60
		teq	\rd, #0x60
		bne	1001b
		.endm

		.macro	waituart,rd,rx
1001:		ldrb	\rd, [\rx, #0x18]
		tst	\rd, #0x10
		beq	1001b
		.endm
