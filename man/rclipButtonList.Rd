\name{rclipButtonList}
\alias{rclipButtonList}
\title{Send to clipboard action button}
\description{Creates an action button that will send user-defined text to the OS clipboard.}
\usage{
  rclipButtonList(inputId, label, clipText, icon = NULL, width = NULL, modal = FALSE)
}

\arguments{
  \item{inputId}{The \code{input} slot that will be used to access the value.}
  \item{label}{The contents of the button or link--usually a text label, but
  you could also use any other HTML, like an image.}
  \item{clipText}{A list print text}
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
  \dontrun{
    library(rclipboard)
    library(shiny)

    # The UI
    ui <- bootstrapPage(
      # 剪切板声明
      rclipboardSetup(),

      # 在UI界面展示剪切板按钮
      uiOutput("clip"),

      # 输出文本
      verbatimTextOutput("default")
    )

    # The server
    server <- function(input, output) {

      # 添加一个剪切板按钮--- 建议在server中添加
      output$clip <- renderUI({
        rclipButtonList("default", "rclipButton Copy", sessionInfo(), icon("clipboard"))
      })

      # 输出文本
      output$default <- renderPrint({
          sessionInfo()
      })

    }

    shinyApp(ui = ui, server = server)
  }
}
