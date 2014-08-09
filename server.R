library(shiny)
library(ggplot2)
data(mtcars)

###change this as needed
#expData<-mtcars
#expDataName<-"MTCARS"
###

shinyServer(
    function(input,output){
        
    fieldNames<-reactive({
        dsName<-"mtcars";
        if(!is.null(input$dataSet)){
            dsName<-input$dataSet
        }
        data(list=c(dsName))
        d<-as.data.frame(get(dsName))
        if(dim(d)[2]==1){
            d<-cbind(seq_along(d[,1]),d,d)
            colnames(d)<-c('seq','data','copy')
        }
        if(dim(d)[2]==2){
            orig_names<-colnames(d)
            d<-cbind(seq_along(d[,1]),d)
            colnames(d)<-c('seq',orig_names)
        }
        
        
        if (dim(d)[1]>10000) {
            d<-d[1:10000,]
            output$warningO<-renderText("Data Too Large, Truncated to 10,000 rows")
        } else {
            output$warningO<-renderText("")
        }
        expData<<-d
        expDataName<<-toupper(dsName)
        rm(list=c(dsName),pos=sys.frame())
        as.list(names(d))
    })

    
       output$graphControlX <- renderUI({
           selectInput("axisX", "Choose X Axis", fieldNames(),selected = fieldNames()[[1]])
       })
       output$graphControlY <- renderUI({
           selectInput("axisY", "Choose Y Axis", fieldNames(),selected = fieldNames()[[2]])
        })
       output$graphControlC <- renderUI({
           selectInput("axisC", "Choose Color field", fieldNames(),selected = fieldNames()[[3]])
       })
        
        output$dataSetList <- renderUI({
            ds<-data()
            selectInput("dataSet", "", ds$results[,3],selected = "mtcars")
        })
    
       
       output$Oplot <- renderPlot({
         
          if(is.null(input$axisX)){
              axisX<- fieldNames()[[1]]
              axisY<- fieldNames()[[2]]
              axisC<- fieldNames()[[3]]
          } else {
              axisX<- input$axisX
              axisY<- input$axisY
              axisC<- input$axisC
              
          }
            cData<-expData[,axisC]
            if(input$CasFactor){
                cData<-as.factor(cData)
            }
            plot<-qplot(x=expData[,axisX],y=expData[,axisY],
                   color=cData,
                   main=expDataName,xlab=axisX,ylab=axisY)
            if(is.factor(cData)){
                plot<-plot+scale_color_discrete(name=axisC) 
            } else {
                plot<-plot+scale_color_continuous(name=axisC) 
            }
            if(input$showLM){
                plot<-plot+geom_smooth(method="lm")
            }
            plot
          
       })
           
    output$Otable <- renderDataTable({expData })
       
    })