#!/usr/bin/env nextflow

// Declare syntax version
nextflow.enable.dsl=2
 
/*
 * Simple example using Rscript
 * 
 */

params.rscriptpath1 = "rscript1.R"
params.rscriptpath2 = "rscript2.R"
params.myobjval1 = "abcd"
params.myobjval2 = "efgh"

workflow {
    myobjval1 = channel.of( params.myobjval1 )
    myobjval2 = channel.of( params.myobjval2 )

    process1(
                myobjval1
            )

    process2(
                myobjval2
            )

    process2.view()
}

process process1 {
    input: 
        var myobjval1

    output:
        path("*_myobj1.{rda,rds}")

    script:
    """
    Rscript $params.rscriptpath1 -o $params.myobjval1
    """
}

process process2 {
    input:
        var myobjval2
    
    output:
        path("*_newobj2.{rda|rds}")

    script:
    """
    Rscript $params.rscriptpath2 -r $obj1readpath -o $myobjval2
    """
}