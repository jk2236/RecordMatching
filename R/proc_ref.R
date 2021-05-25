
## This function phase reference vcf file.
#  If the reference panel is unphased, phase with BEAGLE.
#  From reference panel, allele frequencies of the STR is estimated
#  and saved as a file. 
#  The phased reference file is to be used as a reference panel 
#  for BEAGLE imputation.
## Input 
#   ref.f: vcf file containing reference data
# 
phase.ref <- function(ref.f, 
                      niterations=10, nthreads=1,
                      lowmem='false', window=50000, overlap=3000,
                      impute='true', cluster=0.005, gprobs='false',
                      ne=1000000, err=0.0001, seed=-99999, modelscale=0.8) {

    check.setup()
    save.dir <- get("save.dir", envir=.RMEnv)
    bgl.jar <- get("bgl.jar", envir=.RMEnv)
    
    phased.save.dir <- file.path(save.dir, 'ref_phased')
    if (!dir.exists(phased.save.dir)) {
        dir.create(phased.save.dir)
    }
    
    out.pre <- file.path(phased.save.dir, 
                         paste(basename(tools::file_path_sans_ext(ref.f)), 
                               '_phs', sep=''))
    
    cat("\n---- Phasing reference panel ----\n\n")

    beag.str <- paste("java -Xmx2g -jar ", bgl.jar, 
                      " gt=", ref.f,
                      " out=", out.pre,  
                      " niterations=", as.character(niterations), 
                      " nthreads=", as.character(nthreads), 
                      " lowmem=", as.character(lowmem), 
                      " window=", as.character(window),
                      " overlap=", as.character(overlap),
                      " impute=", as.character(impute),
                      " cluster=", as.character(cluster),
                      " gprobs=", as.character(gprobs),
                      " ne=", as.character(ne),
                      " err=", as.character(err),
                      " seed=", as.character(seed),
                      " modelscale=", as.character(modelscale),
                      sep = "")
    system(beag.str)
    
    curr.dir <- getwd()
    setwd(phased.save.dir)
    system("gunzip *.gz")
    setwd(curr.dir)
    
    cat('\n')
    cat(strrep("=", 70))
    cat("\n    The phased reference file has been saved to:\n") 
    cat(strrep(" ", 5), paste(out.pre, '.vcf', sep=''), "\n")
    cat(strrep("=", 70))
    cat("\n")
    
}



ref.al.freq <- function(ref.f, marker) {
    check.setup()
    save.dir <- get("save.dir", envir=.RMEnv)
    vcf.exe <- get("vcf.exe", envir=.RMEnv)
    
    al.save.dir <- file.path(save.dir, 'ref_alfrq')
    if (!dir.exists(al.save.dir)) {
        dir.create(al.save.dir)
    }
    
    out.pre <- file.path(al.save.dir, paste('ref_', marker, sep=''))
    
    cat("\n---- Computing reference panel allele frequency ----\n\n")
    vcftools.str <- paste(vcf.exe, " --vcf ", ref.f,
                          " --snp ", marker, 
                          " --freq --out ", out.pre, sep = "")
    system(vcftools.str)
    
    cat('\n')
    cat(strrep("=", 70))
    cat("\n", strrep(" ", 3), "The allele frequency of marker", marker, 
        "\n", strrep(" ", 3), "in the reference panel has been saved to: \n") 
    cat(strrep(" ", 5), paste(out.pre, '.frq', sep=''), "\n")
    cat(strrep("=", 70))
    cat("\n")
}














