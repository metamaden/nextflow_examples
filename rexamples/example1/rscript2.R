#!/usr/bin/env Rscript

# manage parser
suppressPackageStartupMessages(library("argparse"))
parser <- ArgumentParser() # create parser object
parser$add_argument("-r", "--fnread", type="character", default=TRUE,
    help="filename to read")
parser$add_argument("-o", "--objvalue", type="character", default=TRUE,
    help="filename to save")
args <- parser$parse_args()

# run script
obj <- get(load(as.character(args$fnread)))
obj <- paste0(obj, args$objvalue)
save(obj, file = "se_myobj2.rda")