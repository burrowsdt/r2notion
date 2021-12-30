
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r2notion

<!-- badges: start -->
<!-- badges: end -->

r2notion wraps the primary functions of the Notion API, allowing you to
create pages and send content to Notion from R. Although most of the
API’s functions are available in one way or another, the real usefulness
comes in being to embed images and pdfs into a new or pre-existing
Notion page directly from R.

## Installation

You can install the development version of r2notion from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("burrowsdt/r2notion")
```

## Initial Setup

Using the Notion API requires a bit of setup on your part. Follow these
steps:

1.  Set up a Notion integration for your workspace following “Step 1:
    Create an Integration” on this page. Name the integration anything
    you want - “r2notion integration” is fine - and then copy the
    “Internal Integration Token” to some place safe.

2.  Save your token as an environment variable by calling
    `r2notion::set_notion_key()`. A separate window will open asking you
    to enter your key. Enter the token that was given to you when you
    set up your integration.

\[instructions for accessing page id?\]

<!-- This is a basic example which shows you how to solve a common problem: -->
<!-- ```{r example} -->
<!-- library(r2notion) -->
<!-- ## basic example code -->
<!-- ``` -->
<!-- What is special about using `README.Rmd` instead of just `README.md`? You can include R chunks like so: -->
<!-- ```{r cars} -->
<!-- summary(cars) -->
<!-- ``` -->
<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/v1/examples>. -->
<!-- You can also embed plots, for example: -->
<!-- ```{r pressure, echo = FALSE} -->
<!-- plot(pressure) -->
<!-- ``` -->
<!-- In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN. -->
