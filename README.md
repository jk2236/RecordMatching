# Record Matching

### Description
This `R` package contains necessary tools for performing record matching of pairs of profiles that belong to relatives when the query and database rely on nonoverlapping genetic markers leveraging genomic linkage disequilibrium. The detailed description of the method can be found at [Kim et al]((https://doi.org/10.1016/j.cell.2018.09.008)). For a demonstration of the pipeline using the package, please see [Example](#example).

### Platform
While the package can be run on any platform, it has been extensively tested on Mac only.

### System Requirements
* [BEAGLE 4.1](https://faculty.washington.edu/browning/beagle/b4_1.html) 
* Java version 8 - required by BEAGLE. See [BEAGLE 4.1 manual](https://faculty.washington.edu/browning/beagle/beagle_4.1_21Jan17.pdf) for details.
* [VCFtools](https://github.com/vcftools/vcftools). `conda` version is also available [here](https://anaconda.org/bioconda/vcftools).

### Dataset
* HGDP SNP-STR data containing 872 individuals can be downloaded from [here](https://rosenberglab.stanford.edu/data/edgeEtAl2017/unphased_all_vcf.zip).
* Human genetic maps. HapMap GrCh36 and GrCh37 genetic maps in PLINK format. Can be downloaded from [BEAGLE page](http://bochet.gcc.biostat.washington.edu/beagle/genetic_maps/).
* All genotypes in the reference panel must be **non-missing and phased** for BEAGLE imputation. 

### Installation
```R
if (!require("devtools")) {
    install.packages("devtools")
}
devtools::install_github("jk2236/RecordMatching")
library(RecordMatching)
```

### Example
* See the [example documentation](https://github.com/jk2236/RecordMatching/blob/main/examples/demo.pdf). 
* The corresponding knittable markdown file can be found at [here](https://github.com/jk2236/RecordMatching/blob/main/examples/demo.Rmd).

### Reference
Kim J, Edge MD, Algee-Hewitt BFB, Li JZ, Rosenberg NA (2018). Statistical detection of relatives typed with disjoint forensic and biomedical loci. *Cell*, 175(3):848-858.e6. [https://doi.org/10.1016/j.cell.2018.09.008](https://doi.org/10.1016/j.cell.2018.09.008)
