complete <- function(directory, id = 1:332){
  
  if(directory =="specdata")
  {
    directory = getwd()
  }
  
  
  files <- list.files(directory, full.names = TRUE)
  filesToProcess <- files[id]
  nobs <- getCompleteCases(filesToProcess)
  result_frame <- data.frame(id, nobs)
  result_frame   
  
}




getCompleteCases <- function(files)
{
   result = vector(mode="numeric", length = 0)
   for(path in files)
   { 
     
     df = read.csv(path)
     completeCases = df[complete.cases(df),1:4]
     num_complete <- nrow(completeCases)
     result <- append(result, num_complete, after = length(result))
   }
   
   result
}

