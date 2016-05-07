@ECHO off
SETLOCAL
CD src
IF EXIST targets.txt (
	DEL targets.txt
)
IF EXIST headers.txt (
	DEL headers.txt
)
FOR %%i in (*.*) do (
	IF "%%~xi"==".c" (
		<nul SET /p ="%%i ">>targets.txt
	)
	IF "%%~xi"==".S" (
		<nul SET /p ="%%i ">>targets.txt
	)
	IF "%%~xi"==".h" (
		<nul SET /p ="%%i ">>headers.txt
	)
)
::Read file to variable
SET makeTargets=
FOR /f "delims== tokens=1,2" %%x in (targets.txt) do (
	SET makeTargets=%%x
)
SET makeHeaders=
FOR /f "delims== tokens=1,2" %%x in (headers.txt) do (
	SET makeHeaders=%%x
)
DEL targets.txt
DEL headers.txt
SET rpi0=-mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -std=c99 -nostartfiles -g -Wl,-T,rpi.x
::Commands for outputting to log file
::ECHO Starting build using rm-none-eabi-gcc -O0 %rpi0% %makeTargets%-o ../bin/kernel.elf>../build.log
::arm-none-eabi-gcc -O0 %rpi0% %makeTargets%-o ../bin/kernel.elf 2>>../build.log
::arm-none-eabi-objcopy.exe ../bin/kernel.elf -O binary ../bin/kernel.img 2>>../build.log
::arm-none-eabi-objdump -D ../bin/kernel.elf > ../debug/kernel.asm 2>>../build.log
::arm-none-eabi-nm ../bin/kernel.elf > ../debug/kernel.nm 2>>../build.log
::ECHO Done.>>../build.log
::Commands for outputting to stdout for a build system
ECHO Building:   %makeTargets%
ECHO Headers:    %makeHeaders%
arm-none-eabi-gcc -O0 -Wall %rpi0% %makeTargets%-o ../bin/kernel.elf 
arm-none-eabi-objcopy.exe ../bin/kernel.elf -O binary ../bin/kernel.img 
arm-none-eabi-objdump -D ../bin/kernel.elf > ../debug/kernel.asm 
arm-none-eabi-nm ../bin/kernel.elf > ../debug/kernel.nm 
arm-none-eabi-objdump -S ../bin/kernel.elf > ../debug/kernel.disasm
ECHO Done.
IF EXIST E:\ (
	COPY "%~dp0\bin\kernel.img" E:\ >NUL
)
ENDLOCAL