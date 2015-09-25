
pollutantmean <- function(directory, pollutant, id = 1:332)
   {
     allPollutantData <- vector(mode="numeric", length = 0)
     if(directory == "specdata")
     {
       directory <- getwd()
     }
     
     files <- list.files(directory, full.names = TRUE)
     filesToProcess <- files[id]
     
      for(path in filesToProcess)
        {
          currentPollData <- getPollutantData(path, pollutant)
          allPollutantData <-  append(allPollutantData, currentPollData, after = length(allPollutantData))
        }
      
      meanResult <- mean(allPollutantData) 
      meanResult
  
     }


getPollutantData <- function(path, pollutantName){
  
  monitorData <- read.csv(path)
  pollData <- monitorData[pollutantName]
  pollDataNoNa = pollData[!is.na(pollData)]
  pollDataNoNa
  
  
}
