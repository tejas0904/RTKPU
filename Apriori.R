library(arules)
library(arulesViz)

#plants <- read.transactions("~/RTKPU/Plants.txt",format = "basket",sep = ",")

#iteration for joining phase
old <- Sys.time()
itemsets <- apriori(plants, parameter = list(minlen=3,maxlen=3,support=0.13, target="frequent itemsets"))
new <- Sys.time()-old
inspect(head(sort(itemsets,by="support"),10))


#iteration for prune phase
# old <- Sys.time()
# itemsets <- apriori(plants, parameter = list(support=0.12,confidence=0.9, target="rules"))
# new <- Sys.time()-old
# inspect(head(sort(itemsets,by="lift"),10))

print(new)
