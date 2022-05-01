library(shiny)
library(audiorecordR)
library(shinyStore)
library(jsonlite)
library(av)
library(phonTools)
library(base64enc)



ui <- div(class='container',
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "simple-grid.min.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    div(class='row',
      div(class='col-6',
          div(class='card button_container',
              StartRecord(),
              StopRecord(),
              DownloadRecord(),
              PlayRecord()
              ),
          div(class='card spectogram_container',
              AudioReactRecorder(height = '100%', width = '100%')
          )
      ),
      div(class='col-6',
          div(class='card',
              uiOutput('chartone')
              )
      )
    ),
    div(class='row',
        div(class='col-6',
            div(class='card')
        ),
        div(class='col-6',
            div(class='card')
        )
    ),
    tags$script(src = "script.js")
)


server <- function(input, output, session) {
  # output$widgetOutput <- renderAudioReactRecorder(
  #   AudioReactRecorder("Hello world!")
  # )

  observe({
    print(input$foo)
    if(!is.null(input$foo)){

      a <- utils::browseURL(input$foo)
      print(a)
      # output$chartone <- renderUI({
      #   plot(read_audio_fft(dataURI(as.raw(input$foo), mime = "audio/wav;base64"), window = phonTools::windowfunc(1024, 'kaiser')))
      #
      # })
    }
  })

}

shinyApp(ui, server)


# ui <- div(class='container',
#     tags$head(
#       tags$link(rel = "stylesheet", type = "text/css", href = "simple-grid.min.css"),
#       tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
#     ),
#     div(class='row',
#       div(class='col-2',
#           div(class='card',
#               StartRecord(),
#               StopRecord(),
#               DownloadRecord()
#               )
#           ),
#       div(class='col-4',
#           div(class='card',
#               AudioReactRecorder(height = '100%', width = '100%')
#               )
#           ),
#       div(class='col-6',
#           div(class='card')
#       )
#     ),
#     div(class='row',
#         div(class='col-6',
#             div(class='card')
#         ),
#         div(class='col-6',
#             div(class='card')
#         )
#     )
# )
