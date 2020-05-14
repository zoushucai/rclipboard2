rclipButtonList = function(inputId, label, clipText, icon = NULL, width = NULL, modal = FALSE){
  if(is.list(clipText)){
    temp = paste0(as.numeric(as.character(round(as.double(Sys.time())))),".txt")# 创建以时间为名称的文件名
    sink(file = temp)
    print(clipText)
    sink()
    session_txt = paste(readLines(temp,encoding = "UTF-8"),collapse ='\n' )
    file.remove(temp)
    return(rclipButton(inputId, label, session_txt, icon, width , modal))
  }else if(is.character(clipText)){
    return(rclipButton(inputId, label, clipText, icon, width , modal))
  }else{
    return(error("The input is not a list"))
  }
}
