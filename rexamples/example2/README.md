# example 2

## Description

This workflow defines two processes called `add` and `multiply`. The first adds two integers together and saves
them to `newsum.rda`. The second loads some specified file, multiplies it by a specified value, saves the 
product as `newproduct.rda`, and returns the new file path.

## Files

* `main.nf` : The main NextFlow script defining the workflow.
* `nextflow.config` : The configurations file defining workflow parameters.
* `/rscripts/add.R` : Script to add together two specified integers and save them to `newsum.rda`
* `/rscripts/multiply.R/` : Script to load some file, multiple loaded file's value by a specified integer, and save to `newproduct.rda`
* `/modules/add.nf` : Defines the process calling `add.R` for the workflow.
* `/modules/multiply.nf/` : Defines the process calling `multiply.R` for the workflow.

## Concepts

This example shows the following concepts:

* Using modules in a separate `./modules/` subdirectory.
* Set parameters in a dedicated file called `nextflow.config`. This is automatically detected when the main workflow script is run.
* Loading and running modules in a dedicated script called `main.nf`.
* Organizing scripts within `./rscripts/` subdirectory.
* In `main.nf`, line 14, calling a module twice under separate names. This enables repeatedly running a module in the same workflow.
* In `main.nf`, lines 31+, specify messages for success and failure of workflow run.
