#!/usr/bin/env nextflow

// This is the main workflow script for example 4.

// set dsl version
nextflow.enable.dsl=2

// include modules for workflow

include { randomsce as randomsce } from "$launchDir/modules/make_random_sce"
include { cellvaluefilter as cellvaluefilter } from "$launchDir/modules/filter_value_cells"

// define a new workflow
workflow {
	// get channels
	zfreqlist = channel.fromList([0.1, 0.2, 0.3])
	mzflist = channel.fromList([0.1, 0.2, 0.3])

    // first round of addition
    randomsce( channel.of(params.scefname), zfreqlist )

    // first round of multiplication
    cellvaluefilter( randomsce.out, mzflist )
    cellvaluefilter.out.view()
}

workflow.onComplete {
    println "Pipeline successfully completed at: $workflow.complete"
}

workflow.onError {
    println "Pipeline stopped with following error: $workflow.errorMessage"
}

