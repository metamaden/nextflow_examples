#!/usr/bin/env nextflow

// defines process to multiply some input, save, and return file path

// set dsl version
nextflow.enable.dsl=2

process randomsce {
    publishDir("$params.outdir", mode: "copy", overwrite: false)

    input:
        val filename
        val zerofreq
    output:
        path("*.rda")

    script:
    """
    Rscript $params.randomscescript -w $filename -z $zerofreq
    """
}


