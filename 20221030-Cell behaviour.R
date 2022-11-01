library(tidyverse)

# Group I cells
set.seed(123)
cell.size = rnorm(100, mean=6, sd=4)
#hist(cell.size, probability=TRUE)

cell.mobility = rnorm(100, mean = 0.2, 0.3)
#hist(cell.mobility, probability=TRUE)

cell.cycle = sample(c("G1","S","G2","S"),100,replace=TRUE)
cell.group = rep("group1", 100)

cell.distance = rnorm(100, mean=2, sd=0.2)
#hist(cell.distance, probability=TRUE)

group1 =data.frame(cell.size, cell.mobility, cell.cycle, cell.distance, cell.group)


#sample(x, size, replace = FALSE, prob = NULL)
set.seed(123)
cell.size = rnorm(100, mean=8, sd=4)
#hist(cell.size, probability=TRUE)

cell.mobility = rnorm(100, mean = 0.4, 0.3)
#hist(cell.mobility, probability=TRUE)

#prob giving wight of probeblity
#cell.cycle = sample(c("G1","S","G2","S"),1000,replace=TRUE, prob = c(0.2, 0.65, 0.1, 0.05))
cell.cycle = sample(c("G1","S","G2","S"),100,replace=TRUE)
cell.group = rep("group2", 100)

cell.distance = rnorm(100, mean=6, sd=0.2)
#hist(cell.distance, probability=TRUE)
group2 =data.frame(cell.size, cell.mobility, cell.cycle, cell.distance, cell.group)

database = rbind(group1, group2)
mydata = database
mydata$cell.cycle = factor(mydata$cell.cycle, 
                           levels = c("G1", "S", "G2", "M"), labels=c(1, 2, 3,4))
mydata$cell.size = round(scale(mydata$cell.size), digits = 2)
mydata$cell.mobility = round(scale(mydata$cell.mobility), digits = 2)
mydata$cell.distance = round(scale(mydata$cell.distance), digits = 2)
mydata =mydata[, 1:4]

mydata.labels = database$cell.group
mydata$cell.cycle = as.numeric(mydata$cell.cycle)

library(umap)
mydata.umap <- umap(mydata)

layout <- mydata.umap[["layout"]] 
layout <- data.frame(layout) 
final <- cbind(layout, database$cell.group)


fig <- plot_ly(final, x = ~X1, y = ~X2, color = ~database$cell.group, colors = c('#636EFA','#EF553B'), type = 'scatter', mode = 'markers')%>%  
  layout(
    plot_bgcolor = "#e5ecf6",
    legend=list(title=list(text='species')), 
    xaxis = list( 
      title = "UMAP1"),  
    yaxis = list( 
      title = "UMAP2"))
fig
