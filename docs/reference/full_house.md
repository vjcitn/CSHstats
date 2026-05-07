<div id="main" class="col-md-9" role="main">

# test for full house

<div class="ref-description section level2">

test for full house

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
full_house(x)
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
full_house(h1)
#> [1] TRUE
h2 = c(d[1], d[14], d[27], d[2], d[16])
h2
#> [1] "2 ♡" "2 ♢" "2 ♣" "3 ♡" "4 ♢"
full_house(h2)
#> [1] FALSE
```

</div>

</div>

</div>
