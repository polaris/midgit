nasm.exe -fwin32 tiny.asm
:link.exe tiny.obj /subsystem:console /entry:main /out:tiny.exe kernel32.lib user32.lib winmm.lib gdi32.lib
crinkler tiny.obj /subsystem:console /entry:main /compmode:slow /out:tiny.exe kernel32.lib user32.lib winmm.lib gdi32.lib