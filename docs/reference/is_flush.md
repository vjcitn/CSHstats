<div id="main" class="col-md-9" role="main">

# test for flush

<div class="ref-description section level2">

test for flush

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
is_flush(x)
```

</div>

</div>

<div class="section level2">

## Arguments

-   x:

    a vector of cards

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
d = build_deck()
h1 = c(d[1:4], d[6])
h1
#> [1] "2 ♡" "3 ♡" "4 ♡" "5 ♡" "7 ♡"
is_flush(h1)
#> [1] TRUE
```

</div>

</div>

</div>
