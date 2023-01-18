#!/usr/bin/env nextflow

// This is the main workflow script for example 2. Uses integers set in params.config
// to perform arithmetic on a variable, save the result, and return a path.

// set dsl version
nextflow.enable.dsl=2

// manually set config file path
includeConfig "$launchDir/params.config"

// include modules for workflow
// note: each module defines a process for use
// note: we assign two identifiers for the multiply module in order to reuse it

include { add as add_first } from "$launchDir/modules/add"
include { multiply as times_first; multiply as times_second } from "$launchDir/modules/multiply"

// define a new workflow
workflow {
	// get channels
	sumstartvalue = channel.of(params.sumstartvalue)
	sumaddvalue = channel.of(params.sumaddvalue)
	multiplyvalue = channel.of(params.multiplyvalue)

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

