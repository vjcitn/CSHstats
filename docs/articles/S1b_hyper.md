<div id="main" class="col-md-9" role="main">

# S1a: A look at the hypergeometric distribution

<div class="section level2">

## The “null” situation

Here are two variables that are independent. Let’s think of x as an
“exposure” indicator, and y as an “outcome”.

<div id="cb1" class="sourceCode">

``` r
set.seed(234)
x = rbinom(100,1,.3)
y = rbinom(100,1,.4)
```

</div>

The 2x2 table relating exposure and outcome is:

<div id="cb2" class="sourceCode">

``` r
library(gmodels)
CrossTable(x,y)
```

</div>

    ## 
    ##  
    ##    Cell Contents
    ## |-------------------------|
    ## |                       N |
    ## | Chi-square contribution |
    ## |           N / Row Total |
    ## |           N / Col Total |
    ## |         N / Table Total |
    ## |-------------------------|
    ## 
    ##  
    ## Total Observations in Table:  100 
    ## 
    ##  
    ##              | y 
    ##            x |         0 |         1 | Row Total | 
    ## -------------|-----------|-----------|-----------|
    ##            0 |        44 |        28 |        72 | 
    ##              |     0.000 |     0.000 |           | 
    ##              |     0.611 |     0.389 |     0.720 | 
    ##              |     0.721 |     0.718 |           | 
    ##              |     0.440 |     0.280 |           | 
    ## -------------|-----------|-----------|-----------|
    ##            1 |        17 |        11 |        28 | 
    ##              |     0.000 |     0.001 |           | 
    ##              |     0.607 |     0.393 |     0.280 | 
    ##              |     0.279 |     0.282 |           | 
    ##              |     0.170 |     0.110 |           | 
    ## -------------|-----------|-----------|-----------|
    ## Column Total |        61 |        39 |       100 | 
    ##              |     0.610 |     0.390 |           | 
    ## -------------|-----------|-----------|-----------|
    ## 
    ## 

Notice that the marginal frequencies (column and row proportions for 0
and 1) are very similar for x and y. This arises by construction,
because the two variables here were simulated separately.

Exercise: What is the interpretation of the numbers 0.389 and 0.393 in
this table?

A test for independence of x and y was produced by R.A. Fisher.

<div id="cb4" class="sourceCode">

``` r
fisher.test(table(x,y))
```

</div>

    ## 
    ##  Fisher's Exact Test for Count Data
    ## 
    ## data:  table(x, y)
    ## p-value = 1
    ## alternative hypothesis: true odds ratio is not equal to 1
    ## 95 percent confidence interval:
    ##  0.3716153 2.7041308
    ## sample estimates:
    ## odds ratio 
    ##   1.016643

Exercise: What is the interpretation of this p-value?

</div>

<div class="section level2">

## How to produce “correlated binomial” responses?

A very simple way of producing dependent binary responses is via a
logistic regression relationship. We produce x, which can be random or
deterministic, and then let the probability of y=1 depend on the value
of x. R’s vectorized computations make this very simple.

<div id="cb6" class="sourceCode">

``` r
x = rbinom(100,1,.3)
y = rbinom(100,1, plogis(.2+x))
# summary(glm(y~x, fam=binomial))
```

</div>

Now the cross-tab is

<div id="cb7" class="sourceCode">

``` r
CrossTable(x,y)
```

</div>

    ## 
    ##  
    ##    Cell Contents
    ## |-------------------------|
    ## |                       N |
    ## | Chi-square contribution |
    ## |           N / Row Total |
    ## |           N / Col Total |
    ## |         N / Table Total |
    ## |-------------------------|
    ## 
    ##  
    ## Total Observations in Table:  100 
    ## 
    ##  
    ##              | y 
    ##            x |         0 |         1 | Row Total | 
    ## -------------|-----------|-----------|-----------|
    ##            0 |        37 |        47 |        84 | 
    ##              |     0.344 |     0.229 |           | 
    ##              |     0.440 |     0.560 |     0.840 | 
    ##              |     0.925 |     0.783 |           | 
    ##              |     0.370 |     0.470 |           | 
    ## -------------|-----------|-----------|-----------|
    ##            1 |         3 |        13 |        16 | 
    ##              |     1.806 |     1.204 |           | 
    ##              |     0.188 |     0.812 |     0.160 | 
    ##              |     0.075 |     0.217 |           | 
    ##              |     0.030 |     0.130 |           | 
    ## -------------|-----------|-----------|-----------|
    ## Column Total |        40 |        60 |       100 | 
    ##              |     0.400 |     0.600 |           | 
    ## -------------|-----------|-----------|-----------|
    ## 
    ## 

and Fisher’s test is

<div id="cb9" class="sourceCode">

``` r
fisher.test(table(x,y))
```

</div>

    ## 
    ##  Fisher's Exact Test for Count Data
    ## 
    ## data:  table(x, y)
    ## p-value = 0.09295
    ## alternative hypothesis: true odds ratio is not equal to 1
    ## 95 percent confidence interval:
    ##   0.8399315 19.8105854
    ## sample estimates:
    ## odds ratio 
    ##   3.374506

Exercise: What is the interpretation of the numbers 0.56 and 0.812 in
this table? What is the interpretation of the Fisher’s test p-value?
What features of the simulation could be changed to make the p-value
smaller?

Note: the odds ratio reported in the Fisher test is recovered (some
discrepancy owing to rounding):

<div id="cb11" class="sourceCode">

``` r
(.812/(1-.812))/(.56/(1-.56))
```

</div>

    ## [1] 3.393617

</div>

<div class="section level2">

## Connection to the hypergeometric distribution

We’ll start with a very simple problem. An urn contains 10 balls, some
red, some blue. We pick three balls *without replacement* and note their
color. The table below shows that two balls were red, one blue.

<div id="cb13" class="sourceCode">

``` r
color = rep(c("red", "blue"), each=5)
picked = c(1,1,0,0,0,1,0,0,0,0)
ta = table(color,picked)
ta
```

</div>

    ##       picked
    ## color  0 1
    ##   blue 4 1
    ##   red  3 2

The hypergeometric distribution is used to model such a situation, in
which a draw of \\(n\\) balls from an urn holding \\(N\\) balls yields
\\(r\\) balls in a given condition. For this table, the probability of
this draw is given by

\\(\\frac{{5 \\choose 2} \\cdot {5 \\choose 1}}{10 \\choose 3}\\). In
this case, Fisher’s test indicates no association between color and
presence in the draw.

<div id="cb15" class="sourceCode">

``` r
fisher.test(ta)
```

</div>

    ## 
    ##  Fisher's Exact Test for Count Data
    ## 
    ## data:  ta
    ## p-value = 1
    ## alternative hypothesis: true odds ratio is not equal to 1
    ## 95 percent confidence interval:
    ##    0.0847468 195.6529809
    ## sample estimates:
    ## odds ratio 
    ##   2.414224

We can use a 1-sided test:

<div id="cb17" class="sourceCode">

``` r
fisher.test(ta, alt="less")
```

</div>

    ## 
    ##  Fisher's Exact Test for Count Data
    ## 
    ## data:  ta
    ## p-value = 0.9167
    ## alternative hypothesis: true odds ratio is less than 1
    ## 95 percent confidence interval:
    ##   0.00000 95.99192
    ## sample estimates:
    ## odds ratio 
    ##   2.414224

Use the hypergeometric probability function to produce this p-value:

<div id="cb19" class="sourceCode">

``` r
sum(dhyper(0:2,5,5,3))
```

</div>

    ## [1] 0.9166667

Note that if the proportions are preserved but the frequencies are
multiplied by 10, we have a different two-sided p-value, but similar
odds ratio.

<div id="cb21" class="sourceCode">

``` r
ta2 = 10*ta
fisher.test(ta2)
```

</div>

    ## 
    ##  Fisher's Exact Test for Count Data
    ## 
    ## data:  ta2
    ## p-value = 0.04858
    ## alternative hypothesis: true odds ratio is not equal to 1
    ## 95 percent confidence interval:
    ##  1.005329 7.317139
    ## sample estimates:
    ## odds ratio 
    ##   2.640147

Exercise: A reformulation of the analysis of the larger 2x2 table is:

<div id="cb23" class="sourceCode">

``` r
g = glm(formula = ta2[, 2:1] ~ factor(rownames(ta2)), family = binomial)
summary(g)
```

</div>

    ## 
    ## Call:
    ## glm(formula = ta2[, 2:1] ~ factor(rownames(ta2)), family = binomial)
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)               -1.3863     0.3536  -3.921 8.82e-05 ***
    ## factor(rownames(ta2))red   0.9808     0.4564   2.149   0.0316 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 4.8315e+00  on 1  degrees of freedom
    ## Residual deviance: 1.5543e-14  on 0  degrees of freedom
    ## AIC: 12.268
    ## 
    ## Number of Fisher Scoring iterations: 3

Show that the log of the cross product ratio of the elements of ta2 is
given by the coefficient of ‘red’ in the binomial model above.

</div>

</div>
