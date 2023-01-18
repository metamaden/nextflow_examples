#!/usr/bin/env nextflow

// defines process to multiple some input, save, and return file path

// set dsl version
nextflow.enable.dsl=2

process countmatrix {
  label 'high'
  publishDir "$params.outdir/countmatrix", mode: 'copy', overwrite: true
  container 'hediatnani/nf-renv:633e6c7'
  
  
input:
    path("*counts.tsv")
output:
    path("countmatrix.tsv"), emit: countmatr


  script:
"""
Rscript --vanilla  $launchDir/bin/countmatrix.R
"""
}


