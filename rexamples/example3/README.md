# example 3

## Description

This workflow build on the example #2 workflow. It uses a similar setup, except that data values are now included in the
new output filenames which are saved/loaded. Two lists of unique integers are passed to the `add` process, and one list of
unique integers is passed to the `multiply` process. Running the workflow produces the following outputs in `./outdir/`:

```
value-14_newproduct.rda  
value-5_newsum.rda  
value-9_newproduct.rda
value-15_newproduct.rda  
value-7_newsum.rda  
value-9_newsum.rda
```

## Concepts

In addition to concepts introduced in example #2, this example shows the following concepts:

* Specify additional external configuration files manually in `nextflow.config` with `includeConfig`
* Specify variable output filenames in `.R` scripts
* Use `.fromList` to parse lists of values as input channels in `main.nf`