@echo off
SET Working_Directory=C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix\
SET STL_Directory=C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix\STLS\
cd C:\Program Files (x86)\OpenSCAD\
set  tot_stls=21


@echo off
@setlocal 

set start=%time%


SET /a i=1
set tot_stl_count=%tot_stls%
echo parts to build= %tot_stls%
set /a tot_stls=%tot_stls%+1
:loop
IF %i%==%tot_stls% GOTO END
set /a part_num =i
set part_no="part=%part_num%"
echo %part_no%
echo "of %tot_stl_count%"
openscad.com -o junk.stl "%Working_Directory%STLs_To_Export.scad" -D %part_no% >"%Working_Directory%temp.txt"
set /p str=< "%Working_Directory%temp.txt"
set "var1=%str:*:=%"
set "var1=%var1:*:=%"
set var1=%var1:~0,-1% 
echo %var1%
openscad.com -o %STL_Directory%%var1% -D %part_no% -D build=true "%Working_Directory%STLs_To_Export.scad"
SET /a i=%i%+1
GOTO LOOP
:end

echo cd c:\
echo cd "%Working_Directory%"


cmd /c %*

cd C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix

set end=%time%
set options="tokens=1-4 delims=:."
for /f %options% %%a in ("%start%") do set start_h=%%a&set /a start_m=100%%b %% 100&set /a start_s=100%%c %% 100&set /a start_ms=100%%d %% 100
for /f %options% %%a in ("%end%") do set end_h=%%a&set /a end_m=100%%b %% 100&set /a end_s=100%%c %% 100&set /a end_ms=100%%d %% 100

set /a hours=%end_h%-%start_h%
set /a mins=%end_m%-%start_m%
set /a secs=%end_s%-%start_s%
set /a ms=%end_ms%-%start_ms%
if %hours% lss 0 set /a hours = 24%hours%
if %mins% lss 0 set /a hours = %hours% - 1 & set /a mins = 60%mins%
if %secs% lss 0 set /a mins = %mins% - 1 & set /a secs = 60%secs%
if %ms% lss 0 set /a secs = %secs% - 1 & set /a ms = 100%ms%
if 1%ms% lss 100 set ms=0%ms%

:: mission accomplished
set /a totalsecs = %hours%*3600 + %mins%*60 + %secs% 
echo command took %hours%:%mins%:%secs%.%ms% (%totalsecs%.%ms%s total)
