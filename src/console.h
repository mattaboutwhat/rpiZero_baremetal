#ifndef RPI_CONSOLE_H
#define RPI_CONSOLE_H

#define CONS_RED  "\033[1;93;41m"
#define CONS_RST  "\033[0m"
#define CONS_CLR  "\033[2J"
#define CONS_HOME "\033[H"

void debug_print(void);

#endif