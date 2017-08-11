#Read the Txs
fileName="/Users/i862354/Desktop/Plants_Updated.txt"
conn <- file(fileName,open='r')
linn <- readLines(conn)
#find total number of lines
totalLength<-length(linn)
conn <- file(fileName,open='r')
value <- count.fields(conn,sep=',')
maxLength <- max(value)

#create m*m matrix
freq_matrix <- matrix(0,maxLength,maxLength)
start.time <- Sys.time()

#calculate the frequency matrix
for(i in 1:totalLength){
  w<-unlist(strsplit(linn[i],","))
  w<-sort(w) 
  w<-as.numeric(w)
  for(j in w){
   
    for(k in w){
        
        freq_matrix[k,j]<-freq_matrix[k,j]+1
        }
  }
}

print(freq_matrix)
# Descritize matrix by prividing support
for(i in 1:maxLength){
  for(j in 1:maxLength){
    if(freq_matrix[i,j]>(0.15*totalLength)){
      freq_matrix[i,j] <-1
    }else{
      freq_matrix[i,j] <-0
    }
  }
}



#finding frequent item sets
p<-1
final_states <- list()
t4<-Sys.time()
for(i in 1:maxLength){
  p<-1
  temp_set<- 0
  if(freq_matrix[i,i] == 1 && length(final_states) == 0){
    final_states[[1]] <- as.numeric(i) 
  }else if(freq_matrix[i,i] == 1){
    k<-i-1
    for(j in 1:k){
      if(freq_matrix[i,j] == 1){
        temp_set[p] <- as.numeric(j)
        p<-p+1
      }
    }
    for(l in 1:length(final_states))
    {
      t<-Position(function(x) identical(x, temp_set), final_states, nomatch = 0)
      if(t!=0){
        final_states[[t]] <- c(final_states[[t]],as.numeric(i))
        break
      }else{
        if(temp_set != 0)
          {
            final_states[[length(final_states)+1]] <- temp_set
            final_states[[length(final_states)]] <- c(final_states[[length(final_states)]], as.numeric(i))
            break
          }else{
          final_states[[length(final_states)+1]] <- as.numeric(i)
          break
          }
      }
    }
  }
}
end.time<-Sys.time()
time.taken <- end.time - start.time
print(time.taken)
remove_set<-vector()
#print(freq_matrix)
print(final_states)
final_set<-list()
j<-1
for(i in 1:length(final_states)){
  if(length(final_states[[i]])>=2){
    final_set[[j]]<-final_states[[i]]
    j<-j+1
  }
}

fileName = "/Users/i862354/Desktop/Plants.txt"
conn <- file(fileName,open='r')
value <- count.fields(conn,sep=',')
getLineMax <- which.max(value)
getLineMax
maxLength <- max(value)
maxLength

conn <- file(fileName,open='r')
linn <- readLines(conn)

colnames_vector <- regmatches(linn[getLineMax], regexpr(",", linn[getLineMax]), invert = TRUE)
colnames_vector <- colnames_vector[[1]][2]
final<-unlist(strsplit(colnames_vector,","))
print("Final set with frequent items is")
for(i in 1 : length(final_set)){
  print(i)
  
  for(j in 1:length(final_set[[i]])){
    print(final[final_set[[i]][j]])
  }
}
