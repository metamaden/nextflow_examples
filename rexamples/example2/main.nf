#!/usr/bin/env nextflow

// This is the main workflow script for example 2. Uses integers set in params.config
// to perform arithmetic on a variable, save the result, and return a path.

// set dsl version
nextflow.enable.dsl=2

// include modules for workflow
// note: each module defines a process for use
// note: we assign two identifiers for the multiply module in order to reuse it

include { add as script1 } from "${launchDir}/modules"
include { multiply as script2; multiply as script3 } from "${launchDir}/modules"

// define a new workflow
workflow {
	// get channels
	sumstartvalue = channel.of(params.sumstartvalue)
	sumaddvalue = channel.of(params.sumaddvalue)
	multiplyvalue = channel.of(params.multiplyvalue)

    // first round of addition
    script1(sumstartvalue, sumaddvalue)

    // first round of multiplication
    script2(multiplyvalue)

    // second round of multiplication
    script3(multiplyvalue)
    script3.out()
}

workflow.onComplete {
    println "Pipeline successfully completed at: $workflow.complete"
}

workflow.onError {
    println "Pipeline stopped with following error: $workflow.errorMessage"
}

