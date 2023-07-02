#' use a snapshot of CuratedQueryAtlasR through duckdb
#' @param con connection to duckdb::duckdb(...)
#' @param inst logical(1) if TRUE install httpfs in duckdb
#' @return dplyr::tbl for metadata
#' @examples
#' con = DBI::dbConnect(duckdb::duckdb())
#' queryCHCA(con) 
#' @export
queryCHCA = function (con, inst = FALSE) 
{
    target = "https://mghp.osn.xsede.org/bir190004-bucket01/BiocGeneralData/metadata.0.2.3.parquet"
    if (inst) {
        DBI::dbExecute(con, "install 'httpfs'")
        }
    DBI::dbExecute(con, "load 'httpfs'")
    dplyr::tbl(con, target)
}
