#' Append blocks to a published block or a page.
#'
#' Append block objects to published blocks/pages. Pass blocks as individual unnamed arguments.
#' This function will format and send the PATCH request to Notion. Although you can append multiple
#' blocks at once, the destinaton (parent) block must be the same for all appending blocks.
#'
#' @param content_id Character string. The Notion id or URL for the parent block to append to.
#' @param ... Data frames representing Notion blocks. May enter more than one.
#'
#' @return httr2 response
#' @export
#'
#' @examples
#' testBlock1 <- createTextBlock("paragraph", "My first test block")
#' testBlock2 <- createTextBlock("quote", "Another test block")
#' \dontrun{patchAppendBlocks(page_id, testBlock1, testBlock2)}
#'
#'
patchAppendBlocks <- function(content_id, ...) {

  blocks <- purrr::map(list(...), jsonlite::unbox)

  res <- httr2::request(sprintf("https://api.notion.com/v1/blocks/%s/children", content_id)) %>%
    httr2::req_headers(
      `Notion-Version` = "2021-08-16"
    ) %>%
    httr2::req_headers(
      `Content-Type` = "application/json"
    ) %>%
    httr2::req_body_json(list(children = blocks)) %>%
    httr2::req_auth_bearer_token(get_notion_key()) %>%
    httr2::req_method("PATCH") %>%
    httr2::req_perform()
}
