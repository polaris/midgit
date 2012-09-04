:nasm.exe -fwin32 tiny.asm
:link.exe tiny.obj /subsystem:console /entry:main /out:tiny.exe kernel32.lib user32.lib winmm.lib gdi32.lib
:crinkler tiny.obj /subsystem:console /entry:main /compmode:slow /out:tiny.exe kernel32.lib user32.lib winmm.lib gdi32.lib

del tiny_ogl.obj
del tiny_ogl.exe
nasm.exe -fwin32 tiny_ogl.asm
:link tiny_ogl.obj /subsystem:console /out:tiny_ogl.exe /entry:main opengl32.lib kernel32.lib user32.lib gdi32.lib
crinkler tiny_ogl.obj /subsystem:console /entry:main /compmode:slow /PRIORITY:NORMAL /HASHTRIES:300 /ORDERTRIES:4000 /out:tiny_ogl.exe opengl32.lib kernel32.lib user32.lib gdi32.lib