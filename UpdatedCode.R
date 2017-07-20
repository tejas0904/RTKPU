#fileName = "C:/Users/Tejas09/Desktop/docs/Concordia/Data Mining/project/processing_trial/trail.txt"
fileName   = "/Users/i862354/Desktop/txt_files/trial.txt"
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



listVector <- list()
varListVector<-0
a<-1
#find max set
max_set <- 0
#max_set[a+2] <- 1
print(max_set)
temp_set <- vector()
for(i in 1:5){
  p<-0
  temp_set<-0
  if(freq_matrix[i,i] == 1 && max_set == 0){
    max_set <- i
  }else if(freq_matrix[i,i] == 1){
    for(j in i:1){
      if(freq_matrix[i,j] == 1){
        temp_set[p+1] <- j
        p = p + 1
      }
    }
    # check if max set contains ,
    # /*  if(length(max_set)>1){
    #   set_max_set<-unlist(strsplit(max_set," "))
    #   print(set_max_set)
    #   }
    #   else{
    set_max_set <- max_set
    # }
    
    intersection_set<-intersect(temp_set,set_max_set)
    if(length(intersection_set) == length(set_max_set)){
      diff_set <- setdiff(temp_set,intersection_set)
      
      for(l in 1:length(diff_set))
      {
        
        # if(temp_set[l]%in%set_max_set){
        #   # max_set[a] <- i
        #   # temp_set<-0
        # }else{
        #max_set[a+1] <- ","
        if(length(diff_set)>=1){
          max_set[a+1] <- temp_set[l]
          #  temp_set<-0
          a = a + 1
          # }
        }
      }
    }
    else if(length(intersection_set)<length(set_max_set)){
      varListVector = varListVector + 1
      listVector[[varListVector]]<-max_set
      max_set<-set_max-set
    }
    else{
      pos<-Position(function(t) identical(t, set_max_set),listVector, nomatch = 0) 
      if(pos>0){
        listVector[]
      } 
    }
    
  }
}


print(freq_matrix)
print(max_set)
print(temp_set)






