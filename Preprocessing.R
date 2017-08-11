#fileName = "C:\\Users\\urmil\\Desktop\\Plants.txt"
fileName = "C:/Users/Tejas09/Downloads/Plants.txt"
conn <- file(fileName,open='r')    
value <- count.fields(conn,sep=',')
getLineMax <- which.max(value)
maxLength <- max(value)
maxLength
totalLength<-length(value)
totalLength

matrixCSV <- matrix(0,totalLength,maxLength-1)
dim(matrixCSV)


conn <- file(fileName,open='r')
linn <- readLines(conn)

colnames_vector <- regmatches(linn[getLineMax], regexpr(",", linn[getLineMax]), invert = TRUE)

colnames_vector <- colnames_vector[[1]][2]
final<-unlist(strsplit(colnames_vector,","))
length(final)
colnames(matrixCSV)<- final
  conn <- file(fileName,open = "r")
  linn <- readLines(conn)
  #print(w)
  
  #check the rows
 
# Values <- 1:3
# Function <- function(i){
#     
#     #start.time <- Sys.time()
#     
#     w<-unlist(strsplit(linn[i],","))
#     
#     #check the columns
#     for(j in 1:69){
#       
#       p <- arrayInd(j, dim(matrixCSV))
#       
#       
#       if(colnames(matrixCSV)[p[,1]] %in% w)
#       {
#         matrixCSV[i,j] <- 1
#       }else{
#         matrixCSV[i,j] <- 0
#       }
#       
#     }
#     return(matrixCSV)
#   }  


# library(parallel)
# c1<- makeCluster(2,type = "PSOCK")
# 
# clusterExport(c1, list("linn","matrixCSV"))
# 
# a<-parLapply(c1,Values,Function)

library(doParallel)
c1<- makeCluster(3)
clusterExport(c1, list("linn","matrixCSV"))

library(foreach)

start.time <- Sys.time()
x<-foreach(i = 1:1)%dopar%{
  
  #start.time <- Sys.time()
  
  w<-unlist(strsplit(linn[i],","))
  
  #check the columns
  foreach(j = 1:69)%dopar%{
    
    p <- arrayInd(j, dim(matrixCSV))
    
    
    if(colnames(matrixCSV)[p[,1]] %in% w)
    {
      matrixCSV[i,j] <- 1
    }else{
      matrixCSV[i,j] <- 0
    }
    
  }
  return(matrixCSV)
  
  
}



stopCluster(c1)
  
#   library(doParallel)
# detectCores()
# c1<-makeCluster(3)
# registerDoParallel(c1)

end.time <- Sys.time()

#  end.time <- Sys.time()
  time.taken <- end.time - start.time
  print(time.taken)
  
head(x[1], n=10)
#stopCluster(c1)
close(conn)
