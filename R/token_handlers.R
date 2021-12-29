set_api_key <- function(key = NULL) {
  if (is.null(key)) {
    key <- askpass::askpass("Please enter your Notion API Key")
  }
  Sys.setenv("NOTION_KEY" = key)
}

get_api_key <- function() {
  key <- Sys.getenv("NOTION_KEY")
  if (identical(key, "")) {
    stop("No API key found, please supply with `NOTION_KEY` argument or use `set_api_key` to set the NOTION_KEY environment variable")
  }
  key
}
