
#fileName = "/Users/i862354/Desktop/Plants1.txt"
fileName = "/Users/i862354/Desktop/Plants.txt"
conn <- file(fileName,open='r')
value <- count.fields(conn,sep=',')
getLineMax <- which.max(value)
getLineMax
maxLength <- max(value)
maxLength
totalLength<-length(value)
totalLength

matrixCSV <- matrix(0,totalLength,5)
dim(matrixCSV)

conn <- file(fileName,open='r')
linn <- readLines(conn)

colnames_vector <- regmatches(linn[getLineMax], regexpr(",", linn[getLineMax]), invert = TRUE)


colnames_vector <- colnames_vector[[1]][2]
colnames_vector
final<-unlist(strsplit(colnames_vector,","))
pos<-match("nv",final)
pos
for(i in 1:totalLength){
  final_text<-c()
  w<-unlist(strsplit(linn[i],","))
  for(j in 1:length(w)){
    pos<-match(w[j],final)
    if(!is.na(pos)){
      final_text<-paste(pos,final_text,sep=",")
    }
    if(j == length(w)){
      chh<-typeof(final_text)
      final_text<-substr(final_text,1,nchar(final_text)-1)
    }
  }
  write(final_text,file ="/Users/i862354/Desktop/Plants_Updated.txt",append=TRUE)
}

fileName = "/Users/i862354/Desktop/Plants_Updated.txt"
conn <- file(fileName,open='r')
line <- readLines(conn)
totalLength<-length(line)
totalLength
matrixCSV <- matrix(0,totalLength,69)  
#check the rows
for(i in 1:totalLength){
  
  w<-as.numeric(unlist(strsplit(line[i],",")))
  #check the columns
  for(j in 1:length(w)){
    matrixCSV[i,w[j]]<-1
  }
}
matrixCSV
write.table(matrixCSV, file="/Users/i862354/Desktop/trial.txt", row.names=FALSE, col.names=FALSE)
fileName1 = "/Users/i862354/Desktop/Plants1.txt"
finalMatrix <- matrix(0,5,5)
colnames(finalMatrix)<- c("a","b","c","d","e")
rownames(finalMatrix)<- c("a","b","c","d","e")
conn <- file(fileName1,open='r')  
txs <- readLines(conn)
ABCmatrix <- matrix(0,6,5)
cols
for(i in 1:6){
  cols<- regmatches(txs[i], regexpr(",", txs[1]), invert = TRUE)
  cols_1 <- cols[[1]][2]
  print(length(cols_1))
}

close(conn)

finalMatrix

#head(matrixCSV, n=5)
close(conn)
