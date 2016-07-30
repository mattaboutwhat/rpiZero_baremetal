#include "console.h"
#include "rpi-aux.h"

static unsigned char index[16] = {	'0', '1', '2', '3', 
									'4', '5', '6', '7',
									'8', '9', 'A', 'B', 
									'C', 'D', 'E', 'F'};

void debug_print(void)
{
	//get some info
	unsigned int cpsr_reg;
	__asm ("mrs %[cpsr_reg], CPSR" : [cpsr_reg] "=r" (cpsr_reg));

	//convert it
	//char mode_char[9];
	//for (int i=7; i>=0; i--){
	//	mode_char[7-i] = index[((cpsr_reg >> (i*4)) & (0xF))];
	//}
	//mode_char[8] = 0;
	unsigned int cpsr_mode = cpsr_reg & 0x1F;

	//char mode_bit[33];
	//for (int i=31; i>=0; i--){
	//	mode_bit[31-i] = index[ (cpsr_reg >> i) & (0x1) ];
	//}
	//mode_bit[32] = 0;

	char cpsr_mode_ascii[6];
	cpsr_mode_ascii[5] = 0;
	for (int i=4; i>=0; i--){
		cpsr_mode_ascii[4-i] = index[ (cpsr_reg >> i) & (0x1) ];
	}
	

	//print it
	printu("Mode: ");
	printu(CONS_RED);

	switch (cpsr_mode) {
		case 0b10000:
			printu("User");
			break;
		case 0b10001:
			printu("FIQ");
			break;
		case 0b10010:
			printu("IRQ");
			break;
		case 0b10011:
			printu("Supervisor");
			break;
		case 0b10111:
			printu("Abort");
			break;
		case 0b11011:
			printu("Undefined");
			break;
		case 0b11111:
			printu("System");
			break;
	}

	printu(CONS_RST);
	printu(" (");
	printu(cpsr_mode_ascii);
	printu(")\n");
	printu(CONS_HOME);
}