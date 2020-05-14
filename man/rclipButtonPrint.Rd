\name{rclipButtonPrint}
\alias{rclipButtonPrint}
\title{Send to clipboard action button}
\description{Creates an action button that will send user-defined text to the OS clipboard.}
\usage{
  rclipButtonPrint(inputId, label, clipText, icon = NULL, width = NULL, modal = FALSE)
}

\arguments{
  \item{inputId}{The \code{input} slot that will be used to access the value.}
  \item{label}{The contents of the button or link--usually a text label, but
  you could also use any other HTML, like an image.}
  \item{clipText}{A cat print text}
  \item{icon}{An optional \code{\link[shiny]{icon}} to appear on the button.}
  \item{width}{The width of the input, e.g. \code{'400px'}, or \code{'100\%'};
  see \code{\link[shiny]{validateCssUnit}}.}
  \item{modal}{A logical flag indicating whether the button will be shown in a
    modal window (TRUE) or not (NOT).}
}

\references{
  https://clipboardjs.com/
}
\seealso{
  \code{\link{rclipboardSetup}} \code{\link{rclipButton}}
}
\author{
  Sebastien Bihorel
}
\examples{
  ## Not run

  # example 1
  library(rclipboard2)
  library(shiny)
  list1 = sessionInfo()
  list2 = summary(iris)
  df = head(iris)
  M = matrix(1:6, ncol = 2, nrow = 3)
  V = c(letters[1:5],LETTERS[1:5])
  # The UI
  ui <- bootstrapPage(
    # 剪切板声明
    rclipboardSetup(),

    # 在UI界面展示剪切板按钮
    uiOutput("clip_list1"),
    uiOutput("clip_list2"),
    uiOutput("cilp_df"),
    uiOutput("clip_matrix"),
    uiOutput("clip_vector"),
    textAreaInput("paste", "Paste here:", width = "1000", height = '400px')
  )

  # The server
  server <- function(input, output) {

    # 添加一个剪切板按钮--- 建议在server中添加
    output$clip_list1 <- renderUI({
      rclipButtonPrint("default1", "rclipButton list1 Copy",list1 , icon("clipboard"))
    })
    output$clip_list2 <- renderUI({
      rclipButtonPrint("default2", "rclipButton list2 Copy",list2 , icon("clipboard"))
    })
    output$clip_df <- renderUI({
      rclipButtonPrint("default3", "rclipButton date.frame Copy", df, icon("clipboard"))
    })
    output$clip_matrix <- renderUI({
      rclipButtonPrint("default4", "rclipButton matrix Copy", M, icon("clipboard"))
    })
    output$clip_vector <- renderUI({
      rclipButtonPrint("default5", "rclipButton vector Copy", V, icon("clipboard"))
    })

  }
  shinyApp(ui = ui, server = server)
}


