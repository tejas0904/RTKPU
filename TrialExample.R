fileName = "C:\\Users\\urmil\\Desktop\\Plants.txt"
conn <- file(fileName,open='r')    
value <- count.fields(conn,sep=',')
getLineMax <- which.max(value)
maxLength <- max(value)
maxLength
totalLength<-length(value)
totalLength

matrixCSV <- matrix(0,totalLength,maxLength-1)
dim(matrixCSV)
#matrixCSV <- matrix(0,10,3)
#vect <- c("aa","bb","cc")
#colnames(matrixCSV)<- vect

conn <- file(fileName,open='r')
linn <- readLines(conn)

conn <- file(fileName,open='r')
colnames_vector <- regmatches(linn[getLineMax], regexpr(",", linn[getLineMax]), invert = TRUE)
colnames_vector <- colnames_vector[[1]][2]
final<-unlist(strsplit(colnames_vector,","))
length(final)

colnames(matrixCSV)<- final
k <- arrayInd(2, dim(matrixCSV))
colnames(matrixCSV)[k[,1]]
matrixCSV
close(conn)
