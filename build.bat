@echo off

wla-65816 -o src\Main.asm obj\Main.obj
wlalink -vr Mandelbrot.prj bin\Mandelbrot.fig
