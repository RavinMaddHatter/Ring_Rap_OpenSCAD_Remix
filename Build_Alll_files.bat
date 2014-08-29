@echo off

cd C:\Program Files (x86)\OpenSCAD\
set  tot_stls=15
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
openscad.com -o junk.stl C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix\STLs_To_Export.scad -D %part_no% >C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix\temp.txt
set /p str=< C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix\temp.txt
echo %str%
set "var1=%str:*:=%"
set "var1=%var1:*:=%"
set var1=%var1:~0,-1% 
echo %var1%
openscad.com -o C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix\STLS\%var1% -D %part_no% -D build=true C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix\STLs_To_Export.scad
SET /a i=%i%+1
GOTO LOOP

:end

cd C:\Users\camer_000\Documents\GitHub\Ring_Rap_OpenSCAD_Remix\