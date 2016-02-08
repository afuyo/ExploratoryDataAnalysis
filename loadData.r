if(!file.exists("./exdata-data-NEI_data.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileUrl,"./exdata-data-NEI_data.zip")
  unzip("./exdata-data-NEI_data.zip")
}
## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")) {
  assign("NEI", readRDS("summarySCC_PM25.rds"), envir = .GlobalEnv)
}
## if SCC data frame is not already loaded, load it
if(!exists("SCC")) {
  assign("SCC", readRDS("Source_Classification_Code.rds"), envir = .GlobalEnv)
}


