#!/usr/bin/env Rscript

# manage parser
suppressPackageStartupMessages(library("argparse"))
parser <- ArgumentParser() # create parser object
parser$add_argument("-valueone", "--firstvalue", type="integer", default=TRUE,
    help="First value to add")
parser$add_argument("-valuetwo", "--secondvalue", type="integer", default=TRUE,
    help="Second value to add")
args <- parser$parse_args()

# run script
res <- as.numeric(args$firstvalue)
res <- res + as.numeric(args$secondvalue)
new.fname <- paste0("value-",res,"_newsum.rda")
save(res, file = new.fname)