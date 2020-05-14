# rclipboard: clipboard.js for R/Shiny Applications

参考： https://github.com/sbihorel/rclipboard
##  在此基础上新增函数 rclipButtonList
+  可用于剪切 list, list包含data.frame
+  一个字符串（即纯文本）


```R
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

```


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
