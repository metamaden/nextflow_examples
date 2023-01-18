#!/usr/bin/env Rscript

# manage parser
suppressPackageStartupMessages(library("argparse"))
parser <- ArgumentParser() # create parser object
parser$add_argument("-r", "--readfilename", type="character", default=TRUE,
    help="Name of file to read")
parser$add_argument("-m", "--multiplyvalue", type="integer", default=TRUE,
    help="Value by which to multiply the file which was read.")
args <- parser$parse_args()

# run script
res.old <- get(load(args$readfilename))
res.new <- as.numeric(res.old) * as.numeric(args$multiplyvalue)
save(res.new, file = "newproduct.rda")