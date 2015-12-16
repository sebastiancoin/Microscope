# backend 
server <- shinyServer(function(input, output) {	
  #once again, use this when attempting fileInput
  datasetInput <- reactive({
    inFileTwo <- input$filename
    
    if (is.null(inFileTwo))
      return(NULL)
  
     data.matrix(read.csv(inFileTwo$datapath, header=TRUE, sep=",", quote=input$quote, row.names=1))
    

  })
  
    output$heatmap<-renderD3heatmap(
 
    
      if(!is.null(datasetInput()))
       d3heatmap( 
      datasetInput(),
      cexRow=0.5,
      colors = input$choose,
      dendrogram = if (input$cluster) "row" else "none"
    )
    
  )
  
  #server <- function(input, output) {
  
})

		#don't forget these guys when trying to incorporate fileInput


