

impute.str <- function(snp.f, ref.f, map.f, marker,
                       niterations=10, nthreads=1,
                       maxlr=1000000, lowmem='false', window=50000, 
                       overlap=3000, cluster=0.005, ne=1000000, 
                       err=0.0001, seed=-99999, modelscale=0.8) {
    ##
    # snp.f: File containing SNPs without STR
    # ref.f: File containing reference panel for imputation. 
    #        Must be phased and have no missing values.
    # map.f: Genetic map file. plink.GRCh36.map downloaded from BEAGLE site.
    # marker: STR marker name being imputed
    
    check.setup()
    save.dir <- get("save.dir", envir=.RMEnv)
    bgl.jar <- get("bgl.jar", envir=.RMEnv)
    
    imputed.save.dir <- file.path(save.dir, 'imputed_str')
    if (!dir.exists(imputed.save.dir)) {
        dir.create(imputed.save.dir)
    }
    
    out.pre <- file.path(imputed.save.dir, 
                         paste(basename(tools::file_path_sans_ext(snp.f)), 
                               '_imp', sep=''))
    
    cat("\n---- Imputing STR from SNPs ----\n\n")

    beag.str <- paste("java -Xmx2g -jar ", bgl.jar, 
                      " gt=", snp.f,  
                      " out=", out.pre, 
                      " ref=", ref.f,
                      " map=", map.f, 
                      " gprobs=true impute=true",
                      " niterations=", as.character(niterations), 
                      " nthreads=", as.character(nthreads), 
                      " maxlr=", as.character(maxlr),
                      " lowmem=", as.character(lowmem), 
                      " window=", as.character(window),
                      " overlap=", as.character(overlap),
                      " cluster=", as.character(cluster),
                      " ne=", as.character(ne),
                      " err=", as.character(err),
                      " seed=", as.character(seed),
                      " modelscale=", as.character(modelscale),
                      sep = "")
    
    system(beag.str)
    
    curr.dir <- getwd()
    setwd(imputed.save.dir)
    system("gunzip *.gz")
    setwd(curr.dir)
    
    
    vcftools.str.1 <- paste("vcftools --vcf ", paste(out.pre, '.vcf', sep=''), 
                            " --snp ", marker, " --recode --recode-INFO-all", 
                            " --out ", out.pre, sep = "")
    system(vcftools.str.1)
    
    vcftools.str.2 <- paste("vcftools --vcf ", 
                            paste(out.pre, '.recode.vcf', sep=''),
                            " --extract-FORMAT-info GT",
                            " --out ", out.pre, sep = "")
    system(vcftools.str.2)
    
    vcftools.str.3 <- paste("vcftools --vcf ", 
                            paste(out.pre, '.recode.vcf', sep=''),
                            " --extract-FORMAT-info GP",
                            " --out ", out.pre, sep = "")
    system(vcftools.str.3)
    
    
    cat('\n')
    cat(strrep("=", 70))
    cat("\n    The imputed vcf file has been saved to:\n") 
    cat(strrep(" ", 5), paste(out.pre, '.vcf', sep=''), "\n")
    
    cat("\n    The imputed STR genotypes have been saved to:\n")
    cat(strrep(" ", 5), paste(out.pre, '.GT.FORMAT', sep=''), "\n")
    
    cat("\n    The imputed STR genotype probabilities have been saved to:\n")
    cat(strrep(" ", 5), paste(out.pre, '.GP.FORMAT', sep=''), "\n")
    
    cat(strrep("=", 70))
    cat("\n")
    
}










