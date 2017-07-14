fileName = "C:/Users/Tejas09/Desktop/docs/Concordia/Data Mining/project/processing_trial/trail.txt"
conn <- file(fileName,open='r')
linn <- readLines(conn)
freq_matrix <- matrix(0,5,5)

print(linn)

#calculate the frequency matrix
for(i in 1:6){

  w<-unlist(strsplit(linn[i],","))
  print(w)
  for(j in 1:5){
    for(k in 1:5){
      if(w[j]==w[k] && w[j]==1){
        freq_matrix[j,k]<-freq_matrix[j,k]+1
      }
    }
  }

}

#discritize
for(i in 1:5){
  for(j in 1:5){
    if(freq_matrix[i,j]>1){
      freq_matrix[i,j] <-1
    }else{
      freq_matrix[i,j] <-0
    }
    
  }
}



p<-1
a<-1
#find max set
max_set <- 0
#max_set[a+2] <- 1
print(max_set)
temp_set <- vector()
for(i in 1:5){
  if(freq_matrix[i,i] == 1 && max_set == 0){
    max_set <- i
  }else if(freq_matrix[i,i] == 1){
    for(j in i-1:1){
      if(freq_matrix[i,j] == 1){
        temp_set[p+1] <- j
      }
    }
    set_max_set<-unlist(strsplit(max_set,","))
    print(set_max_set)
print(temp_set)
    for(l in 1:length(set_max_set))
    {
      if(temp_set%in%set_max_set[l]){
        max_set[a] <- i
        temp_set<-0
      }else{
        max_set[a+1] <- ","
        max_set[a+1] <- temp_set+j
        temp_set<-0
      }
    }
  }
}


print(freq_matrix)
print(max_set)
print(temp_set)






