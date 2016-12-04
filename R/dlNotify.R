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
#' oct2016 <- dlNotify(10, 2016)
#' 
#' @export dlNotify

dlNotify <- function(month, year){
    loc <-
        "http://ec.europa.eu/food/sites/food/files/plant/docs/ph_biosec_europhyt-interceptions-"
    fName <- paste0(loc, year, "-", month, ".pdf")
    out <- tabulizer::extract_tables(fName)
    out
}
