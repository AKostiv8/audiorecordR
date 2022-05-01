#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
StartRecord <- function(..., width = 'fit-content', height = 'fit-content', elementId = NULL) {

  # describe a React component to send to the browser for rendering.
  # component <- reactR::reactMarkup(htmltools::tag("div", list(message)))
  component <- reactR::reactMarkup(reactR::component("StartRecordCustom", list(...)))

  # create widget
  htmlwidgets::createWidget(
    name = 'StartRecord',
    component,
    width = width,
    height = height,
    package = 'audiorecordR',
    elementId = elementId
  )
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @noRd
widget_html.StartRecord <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}

#' Shiny bindings for StartRecord
#'
#' Output and render functions for using StartRecord within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a StartRecord
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name StartRecord-shiny
#'
#' @export
StartRecordOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'StartRecord', width, height, package = 'audiorecordR')
}

#' @rdname StartRecord-shiny
#' @export
renderStartRecord <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, StartRecordOutput, env, quoted = TRUE)
}
