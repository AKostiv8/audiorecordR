#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
PlayRecord <- function(..., width = 'fit-content', height = 'fit-content', elementId = NULL) {

  # describe a React component to send to the browser for rendering.
  # component <- reactR::reactMarkup(htmltools::tag("div", list(message)))
  component <- reactR::reactMarkup(reactR::component("PlayRecordCustom", list(...)))

  # create widget
  htmlwidgets::createWidget(
    name = 'PlayRecord',
    component,
    width = width,
    height = height,
    package = 'audiorecordR',
    elementId = elementId
  )
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @noRd
widget_html.PlayRecord <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}

#' Shiny bindings for PlayRecord
#'
#' Output and render functions for using PlayRecord within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a PlayRecord
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name PlayRecord-shiny
#'
#' @export
PlayRecordOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'PlayRecord', width, height, package = 'audiorecordR')
}

#' @rdname PlayRecord-shiny
#' @export
renderPlayRecord <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, PlayRecordOutput, env, quoted = TRUE)
}
