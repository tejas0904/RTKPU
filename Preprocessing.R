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
  
  start.time <- Sys.time()
  #check the rows
for(i in 1:3){
  #start.time <- Sys.time()
  
  w<-unlist(strsplit(linn[i],","))
  
  #check the columns
  for(j in 1:69){
    
    end.time <- Sys.time()
  
    p <- arrayInd(j, dim(matrixCSV))
    
    
      if(colnames(matrixCSV)[p[,1]] %in% w)
      {
        matrixCSV[i,j] <- 1
      }else{
        matrixCSV[i,j] <- 0
      }

}
  
}  
#  end.time <- Sys.time()
  time.taken <- end.time - start.time
  print(time.taken)
  
head(matrixCSV, n=10)

close(conn)
