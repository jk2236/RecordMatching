
#' Compute match accuracies.
#'
#' insert desc
#'
#' @param base.dir Full path of the base folder of the pipeline.
#'                 All the output of the pipeline will be saved here.
#'                 If the folder doesn't exist, it's automatically created.
#' @param bgl.jar Full path to beagle executable.
#'                Format must be: (full path to dir)/beagle.(version).jar.
#'                version is the Beagle version code (eg. “01Oct15.6a3”).
#' @param vcf.exe Full path to vcftools executable.
#'
#' @return None
#'
#' @details
#'
#' @export
setup <- function(base.dir, save.dir, bgl.jar, vcf.exe) {
    if (!require(clue)) {
        message()
        install.packages("clue")
    }
    if (!require(plyr)) install.packages("plyr")

    if (!dir.exists(base.dir)) {
        dir.create(base.dir)
        cat("\n")
        cat(base.dir)
        cat(" has been created \n")
    }

    assign("base.dir", base.dir, envir=.RMEnv)
    assign("bgl.jar", bgl.jar, envir=.RMEnv)
    assign("vcf.exe", vcf.exe, envir=.RMEnv)

    cat(strrep("=", 60))
    cat("\n---- Base path setup for Record Matching ----\n")
    cat("\n    Data directory and save directory for outputs: \n")
    cat(strrep(" ", 8), base.dir)
    cat("\n    BEAGLE jar file (including full path):\n")
    cat(strrep(" ", 8), bgl.jar)
    cat("\n    vcftools executable (including full path):\n")
    cat(strrep(" ", 8), vcf.exe, "\n")
    cat(strrep("=", 60))
    cat("\n")

}


check.setup <- function() {
    ## This function checks if the setup function has been executed.
    if((exists('base.dir', envir=.RMEnv) == FALSE) |
       (exists('bgl.jar', envir=.RMEnv) == FALSE) |
       (exists('vcf.exe', envir=.RMEnv) == FALSE)){
        stop("ERROR: please run setup function first to set base directory,
             paths to BEAGLE and vcftools.")
    }
}







