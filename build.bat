c:\swigwin-3.0.5\swig -r example.i
gcc -shared example_wrap.c example.c -I"C:\Program Files\R\R-3.1.3\include" -L"C:\Program Files\R\R-3.1.3\bin\x64" -lR -o example.dll
"C:\Program Files\R\R-3.1.3\bin\x64\R.exe" -f runme.R