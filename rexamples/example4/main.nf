#!/usr/bin/env nextflow

// This is the main workflow script for example 4.

// set dsl version
nextflow.enable.dsl=2

// include modules for workflow

include { add as add_first } from "$launchDir/modules/add"
include { multiply as times_first; multiply as times_second } from "$launchDir/modules/multiply"

// define a new workflow
workflow {
	// get channels
	sumstartvalue = channel.fromList([1, 2, 3])
	sumaddvalue = channel.fromList([4, 5, 6])
	multiplyvalue = channel.fromList([1, 2, 3])

    // first round of addition
    add_first(sumstartvalue, sumaddvalue)

    // first round of multiplication
    times_first(add_first.out, multiplyvalue)
    times_first.out.view()
}

workflow.onComplete {
    println "Pipeline successfully completed at: $workflow.complete"
}

workflow.onError {
    println "Pipeline stopped with following error: $workflow.errorMessage"
}

