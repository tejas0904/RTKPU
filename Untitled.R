# x<-list()
# x[[1]]<-c(1,2,3)
# x[[2]]<-c(2,3,4)
# y<-2
# if(y%in%list(x)){
#   print("inside")
# }
# 
# Position(function(t) identical(t, y), x, nomatch = 0) > 0
final_states <- list()
final_states[[1]]<-c(1)

state <- 1
t<-Position(function(x) identical(x, state), final_states, nomatch = 0) 
t

temp <- 5

final_states[[2]] <- c(final_states[[2]], c(temp))
print(final_states)
length(final_states)