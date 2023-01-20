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
parser$add_argument("-m", "--maxzerofreq", type="double", default=0.3,
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
new.fname.stem <- "_zfilt-m"
new.fname.param <- gsub("\\.", "", as.character(args$maxzerofreq))
new.fname <- gsub("\\..*", "", args$readfpath)
new.fname <- paste0(new.fname, "_", new.fname.stem, new.fname.param)
new.fname <- paste0(new.fname, ".rda")
message("saving new file: ", new.fname)
save(scef, file = new.fname)