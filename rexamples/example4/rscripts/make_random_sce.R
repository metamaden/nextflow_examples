#!/usr/bin/env Rscript

# Author: Sean Maden
#
# Make a randomly-generated SingleCellExperiment object
#

require(lute)

# manage parser
suppressPackageStartupMessages(library("argparse"))
parser <- ArgumentParser() # create parser object
parser$add_argument("-w", "--writefname", type="character", default=TRUE,
                    help = paste0("Filename stem, without extension, for new ",
                                  "rda object to write"))
parser$add_argument("-fz", "--zerofreq", type="integer", default=0.3,
                    help="Frequency of zero-value data to add.")
args <- parser$parse_args()

# run script
sce <- random_sce(zero.include = T, zero.fract = args.zerofreq)

# save data
new.fname <- paste0(args$writefname, "_fz-", args$zerofreq)
new.fname <- paste0(new.fname, ".rda")
save(sce, file = new.fname)