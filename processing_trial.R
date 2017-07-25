#fileName = "C:/Users/Tejas09/Desktop/docs/Concordia/Data Mining/project/processing_trial/trail.txt"
#fileName = "/Users/i862354/Desktop/txt_files/trial.txt"
fileName = "/Users/i862354/Desktop/trial.txt"
conn <- file(fileName,open='r')
linn <- readLines(conn)
totalLength<-length(linn)
#totalLength <- 15
conn <- file(fileName,open='r')
value <- count.fields(conn,sep=' ')
maxLength <- max(value)
maxLength

freq_matrix <- matrix(0,maxLength,maxLength)

start.time <- Sys.time()


# 
# library(doParallel)
# c1<- makeCluster(4)
# clusterExport(c1, list("linn","totalLength","maxLength","freq_matrix"))
# getDoParWorkers()
# library(foreach)

#calculate the frequency matrix
for(i in 1:totalLength){
  w<-unlist(strsplit(linn[i]," "))
  for(j in 1:maxLength){
    if(w[j]!=0){
    for(k in 1:maxLength){
      if(w[j]==w[k] && w[j]==1){
        freq_matrix[j,k]<-freq_matrix[j,k]+1
      }
    }
    }
  }
}
print(freq_matrix)
#write.table(freq_matrix, file="/Users/i862354/Desktop/chehhheheh.csv", row.names=FALSE, col.names=FALSE)
#write.table(freq_matrix, "/Users/i862354/Desktop/urmil.csv", sep=" ")
print(1)
#stopCluster(c1)
#discritize
for(i in 1:maxLength){
  for(j in 1:maxLength){
    if(freq_matrix[i,j]>4337){
      freq_matrix[i,j] <-1
    }else{
      freq_matrix[i,j] <-0
    }
  }
}

print(freq_matrix)
print(2)

#finding frequent item sets
p<-1
final_states <- list()

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

end.time <- Sys.time()
time.taken <- end.time - start.time
print(time.taken)

#print(freq_matrix)
print(final_states)

