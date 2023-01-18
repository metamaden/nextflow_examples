#!/usr/bin/env nextflow

// defines process to add some input, save, and return file path

// set dsl version
nextflow.enable.dsl=2

process add {
    publishDir("$params.outdir", overwrite: true)

    input:
        val sumstartvalue
        val sumaddvalue
    output:
        path("newsum.rda")

    script:
    """
    Rscript $params.addscriptpath -valueone $sumstartvalue -valuetwo $sumaddvalue
    """
}


