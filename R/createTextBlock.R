#' Create a new block to send to Notion.
#'
#' \code{createTextBlock} creates objects for most text-focused block types. See the "type" parameter for a full list.
#'
#' @param type String. Currently supports the following types: paragraph, heading_1, heading_2, heading_3,
#' callout, quote, bulleted_list_item, numbered_list_item, to_do, toggle.
#'
#' @param text String. The text content of the block.
#'
#' @return Data frame object representing the Notion block object.
#' @export
#'
#' @examples
#' createTextBlock("paragraph","This is the text of a new paragraph block")
#' createTextBlock("quote","Do not be miserable before it is time. - Seneca")
createTextBlock <- function(type, text) {
  block <- tibble::tibble(object = "block",
                  type = type,
                  objectType = tibble::tibble(text = list(tibble::tibble(
                    type = "text",
                    text = tibble::tibble(content = text)
                  ))))
  names(block)[3] <- type
  block
}
