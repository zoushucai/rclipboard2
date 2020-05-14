# rclipboard: clipboard.js for R/Shiny Applications
参考： https://github.com/sbihorel/rclipboard

##   在此基础上新增函数 rclipButtonList

- 可用于一切可打印的R对象,包含`list` `,data.frame`, `matrix`等


```R
library(rclipboard2)
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
    rclipButtonList("default", "rclipButton Copy", iris, icon("clipboard"))
  })
  
  # 输出文本
  output$default <- renderPrint({
    iris
  })
  
}

shinyApp(ui = ui, server = server)

```
