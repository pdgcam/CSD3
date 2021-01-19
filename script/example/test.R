
rm(list = ls());

nm_main_folder = ""; # revise the working directory to the HPC folder saving R and Slurm scripts

setwd( nm_main_folder );

getwd();

args <- c(1,2)
if (length(args) == 0) {
  stop("Need arguments!")
}

stime <- proc.time()
x <- rnorm(1000)
pdf(paste0("plot", args[1], ".pdf"))
print(plot(x))
dev.off()

etime <- proc.time()
tm <- etime - stime

print("Time spent:")