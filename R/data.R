#' simulated draws of top card from a shuffled deck of cards
#' @docType data
#' @format character vector
"doubsim"

#' simulated draws of top card from a shuffled  deck of cards
#' @docType data
#' @format character vector
"doubsim2"

#' simulated draws of top card from a shuffled  deck of cards
#' @docType data
#' @format character vector
"doubsim3"

#' read depth for 5000 positions on pasilla chr4, from example(coverage) for GenomicAlignments
#' @docType data
#' @format numeric vector
"c5000"

#' RNASeq2GeneNorm measures for YY1 from TCGA ACC samples
#' @docType data
#' @format numeric vector
"yy1_ex"

#' RNASeq2GeneNorm measures for FOS from TCGA ACC samples
#' @docType data
#' @format numeric vector
"fos_ex"

#' RNASeq2GeneNorm measures for EGR1 from TCGA ACC samples
#' @docType data
#' @format numeric vector
"egr1_ex"

#' meaningless integers
#' @docType data
#' @format numeric vector
"c50"

#' MultiAssayExperiment instance for ACC
#' @docType data
#' @format MultiAssayExperiment
"accex"

#' data.frame with GTEx lung eQTL data and metadata, a selection from chr20
#' @docType data
#' @format data.frame
"gtex_exc_chr20_b38"

#' vGene result for a recount dataset, SRP045638
#' @note see https://lcolladotor.github.io/cshl_rstats_genome_scale_2023/differential-gene-expression-analysis-with-limma.html#differential-expression
#' @format limma EList
"vGene"

#' topTable excerpt for SRP045638, see vGene
#' @format data.frame
"de_results"

#' model matrix for SRP045638, see vGene
#' @format data.frame
"mod"

#' a data frame with y and x in a sigmoidal relationship (with error and a covariate z)
#' @format data.frame
#' @examples
#' data(nonlindat)
#' plot(y~x, data=nonlindat, col=z+1, pch=19)
"nonlindat"
