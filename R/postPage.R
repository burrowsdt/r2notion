#' Post a page block to Notion.
#'
#' @param page List object representing a page block in Notion. Use \code{createPage} to create a new page block.
#' @param page_id Character string. The Notion page id or URL for the parent page of the page being posted.
#'
#' @return httr2 response
#' @export
#'
#' @examples
#' aNewPage <- createPage(title = "My brand new page")
#' page_id = "31d8db33bxyxy8d09xyxyb42758886ef"
#' \dontrun{postPage(aNewPage, page_id)}
postPage <- function(page, page_id = NULL){
  if (is.null(page_id) == FALSE && stringr::str_detect(page_id, "^http") == TRUE) {
    page_id <- stringr::str_sub(page_id, -32, -1)
  }

  if (is.null(page$parent$page_id) == TRUE) {
    page$parent$page_id <- page_id
  }

  if (is.null(page$parent$page_id) == TRUE) {
    stop("No page_id provided.")
  }


  response <- httr2::request("https://api.notion.com/v1/pages") %>%
    httr2::req_headers(
      `Notion-Version` = "2021-08-16"
    ) %>%
    httr2::req_headers(
      `Content-Type` = "application/json"
    ) %>%
    httr2::req_body_json(page) %>%
    httr2::req_auth_bearer_token(get_notion_key()) %>%
    httr2::req_perform()

  response
}
