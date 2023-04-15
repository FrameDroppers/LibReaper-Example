@echo off

echo +----------------------------------------+
echo +   vasm auto-compile script by W3SLAV   +
echo +----------------------------------------+

::set BuildFile=%1
::echo File: %BuildFile% 

vasmarm_std_win32.exe main.asm -m7tdmi -noialign  -chklabels -nocase -Dvasm=1 -DBuildNDS=1 -Fbin -o "program.NDS"
if not "%errorlevel%"=="0" goto Abandon

goto Abandon
:InvalidPath
echo Error: ASM file must be on same drive as devtools 
::echo File: %BuildPath%\%BuildFile% 
echo Devtools Drive: %CD:~0,1% 
goto Abandon
:Abandon
if "%3"=="nopause" exit
pause