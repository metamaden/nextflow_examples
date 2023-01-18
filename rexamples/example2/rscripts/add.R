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
res <- args$valueone + args$valuetwo
save(res, file = "newsum.rda")