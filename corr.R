
# All the correlations between sulphate and nitrate from all monitors
# that are greater than a specified threshold.
# If no monitors match a threshold, then a vector of length 0 is returned.

corr <- function (directory, threshold = 0)
{
  id <- 1:332
  result <- vector(mode="numeric",length = 0)
  
  if(directory =="specdata")
  {
    directory = getwd()
  }
  
  files <- list.files(directory, full.names = TRUE)
  
  for(i in id)
  {
   
      path <- files[i]
      monitor_data <- read.csv(path)
      comp_cases <-  monitor_data[complete.cases(monitor_data),1:4]
      
      numb_rows <- nrow(comp_cases)
      if(numb_rows > threshold)
      {
        correlation <- cor(comp_cases$sulfate, comp_cases$nitrate)
        result <- append(result, correlation, after = length(result))
      }
      
  }
  
  result    #if none matches, the vector will be empty
}