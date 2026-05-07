<div id="main" class="col-md-9" role="main">

# use a snapshot of CuratedQueryAtlasR through duckdb

<div class="ref-description section level2">

use a snapshot of CuratedQueryAtlasR through duckdb

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
queryCHCA(con, inst = FALSE)
```

</div>

</div>

<div class="section level2">

## Arguments

-   con:

    connection to duckdb::duckdb(...)

-   inst:

    logical(1) if TRUE install httpfs in duckdb

</div>

<div class="section level2">

## Value

dplyr::tbl for metadata

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
if (interactive()) {
con = DBI::dbConnect(duckdb::duckdb())
queryCHCA(con) |> select(sample_) |> head()
DBI::dbDisconnect(con)
}
```

</div>

</div>

</div>
