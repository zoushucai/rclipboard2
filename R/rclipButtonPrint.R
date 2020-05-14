rclipButtonPrint = function(inputId, label, clipText, icon = NULL, width = NULL, modal = FALSE){
    temp = paste0(as.numeric(as.character(round(as.double(Sys.time())))),".txt")# 创建以时间为名称的文件名
    # 方法一
    sink(file = temp)
    print(clipText)
    sink()

    # 方法二:
    # capture.output(clipText, file = temp )

    session_txt = paste(readLines(temp,encoding = "UTF-8"),collapse ='\n',sep = "")
    file.remove(temp)
    return(rclipButton(inputId, label, session_txt, icon, width , modal))
}
