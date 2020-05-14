# rclipboard: clipboard.js for R/Shiny Applications
参考： https://github.com/sbihorel/rclipboard

在此基础上新增函数 rclipButtonList
可用于剪切 list, list包含data.frame
一个字符串（即纯文本）

```R
library(rclipboard)
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
      uiOutput("clip matrix"),
      uiOutput("clip vector")
    )

    # The server
    server <- function(input, output) {

      # 添加一个剪切板按钮--- 建议在server中添加
      output$clip <- renderUI({

        rclipButtonList("default1", "rclipButton list Copy",list1 , icon("clipboard"))
        rclipButtonList("default1", "rclipButton list Copy",list2 , icon("clipboard"))
        rclipButtonList("default1", "rclipButton date.frame Copy", df, icon("clipboard"))
        rclipButtonList("default2", "rclipButton matrix  Copy", M, icon("clipboard"))
        rclipButtonList("default3", "rclipButton vector Copy", V, icon("clipboard"))

      })
    }
    shinyApp(ui = ui, server = server)
    
```
