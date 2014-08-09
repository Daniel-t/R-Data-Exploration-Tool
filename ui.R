library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("R Data Exploration Tool"),
    sidebarPanel(
        h3("Specify Dataset"),
        uiOutput("dataSetList"),
        h3("Graph Settings"),
        uiOutput("graphControlX"),
        uiOutput("graphControlY"),
        uiOutput("graphControlC"),
        checkboxInput(inputId = "CasFactor",label = "Color As Factor",value = F),
        checkboxInput(inputId = "showLM",label = "Show Linear Regression Line",value = F)
      
    
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", imageOutput('Oplot')), 
            tabPanel("Table", dataTableOutput("Otable")),
            tabPanel("Documentation/HELP",includeMarkdown("assets/help.md"))
        ),
        textOutput(outputId = 'warningO')
    )
))