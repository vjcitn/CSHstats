<div id="main" class="col-md-9" role="main">

# test for two pairs

<div class="ref-description section level2">

test for two pairs

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
two_pairs(x)
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
h1 = c(d[1], d[14], d[27], d[2], d[15])
h1
#> [1] "2 ♡" "2 ♢" "2 ♣" "3 ♡" "3 ♢"
two_pairs(h1)
#> [1] FALSE
```

</div>

</div>

</div>
