
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r2notion

<!-- badges: start -->
<!-- badges: end -->

r2notion wraps the primary functions of the Notion API, allowing you to
create pages and send content to Notion from R. This package is under
development and this readme may not accurately reflect its current
state. To see a current list of working features, click here.

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

1.  Set up a Notion integration for your workspace [following “Step 1:
    Create an Integration” on this
    page](https://developers.notion.com/docs/getting-started). Name the
    integration anything you want - “r2notion integration” is fine - and
    then copy the “Internal Integration Token” to an accessible but safe
    location.

2.  Save your token as an environment variable by calling
    `r2notion::set_notion_key()`. A separate window will open asking you
    to enter your key. Enter the token that was given to you when you
    set up your integration.

3.  Set permissions to allow access to the page/database you want to
    post to. Follow step 2 of this guide for an example and copy/save
    the URL for the destination page. Note that when creating or posting
    a page using `r2notion`, you can use the full URL or just the id –
    the package will extract the id from the URL if necessary.

## Current Working Features

set_notion_key() - set your notion secret token as an environment
variable get_notion_key() - retrieves your notion token
createTextBlock() - Create a new block of one of the following types:
paragraph, heading_1, heading_2, heading_3, callout, quote,
bulleted_list_item, numbered_list_item, to_do, toggle. addChildren() -
Add children to a block that supports children (i.e. toggle)
createPage() - Create a new page with or without content blocks
postPage() - Post page to Notion
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
