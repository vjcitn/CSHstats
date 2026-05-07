<div id="main" class="col-md-9" role="main">

# get faces of a collection of cards

<div class="ref-description section level2">

get faces of a collection of cards

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
faces(x)
```

</div>

</div>

<div class="section level2">

## Arguments

-   x:

    a card from a deck made by \`build\_deck\`

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
d = build_deck()
d[1]
#> [1] "2 ♡"
faces(d[1:2])
#> [1] "2" "3"
```

</div>

</div>

</div>
