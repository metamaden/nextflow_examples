#!/usr/bin/env nextflow

// defines process to multiply some input, save, and return file path

// set dsl version
nextflow.enable.dsl=2

process multiply {
    publishDir("$params.outdir", overwrite: true)

    input:
        path readfile
    output:
        path("*_zfilt-mzf-*(.rda,.rds)")

    script:
    """
    Rscript $params.randomscescript -r $readfile -mzf $params.maxzerofreq
    """
}


