#!/usr/bin/env Rscript

# manage parser
suppressPackageStartupMessages(library("argparse"))
parser <- ArgumentParser() # create parser object
parser$add_argument("-o", "--objvalue", type="character", default=TRUE,
    help="filename to save")
args <- parser$parse_args()

# run script
obj <- args$objvalue
save(obj, file = "se_myobj1.rda")