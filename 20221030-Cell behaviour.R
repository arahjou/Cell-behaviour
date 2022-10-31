library(tidyverse)

# Group I cells
set.seed(123)
cell.size = rnorm(1000, mean=6, sd=4)
hist(cell.size, probability=TRUE)

cell.mobility = rnorm(1000, mean = 0.2, 0.3)
hist(cell.mobility, probability=TRUE)

cell.cycle = sample(c("G1","S","G2","S"),1000,replace=TRUE)
cell.group = rep("group1", 1000)

cell.distance = rnorm(1000, mean=2, sd=0.2)
hist(cell.distance, probability=TRUE)

group1 =data.frame(cell.size, cell.mobility, cell.cycle, cell.distance, cell.group)


#sample(x, size, replace = FALSE, prob = NULL)
set.seed(123)
cell.size = rnorm(1000, mean=8, sd=4)
hist(cell.size, probability=TRUE)

cell.mobility = rnorm(1000, mean = 0.4, 0.3)
hist(cell.mobility, probability=TRUE)

#prob giving wight of probeblity
cell.cycle = sample(c("G1","S","G2","S"),1000,replace=TRUE, prob = c(0.2, 0.65, 0.1, 0.05))
cell.group = rep("group2", 1000)

cell.distance = rnorm(1000, mean=6, sd=0.2)
hist(cell.distance, probability=TRUE)
group2 =data.frame(cell.size, cell.mobility, cell.cycle, cell.distance, cell.group)

database = rbind(group1, group2)
mydata = database
mydata$cell.cycle = factor(mydata$cell.cycle, 
                           levels = c("G1", "S", "G2", "M"), labels=c(1, 2, 3,4))
mydata$cell.size = scale(mydata$cell.size)
mydata$cell.mobility = scale(mydata$cell.mobility)
mydata$cell.distance = scale(mydata$cell.distance)
mydata =mydata[, 1:4]


install.packages("RSpectra")
install.packages("umap")
library(umap)
pca(mydata)
