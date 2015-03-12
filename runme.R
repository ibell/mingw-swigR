# file: runme.R

dyn.load(paste("example", .Platform$dynlib.ext, sep=""))
source("example.R")
cacheMetaData(1)

# Call our fact() function

g <- fact(4)
sprintf("The factorial %d is %d", 4, g)

