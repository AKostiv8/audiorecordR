library(shiny)
library(audiorecordR)

# ui <- fluidPage(
#
#   tags$head(
#     tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
#   ),
#
#   titlePanel("Audio recorder / RShiny"),
#   # AudioReactRecorderOutput('widgetOutput')
#   div(class='row',
#       div(class='box_one',
#           AudioReactRecorder()
#       ),
#       div(class='box_twp'
#
#       )
#   )
# )
ui <- div(class='container',
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "simple-grid.min.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    div(class='row',
      div(class='col-2',
          div(class='card')
          ),
      div(class='col-4',
          div(class='card')
          ),
      div(class='col-6',
          div(class='card')
      )
    ),
    div(class='row',
        div(class='col-6',
            div(class='card')
        ),
        div(class='col-6',
            div(class='card')
        )
    )
)

server <- function(input, output, session) {
  # output$widgetOutput <- renderAudioReactRecorder(
  #   AudioReactRecorder("Hello world!")
  # )
}

shinyApp(ui, server)
