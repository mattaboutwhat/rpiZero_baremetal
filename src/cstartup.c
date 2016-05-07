// cstartup.c
//
// Since we do not plan on using the normal c std startup,
// we need to make our own. Here, we will clear the _bss
// section (which holds varaibles to be initialized to zero)
// and call the main function.
//
// start.s, which is linked before this, has set up the stack
// pointer and the function _get_stack_pointer.

extern int __bss_start__;
extern int __bss_end__;

extern void kernel_main(unsigned int r0, unsigned int r1, unsigned int atags);

void _cstartup(unsigned int r0, unsigned int r1, unsigned int r2)
{
	int* bss = &__bss_start__;
	int* bss_end = &__bss_end__;

	// Clear the _bss section
	while (bss < bss_end)
		*bss++ = 0;

	// Call main function (should never return)
	kernel_main(r0, r1, r2);

	//Trap here if we mistakenly do!
	while(1)
		;

	// Also, as called by start.S, there is an infinite loop
	// right after this function exits.
}