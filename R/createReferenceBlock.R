#' Create a new url-dependent block to send to Notion.
#'
#' \code{createReferenceBlock} creates objects for blocks that reference a url. See the type parameter for a full list.
#' Captions are not currently supported.
#'
#' @param type String. Currently supports the following types: image, video, file, pdf, bookmark.
#' @param url String. The reference URL where the content is stored.
#'
#' @return Data frame object representing the Notion block object.
#' @export
#'
#' @examples
#' url = "https://developers.notion.com"
#' bookmarkBlock <- createReferenceBlock("bookmark", url)
#'
createReferenceBlock <- function(type, url) {
  block <- tibble::tibble(
    object = "block",
    type = type,
    objectType = tibble::tibble((
      tibble::tibble(
        type = "external",
        external = tibble::tibble(url = url)
      )
    ))
  )
  names(block)[3] <- type
  block
}
