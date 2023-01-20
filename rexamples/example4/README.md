# example 4

## Description

This example prototypes a `SingleCellExperiment` workflow. Using the `lute` R package, it
makes a new random `sce` object, then filters cells based on frequency of zero-value genes.

## Files

In addition to files from example #3, we have:

* `rscripts/make_random_sce.R` : Command line-callable script to make a new random `sce` object of
class `SingleCellExperiment`. This is called by the module `make_random_sce.nf`.

* `rscripts/filter_value_cells.R` : Command line-callable script to filter an `sce` object based on frequency of zero-value genes. This is called by the module `filter_value_cells.nf`.

## Concepts

* `SingleCellExperiment` workflows
* Prototyping workflows
* Informative and dynamic filenames
* Setting the `publishDir` arguments:
** `mode` : Setting this to "copy" to store full `sce` object files (rather than symlinks, etc.) 