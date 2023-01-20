#!/usr/bin/env Rscript

# Author: Sean Maden
#
# Command line-callable script to filter cells on values.
#

require(lute)

# manage parser
suppressPackageStartupMessages(library("argparse"))
parser <- ArgumentParser() # create parser object
parser$add_argument("-r", "--readfpath", type="character", default=TRUE,
                    help = paste0("Path to SingleCellExperiment object to read."))
parser$add_argument("-mzf", "--maxzerofreq", type="integer", default=0.3,
                    help="Maximum allowed frequency of zero-value genes.")
args <- parser$parse_args()

#------------
# main script
#------------
# load sce
sce <- get(load(args$readfpath))
# filter sce
scef <- filter_value_cells(sce, filter.term = "zerocount", verbose = T,
                           max.value.freq = args$maxzerofreq)
# save filtered data
new.fname <- paste0(args$readfpath, "_zfilt-mzf-", args$zerofreq)
new.fname <- paste0(new.fname, ".rda")
save(scef, file = new.fname)