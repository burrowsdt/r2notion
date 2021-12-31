#' Add children blocks to parent blocks.
#'
#' \code{addChildren} facilitates adding children blocks to parent blocks
#' whose type allows it. Currently this includes "paragraph",
#' "bulleted_list_item", "numbered_list_item", "toggle", "to_do", "quote",
#' "callout", "synced_block", "template", "column", "child_page", and
#' "child_database".
#'
#' @param parentBlock Data frame. The parent block to add children to.
#' @param children Data frame. The child block(s) you are adding.
#'
#' @return Data frame object representing the Notion block object.
#' @export
#'
#' @examples
#' toggleBlock <- createTextBlock("toggle","Outer toggle text")
#' stuffForToggle <- createTextBlock("paragraph", "inner toggle text")
#' toggleBlock <- addChildren(toggleBlock, stuffForToggle)
#' ## Pipe-friendly
#' toggleBlock <- createTextBlock("toggle","Outer toggle text") %>%
#' addChildren(createTextBlock("paragraph", "inner toggle text"))
addChildren <- function(parentBlock, children) {
  parentBlock[[3]]$children <- list(children)
  parentBlock
}
