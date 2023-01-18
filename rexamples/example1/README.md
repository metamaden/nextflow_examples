# example1

## Description

This example workflow defines two processes, `process1` and `process2`, each of which calls a corresponding 
script `rscript1.R` or `rscript2.R`. Each script defines a simple object as a character string, then saves the
object using a pre-determined filename, e.g. either `se_myobj1.rda` for the first output, and `se_myobj2.rda` for
the second output. The second process reads in the file saved from the first process, modifies it, then saves it
to the new filename.

## Concepts

This example demonstrates the following concepts:

* Getting the project base directory path with `launchDir`
* Using parameters to set script paths, e.g. `params.rscriptpath1 = "$launchDir/rscript1.R"`
* Sending the output file path to output channel with globs, e.g. `path("*_myobj1.{rda,rds}")`
* Setting a static output directory with `publishDir`, e.g. `publishDir("$params.outdir", overwrite: true)`