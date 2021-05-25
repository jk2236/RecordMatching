

setup <- function(save.dir, bgl.jar, vcf.exe) {
    
    # save.dir: dir for save output of the pipeline
    # bgl: Full path to beagle executable. 
    # format must be: (full path to dir)/beagle.(version).jar
    # version is the Beagle version code (eg. “01Oct15.6a3”)
    
    
    # marker.info: file containing names of STR markers of interest
    # 1st column: STR name
    # 2nd column: chr number
   
    if (!require(clue)) install.packages("clue")
    
    # assign("base.dir", base.dir, envir=.RMEnv)
    assign("save.dir", save.dir, envir=.RMEnv)
    assign("bgl.jar", bgl.jar, envir=.RMEnv)
    assign("vcf.exe", vcf.exe, envir=.RMEnv)
    
    cat('\n')
    cat(strrep("=", 60))
    cat("\n---- Base path setup for Record Matching ----\n")
    cat("\n    Save directory for output: \n") 
    cat(strrep(" ", 8), save.dir)
    cat("\n    BEAGLE jar file (including full path):\n")
    cat(strrep(" ", 8), bgl.jar)
    cat("\n    vcftools executable (including full path):\n")
    cat(strrep(" ", 8), vcf.exe, "\n")
    cat(strrep("=", 60))
    cat("\n")
    
}


check.setup <- function() {
    ## This function checks if the setup function has been executed.
    
    if((exists('save.dir', envir=.RMEnv) == FALSE) |
       (exists('bgl.jar', envir=.RMEnv) == FALSE) |
       (exists('vcf.exe', envir=.RMEnv) == FALSE)){
        stop("ERROR: please run setup function first.")
    }
}
