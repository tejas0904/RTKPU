# file name to be given as input
fileName = "/Users/i862354/Desktop/Plants.txt"
conn <- file(fileName,open='r')
#separate ecah line by ,
value <- count.fields(conn,sep=',')
#get line with max numner of states
getLineMax <- which.max(value)
getLineMax
#find max lengthof that line
maxLength <- max(value)
maxLength<-maxLength-1
#find total number of txs.
totalLength<-length(value)
totalLength

#create n*m matrix
matrixCSV <- matrix(0,totalLength,maxLength)
dim(matrixCSV)

conn <- file(fileName,open='r')
#read each txs from file
linn <- readLines(conn)

#get the names of each states
colnames_vector <- regmatches(linn[getLineMax], regexpr(",", linn[getLineMax]), invert = TRUE)


colnames_vector <- colnames_vector[[1]][2]
colnames_vector
#store each name in vector
final<-unlist(strsplit(colnames_vector,","))

# Transform each state name into unique number and save it in plants_updated file.
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
  write(final_text,file ="/Users/i862354/Desktop/Plants_Updated3.txt",append=TRUE)
}

#Read the transformed file to convert into binary form.
fileName = "/Users/i862354/Desktop/Plants_Updated.txt"
conn <- file(fileName,open='r')
line <- readLines(conn)

matrixCSV <- matrix(0,totalLength,maxLength)  
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
close(conn)
