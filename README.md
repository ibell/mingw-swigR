Compiling an R extensions for windows using MinGW
=================================================

Pre-requisites:

* MinGW GCC
* swig

N.B., you'll have to change the paths, everything is hardcoded here

N.B., it seems that by default MINGW on windows builds a 64-bit shared library, so no additional flag is needed to get 64-bit compilation, but if you wanted 32-bit compilation, you would add ``-m32`` to the ``gcc`` call

Basically its a two-line to build:

```
c:\swigwin-3.0.5\swig -r example.i
gcc -shared example_wrap.c example.c -I"C:\Program Files\R\R-3.1.3\include" -L"C:\Program Files\R\R-3.1.3\bin\x64" -lR -o example.dll
```
And to run:
```
"C:\Program Files\R\R-3.1.3\bin\x64\R.exe" -f runme.R
```
which yields for me 
```

R version 3.1.3 (2015-03-09) -- "Smooth Sidewalk"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> # file: runme.R
>
> dyn.load(paste("example", .Platform$dynlib.ext, sep=""))
> source("example.R")
Creating a generic function for 'print' from package 'base' in the global environment
> cacheMetaData(1)
>
> # Call our fact() function
>
> g <- fact(4)
> sprintf("The factorial %d is %d", 4, g)
[1] "The factorial 4 is 24"
>
>
```
