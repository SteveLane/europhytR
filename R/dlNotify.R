#' Download and extract tables from europhyt
#'
#' \code{dlNotify} Downloads monthly interceptions data from europhyt
#' \url{http://ec.europa.eu/food/plant/plant_health_biosecurity/europhyt_en},
#' and then uses the \code{\link[tabulizer]{extract_tables}} function from the
#' \code{tabulizer} package to extract the tables.
#'
#' @param month Month (integer) of the data to extract
#' @param year Year (integer) of the data to extract
#'
#' @examples
#' \dontrun{
#' oct2016 <- dlNotify(10, 2016)
#' }
#' 
#' @export dlNotify

dlNotify <- function(month, year){
    loc <-
        "http://ec.europa.eu/food/sites/food/files/plant/docs/ph_biosec_europhyt-interceptions-"
    fName <- paste0(loc, year, "-", month, ".pdf")
    tmp <- tempfile()
    utils::download.file(fName, destfile = tmp)
    nPages <- tabulizer::get_n_pages(tmp)
    ## Figure out where to stop (interceptions for reasons other than harmful
    ## organisms) - use agrep
    txt <- tabulizer::extract_text(tmp, 1:nPages)
    inds <- lapply(txt, function(x)
        agrep("Interceptions for reasons other than presence of harmful organism(s)", x))
    stopPage <- which(unlist(lapply(inds, function(x)
        all(length(x) != 0))) == TRUE) - 1
    ## Now extract by column so it all stays together. Number of columns is less
    ## for objects though which provides a sticking point.
    pgDim <- unlist(tabulizer::get_page_dims(tmp, pages = 1))
    areas <- c(list(c(210, 0, pgDim[2], pgDim[1])),
               rep(list(c(0, 0, pgDim[2], pgDim[1])), nPages - 1))
    out <- tabulizer::extract_tables(tmp, area = areas, guess = FALSE)
    unlink(tmp)
    out
}

## parseTable runs through the extracted data from europhyt. This function is
## to be used in conjuction with \code{\link[europhytR]{dlNotify}} which
## performs the initial extraction.
parseTable <- function(tabs){
    
}
