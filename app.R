library(shiny)
library(audiorecordR)

ui <- fluidPage(
  titlePanel("Audio recorder / RShiny"),
  # AudioReactRecorderOutput('widgetOutput')
  AudioReactRecorder()
)

server <- function(input, output, session) {
  # output$widgetOutput <- renderAudioReactRecorder(
  #   AudioReactRecorder("Hello world!")
  # )
}

shinyApp(ui, server)
