#!/usr/bin/env nextflow

// defines process to multiply some input, save, and return file path

// set dsl version
nextflow.enable.dsl=2

process add {
    publishDir("$params.outdir", overwrite: true)

    input:
        path readfile
        val multiplyvalue
    output:
        path("newproduct.rda")

    script:
    """
    Rscript $params.multiplyscriptpath -r $readfile -m $multiplyvalue
    """
}


