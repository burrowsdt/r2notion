#' Set NOTION_KEY as an environment variable
#'
#' Call \code{set_notion_key()} to save your Notion secret key as an environment variable. Leave the \code{key} parameter empty to call \code{askpass} and enter your secret there.
#'
#' @param key A string.
#'
#' @export
#'
#' @examples
#' \dontrun{set_notion_key()}
set_notion_key <- function(key = NULL) {
  if (is.null(key)) {
    key <- askpass::askpass("Please enter your Notion API Key")
  }
  Sys.setenv("NOTION_KEY" = key)
}

#' Get and return NOTION_KEY
#'
#' Returns the NOTION_KEY environment variable. If no key is set, the function will return a warning.
#'
#' @return NOTION_KEY as a string
#' @export
#'
#' @examples
#' \dontrun{get_notion_key()}
get_notion_key <- function() {
  key <- Sys.getenv("NOTION_KEY")
  if (identical(key, "")) {
    stop("No API key found, please supply with `NOTION_KEY` argument or use `set_notion_key` to set the NOTION_KEY environment variable")
  }
  key
}
