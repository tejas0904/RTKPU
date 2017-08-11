library(arules)
library(arulesViz)

plants <- read.transactions("/Users/i862354/Desktop/Plants.txt",format = "basket",sep = ",")

#iteration for joining phase
old <- Sys.time()
old
itemsets <- eclat(plants, parameter = list(minlen=2,support=0.15, target="frequent itemsets"))

inspect(head(sort(itemsets,by="support"),10))
check<-Sys.time()
new <- check-old

#iteration for prune phase
# old <- Sys.time()
# itemsets <- apriori(plants, parameter = list(support=0.12,confidence=0.9, target="rules"))
# new <- Sys.time()-old
# inspect(head(sort(itemsets,by="lift"),10))

print(new)
