# Record Matching

### Description

### System Requirements
RecordMatching requires:
* [BEAGLE 4.1](https://faculty.washington.edu/browning/beagle/b4_1.html) 
* Java version 8 - required by BEAGLE. See [BEAGLE 4.1 manual](https://faculty.washington.edu/browning/beagle/beagle_4.1_21Jan17.pdf) for details.
* [VCFtools](https://github.com/vcftools/vcftools)

### Dataset
* HGDP SNP-STR data containing 872 individuals can be downloaded from [here](https://rosenberglab.stanford.edu/data/edgeEtAl2017/unphased_all_vcf.zip).
* Human genetic maps. HapMap GrCh36 and GrCh37 genetic maps in PLINK format. Can be downloaded from [BEAGLE page](http://bochet.gcc.biostat.washington.edu/beagle/genetic_maps/).
* All genotypes in the reference panel must be **non-missing and phased** for BEAGLE imputation. 

### Installation
```R
if (!require("devtools")) install.packages("devtools")
devtools::install_github("jk2236/RecordMatching")
library(RecordMatching)
```

### Demo / examples


### Reference
Kim J, Edge MD, Algee-Hewitt BFB, Li JZ, Rosenberg NA (2018). Statistical detection of relatives typed with disjoint forensic and biomedical loci. *Cell*, 175(3):848-858.e6. [https://doi.org/10.1016/j.cell.2018.09.008](https://doi.org/10.1016/j.cell.2018.09.008)
