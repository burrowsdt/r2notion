#' Add children blocks to parent blocks that have not yet been posted.
#'
#' \code{addChildren} facilitates adding children blocks to parent blocks that
#' have not yet been posted (providing the block type allows children).
#' Currently this includes "paragraph", "bulleted_list_item", "numbered_list_item",
#' "toggle", "to_do", "quote", "callout", "synced_block", "template", "column",
#' "child_page", and "child_database".
#'
#' To add children to blocks that are already posted, use \code{patchAppendBlocks}.
#'
#' @param parentBlock Data frame. The parent block to add children to.
#' @param ... Data frame representing Notion content to add to parent block. May accept multiple blocks.
#'
#' @return Data frame object representing the Notion block object.
#' @export
#'
#' @examples
#' toggleBlock <- createTextBlock("toggle","Outer toggle text")
#' stuffForToggle <- createTextBlock("paragraph", "inner toggle text")
#' moreStuffForToggle <- createTextBlock("quote", "Woof woof")
#' finalToggleBlock <- addChildren(toggleBlock, stuffForToggle, moreStuffForToggle)
#' ## Pipe-friendly
#' finalToggleBlock <- createTextBlock("toggle","Outer toggle text") %>%
#' addChildren(createTextBlock("paragraph", "inner toggle text"), moreStuffForToggle)
addChildren <- function(parentBlock, ...) {
  if ("children" %in% colnames(parentBlock[[3]])) {
    children <- purrr::map(list(...), jsonlite::unbox)
    parentBlock[[3]]$children[[1]] <-
      purrr::splice(parentBlock[[3]]$children[[1]], children)
  } else {
    children <- purrr::map(list(...), jsonlite::unbox)
    parentBlock[[3]]$children <- list(children)
  }

  parentBlock
}
