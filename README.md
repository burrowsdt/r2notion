
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r2notion

<!-- badges: start -->
<!-- badges: end -->

r2notion wraps the primary functions of the Notion API, allowing you to
create pages and send content to Notion from R.

This package is under development and this readme may not accurately
reflect its current state. To see a current list of working features,
click here.

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

## Current Working Functions

-   `set_notion_key()` - set your notion secret token as an environment
    variable
-   `get_notion_key()` - retrieves your notion token
-   `createTextBlock()` - Create a new block of one of the following
    types: paragraph, heading_1, heading_2, heading_3, callout, quote,
    bulleted_list_item, numbered_list_item, to_do, toggle. Blocks can
    then be added to a new page using `createPage` or to a parent block
    or page using `addChildren`.
-   `createReferenceBlock()` - Create a new block of one of the
    following types: image, video, file, pdf, bookmark. Captions are not
    currently enabled.
-   `addChildren()` - Add children to an unpublished block that allows
    children (i.e. toggle). Supports adding multiple blocks at once. To
    add blocks to a published block, use `patchAppendBlocks`.
-   `createPage()` - Create a new page with or without content blocks.
    Supports adding multiple blocks at once.
-   `postPage()` - Post page to Notion
-   `patchAppendBlocks()` - Append new blocks to published blocks or
    pages.
