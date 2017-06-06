@echo off

set CONFIG=/Od /D_DEBUG /D_DEVELOPMENT
::set CONFIG=/Ox /DNDEBUG /GL /D_DEVELOPMENT

set CC=.\compilers\cl.exe
set ASM=.\compilers\ml64.exe
set DXC=.\compilers\fxc.exe

if exist *.exe del *.exe
if exist *.pdb del *.pdb
if exist *.obj del *.obj

%ASM% /c /nologo /Fo asm.obj eneida.asm

%CC% /Zi %CONFIG% /MP /Gm- /nologo /WX /W4 /wd4201 /wd4152 /wd4204 /GS- /Gs999999 /Gy /Gw /EHa- eneida.cpp ^
    /link asm.obj .\compilers\kernel32.lib ^
    /OPT:REF /WX /INCREMENTAL:NO /SUBSYSTEM:WINDOWS /ENTRY:Start /NODEFAULTLIB /OUT:eneida.exe

::%DXC% /nologo /T vs_5_1 /E vs_main /Fo vs.cso eneida.hlsl
::%DXC% /nologo /T ps_5_1 /E ps_main /Fo ps.cso eneida.hlsl

if exist vc140.pdb del vc140.pdb
if exist *.obj del *.obj
