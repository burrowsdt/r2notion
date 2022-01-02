#' Create a page in Notion.
#'
#' This function facilitates basic page creation in Notion. Create one or more blocks using createTextBlock or a
#' similar function and pass as unnamed arguments to create a page with content. Returns a list object
#' representing a Notion page block. To publish automatically, set \code{postPage = TRUE}.
#'
#' @param page_id Character string. The Notion page id or URL for the parent page of your new page.
#' @param title Character string. The title of your new page.
#' @param postPage Boolean. If set to TRUE, the final page block will be posted to Notion.
#' @param ... Data frame representing Notion content to add to page. May accept multiple blocks.
#'
#' @return List object representing a Notion page block.
#' @export
#'
#' @examples
#' newParagraphBlock <- createTextBlock("paragraph", "This is a new paragraph block")
#' page_id = "31d8db33bxyxy8d09xyxyb42758886ef"
#' \dontrun{createPage(page_id, "My new page title", newParagraphBlock)}
createPage <- function (page_id = NULL, title, postPage = FALSE, ...) {
  if (is.null(page_id) == FALSE && stringr::str_detect(page_id, "^http") == TRUE) {
    page_id <- stringr::str_sub(page_id, -32, -1)
  }

  content <- purrr::map(list(...), jsonlite::unbox)

  page <- list(
    parent = list(page_id = page_id),
    properties = list(title = tibble::tibble(
      type = "text",
      text = tibble::tibble(content = title)
    )),
    children = content
  )

  if (postPage == TRUE) {
    postPage(page)
  }

  page
}
