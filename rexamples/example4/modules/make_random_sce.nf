#!/usr/bin/env nextflow

// defines process to multiply some input, save, and return file path

// set dsl version
nextflow.enable.dsl=2

process randomsce {
    publishDir("$params.outdir", overwrite: true)

    input:
        path writefile
        val zerofreq
    output:
        path("*sce_fz-*(.rda,.rds)")

    script:
    """
    Rscript $params.randomscescript -w $writefile -fz $zerofreq
    """
}

