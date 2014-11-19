shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    
    Z <- rnorm(100)
    W <- 10 + input$dif*Z + rnorm(100, sd=0.4)
    
    a <- qplot(x=Z, y = W, geom="point") 
    a <- a + geom_smooth(method="lm") + theme_bw() + ylim(6.5, 12)
    
    b <- ggplot() + geom_density(aes(x=x, y = ..count..), colour="red", adjust = 4, fill= "red", alpha = 0.5, data=data.frame(x=rnorm(200, 0, 0.5), grp="x")) + xlim(c(-4, 4))
    b <- b + geom_density(aes(x=x, y = ..count..), colour="blue3", adjust = 4, fill = "blue3", alpha = 0.5, data= data.frame(x=rnorm(100, input$dif, 0.5), grp="x"))
    b <- b + geom_vline(xintercept = 0) 
    b <- b + geom_vline(xintercept = input$dif) 
    b <- b + theme_bw() 
    grid.arrange(a, b, ncol=2)
  })
})
