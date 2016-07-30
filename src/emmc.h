/* RPi2 SD pin connections (each through 33ohm series resistor)
 * 		SD_CLK - GPIO48
 *		SD_CMD - GPIO49
 *		SD_DATA0 - GPIO50
 *		SD_DATA1 - GPIO51
 *		SD_DATA2 - GPIO52
 * 		SD_DATA3 - GPIO53
 *		SD_CARD_DET - GPIO47
 * 	^ All these GPIOs have ALT0: <internal>
 * Thus, it *seems* that we don't have to worry about GPIO
 * setup. We just use the module and go. 
 */

#ifndef RPI_EMMC_H
#define RPI_EMMC_H

#include <stdint.h>
#include "base.h"

// ---- HARDWARE PERIPHERAL ----------------------------------- //
#define EMMC_BASE 		(PERIPH_BASE + 0x300000)

typedef struct {							//offset from base
	volatile uint32_t ARG2;						//0x00
	volatile uint32_t BLKSIZECNT;				//0x04
	volatile uint32_t ARG1;						//0x08
	volatile uint32_t CMDTM;					//0x0C
	volatile uint32_t RESP0;					//0x10
	volatile uint32_t RESP1;					//0x14
	volatile uint32_t RESP2;					//0x18
	volatile uint32_t RESP3;					//0x1C
	volatile uint32_t DATA;						//0x20
	volatile uint32_t STATUS;					//0x24
	volatile uint32_t CONTROL0;					//0x28
	volatile uint32_t CONTROL1;					//0x2C
	volatile uint32_t INTERRUPT;				//0x30
	volatile uint32_t IRPT_MASK;				//0x34
	volatile uint32_t IRPT_EN;					//0x38
	volatile uint32_t CONTROL2;					//0x3C
	volatile uint32_t RESERVED0[(0x50-0x3c)/4 - 1];		//0x40 - 0x4C
	volatile uint32_t FORCE_IRPT;				//0x50
	volatile uint32_t RESERVED1[(0x70 - 0x50)/4 -1];	//0x54 - 0x6C
	volatile uint32_t BOOT_TIMEOUT;				//0x70
	volatile uint32_t DBG_SEL;					//0x74
	volatile uint32_t RESERVED2[(0x80 - 0x74)/4 - 1];	//0x78 - 0x7C
	volatile uint32_t EXRDFIFO_CFG;				//0x80
	volatile uint32_t EXRDFIFO_EN;				//0x84
	volatile uint32_t TUNE_STEP;				//0x88
	volatile uint32_t TUNE_STEPS_STD;			//0x8C
	volatile uint32_t TUNE_STEPS_DDR;			//0x90
	volatile uint32_t RESERVED3[(0xF0 - 0x90)/4 - 1]; 	//0x94 - 0xEC
	volatile uint32_t SPI_INT_SPT;				//0xF0
	volatile uint32_t RESERVED4[(0xFC - 0xF0)/4 - 1]; 	//0xF4 - 0xF8
	volatile uint32_t SLOTISR_VER;				//0xFC
} emmc_t;

extern emmc_t* getEMMCController(void);
extern int     sdSendCommand(unsigned int, unsigned int);

// ---- SD CARD -----------------------------------------------//
#define CMD0 	0
#define CMD2 	1
#define CMD3 	2
#define CMD4 	3
#define CMD6 	4
#define CMD7 	5
#define CMD8 	6
#define CMD9 	7
#define CMD10 	8
#define CMD11 	9
#define CMD12 	10
#define CMD13 	11
#define CMD15 	12
#define CMD16 	13
#define CMD17 	14
#define CMD18 	15
#define CMD19 	16
#define CMD20 	17
#define CMD23 	18
#define CMD24 	19
#define CMD25 	20
#define CMD27 	21
#define CMD28 	22
#define CMD29 	23
#define CMD30 	24
#define CMD32 	25
#define CMD33 	26
#define CMD38 	27
#define CMD42 	28
#define CMD55 	29
#define CMD56 	30
#define ACMD6 	31
#define ACMD13 	32
#define ACMD22 	33
#define ACMD23 	34
#define ACMD41 	35
#define ACMD42 	36
#define ACMD51 	37

#define RCA_NO 	0
#define RCA_YES	1

//See SDA simplified physical spec 3.01 pg. 71
#define RESP_NO 	0 	//no response
#define RESP_R1 	1 	//normal response; 48 bits
#define RESP_R1b 	2 	//R1 + optional busy signal on data line
#define RESP_R2I 	3 	//CID register, 136 bits
#define RESP_R2S 	4 	//CSD register, 136 bits
#define RESP_R3 	5 	//OCR register, 48 bits
#define RESP_R6 	6 	//published RCA response, 48 bits
#define RESP_R7 	7 	//card interface connections, 48 bits	

typedef struct EMMCCommand {
	const char* name;
	unsigned int code;
	unsigned char resp;
	unsigned char rca;
	int delay;
} EMMCCommand;

static EMMCCommand sdCommandTable[] = {
	{ "GO_IDLE_STATE", 0x00000000, RESP_NO , RCA_NO  ,0},
	{ "ALL_SEND_CID" , 0x02000000, RESP_R2I, RCA_NO  ,0},
	{ "SEND_REL_ADDR", 0x03000000, RESP_R6 , RCA_NO  ,0},
	{ "SET_DSR"      , 0x04000000, RESP_NO , RCA_NO  ,0},
	{ "SWITCH_FUNC"  , 0x06000000, RESP_R1 , RCA_NO  ,0},
	{ "CARD_SELECT"  , 0x07000000, RESP_R1b, RCA_YES ,0},
	{ "SEND_IF_COND" , 0x08000000, RESP_R7 , RCA_NO  ,100},
	{ "SEND_CSD"     , 0x09000000, RESP_R2S, RCA_YES ,0},
	{ "SEND_CID"     , 0x0A000000, RESP_R2I, RCA_YES ,0},
	{ "VOLT_SWITCH"  , 0x0B000000, RESP_R1 , RCA_NO  ,0},
	{ "STOP_TRANS"   , 0x0C000000, RESP_R1b, RCA_NO  ,0},
	{ "SEND_STATUS"  , 0x0D000000, RESP_R1 , RCA_YES ,0},
	{ "GO_INACTIVE"  , 0x0F000000, RESP_NO , RCA_YES ,0},
	{ "SET_BLOCKLEN" , 0x10000000, RESP_R1 , RCA_NO  ,0},
	{ "READ_SINGLE"  , 0x11000000, RESP_R1 , RCA_NO  ,0},
	{ "READ_MULTI"   , 0x12000000, RESP_R1 , RCA_NO  ,0},
	{ "SEND_TUNING"  , 0x13000000, RESP_R1 , RCA_NO  ,0},
	{ "SPEED_CLASS"  , 0x14000000, RESP_R1b, RCA_NO  ,0},
	{ "SET_BLOCKCNT" , 0x17000000, RESP_R1 , RCA_NO  ,0},
	{ "WRITE_SINGLE" , 0x18000000, RESP_R1 , RCA_NO  ,0},
	{ "WRITE_MULTI"  , 0x19000000, RESP_R1 , RCA_NO  ,0},
	{ "PROGRAM_CSD"  , 0x1B000000, RESP_R1 , RCA_NO  ,0},
	{ "SET_WRITE_PR" , 0x1C000000, RESP_R1b, RCA_NO  ,0},
	{ "CLR_WRITE_PR" , 0x1D000000, RESP_R1b, RCA_NO  ,0},
	{ "SND_WRITE_PR" , 0x1E000000, RESP_R1 , RCA_NO  ,0},
	{ "ERASE_WR_ST"  , 0x20000000, RESP_R1 , RCA_NO  ,0},
	{ "ERASE_WR_END" , 0x21000000, RESP_R1 , RCA_NO  ,0},
	{ "ERASE"        , 0x26000000, RESP_R1b, RCA_NO  ,0},
	{ "LOCK_UNLOCK"  , 0x2A000000, RESP_R1 , RCA_NO  ,0},
	{ "APP_CMD"      , 0x37000000, RESP_NO , RCA_NO  ,100},
	//{ "APP_CMD"      , 0x37000000, RESP_R1 , RCA_YES ,0},
	{ "GEN_CMD"      , 0x38000000, RESP_R1 , RCA_NO  ,0},

	// APP commands must be prefixed by an APP_CMD.
	{ "SET_BUS_WIDTH", 0x06000000, RESP_R1 , RCA_NO  ,0},
	{ "SD_STATUS"    , 0x0D000000, RESP_R1 , RCA_YES ,0}, // RCA???
	{ "SEND_NUM_WRBL", 0x16000000, RESP_R1 , RCA_NO  ,0},
	{ "SET_WR_BK_ERS", 0x17000000, RESP_R1 , RCA_NO  ,0},
	{ "SD_SENDOPCOND", 0x29000000, RESP_R3 , RCA_NO  ,1000},
	{ "SET_CLR_DET"  , 0x2A000000, RESP_R1 , RCA_NO  ,0},
	{ "SEND_SCR"     , 0x33000000, RESP_R1 , RCA_NO  ,0},
};

#endif