library(shiny)
library(shiny.worker)
library(audiorecordR)
library(shinyStore)
library(jsonlite)
library(av)
library(phonTools)
library(base64enc)
library(shinycssloaders)
library(dplyr)
library(ggplot2)
library(seewave)
library(tuneR)
library(sound)


worker <- initialize_worker()

ui <- div(class='container',
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "simple-grid.min.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
      HTML('<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">')
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
              AudioReactRecorder(height = '100%',
                                 width = '100%',
                                 host = 'https://damp-earth-08851.herokuapp.com/upload'
                                 # host = 'http://www.bohemia.fun:2000/upload'
                                 )
          )
      ),
      div(class='col-6',
          div(class='card',
              height = '100%',
              plotOutput('wavespecto', height = '100%'),
              uiOutput('loader', height = '100%')
              )
      )
    ),
    div(class='row',
        div(class='col-6',
            div(class='card',
                height = '100%',
                uiOutput('videospecto', height = '100%'),
                uiOutput('loaderspecto',  height = '100%')
                )
        ),
        div(class='col-6',
            div(class='card',
                height = '100%',
                plotOutput('spectochart', height = '100%'),
                uiOutput('loaderspectochart',  height = '100%')
                )
        )
    ),
    tags$script(src = "scripts/require.js"),
    tags$script(src = "script.js")
)


server <- function(input, output, session) {

  observe({
    print(input$foo)
    if(!is.null(input$foo)){


      plotPromise <- worker$run_job("plotPromise",
        function(args) {
          Sys.sleep(5)
          download.file(url = 'http://www.bohemia.fun:2000/uploads/recording.wav', destfile = 'data/rec.wav')
        },
        args_reactive = reactive({
          input$foo
          print("triggered!")
          ""
        }),
        invalidate_time = 7000
        # ,
        # cancel_active_job_on_input_change = FALSE, # ignore input change, wait until resolved
        # value_until_not_resolved = NULL
      )



      output$loader <- renderUI({
        task <- plotPromise()
        if (!task$resolved) {
          div(
            div(class = "loader")
          )
        }
      })

      output$loaderspecto <- renderUI({
        task <- plotPromise()
        if (!task$resolved) {
          div(
            div(class = "loader")
          )
        }
      })

      output$loaderspectochart <- renderUI({
        task <- plotPromise()
        if (!task$resolved) {
          div(
            div(class = "loader")
          )
        }
      })


      output$wavespecto <- renderPlot({
        #  plot(
        #   read_audio_fft('data/rec.wav', window = phonTools::windowfunc(1024, 'kaiser'))
        # )
        task <- plotPromise()
        if (task$resolved) {
          # waver <- tuneR::readWave(filename = 'data/rec.wav')
          # seewave::ggspectro(wave = waver, ovlp = 50) +
          #   geom_tile(aes(fill = amplitude)) +
          #   stat_contour()
          fft_data <- read_audio_fft('data/rec.wav')
          plot(fft_data, dark = FALSE)

        }
      })

      output$videospecto <- renderUI({
        #  plot(
        #   read_audio_fft('data/rec.wav', window = phonTools::windowfunc(1024, 'kaiser'))
        # )
        task <- plotPromise()
        if (task$resolved) {
          av_spectrogram_video('data/rec.wav', output = 'www/dynamic/spectrogram.mp4', res = 144)

          tagList(
            tags$video(src = 'dynamic/spectrogram.mp4', height = '100%', width = '100%', controls = "controls", type = "video/mp4")
          )
        }
      })

      output$spectochart <- renderPlot({
        task <- plotPromise()
        if (task$resolved) {
          wavfile <- readWave(filename = 'data/rec.wav')
          # Left/right
          sound <- makesound(wavfile@left)
          spectrogram(sound, maxfreq = sound$fs/2)
        }
      })




    }
  })



}


shinyApp(ui, server)



