<div id="main" class="col-md-9" role="main">

# test for one pair

<div class="ref-description section level2">

test for one pair

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
one_pair(x)
```

</div>

</div>

<div class="section level2">

## Arguments

-   x:

    a vector of cards

</div>

<div class="section level2">

## Value

logical(1)

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
d = build_deck()
hand_1 = c(d[1], d[14], d[2:4] )
hand_1
#> [1] "2 ♡" "2 ♢" "3 ♡" "4 ♡" "5 ♡"
one_pair(hand_1[1])
#> [1] FALSE
hand_2 = c(d[1], d[6], d[2:4] )
hand_2
#> [1] "2 ♡" "7 ♡" "3 ♡" "4 ♡" "5 ♡"
one_pair(hand_2[2])
#> [1] FALSE
```

</div>

</div>

</div>
