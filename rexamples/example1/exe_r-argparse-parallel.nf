#!/usr/bin/env nextflow

// Declare syntax version
nextflow.enable.dsl=2
 
/*
 * Simple example using Rscript
 * 
 */

params.outdir = "$launchDir/outdir/"
params.rscriptpath1 = "$launchDir/rscript1.R"
params.rscriptpath2 = "$launchDir/rscript2.R"
params.myobjval1 = "abcd"
params.myobjval2 = "efgh"

workflow {
    myobjval1 = channel.of( params.myobjval1 )
    myobjval2 = channel.of( params.myobjval2 )


    process1(
                myobjval1
            )

    process2(
                process1.out,
                myobjval2
            )

    process2.out.view()
}

process process1 {
    publishDir("$params.outdir", overwrite: true)

    input: 
        val myobjval1

    output:
        path("*_myobj1.{rda,rds}")

    script:
    """
    Rscript $params.rscriptpath1 -o $params.myobjval1
    """
}

process process2 {
    publishDir("$params.outdir", overwrite: true)

    input:
        path obj1readpath
        val myobjval2
    
    output:
        path("*_myobj2.{rda|rds}")

    script:
    """
    Rscript $params.rscriptpath2 -r $obj1readpath -o $myobjval2
    """
}