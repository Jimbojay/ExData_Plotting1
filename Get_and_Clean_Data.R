# activate packages
library(data.table)
library(lubridate)

# create source data folder if neccesary
if (!file.exists('PA Source Data')) {
        dir.create('PA Source Data')
}

# First check if the cleaned dataset already exists. If not the following code will apply
if (!file.exists('PA Source Data/household_power_consumption.txt')) {
        
        # download the data file and unpack the zip-tile
        file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
        download.file(file.url,destfile='PA Source Data/household_power_consumption.zip')
        unzip('PA Source Data/household_power_consumption.zip',exdir='PA Source Data',overwrite=TRUE)
        
        # read the raw data with a 2-day limit (1-2-2007 - 2-2-2007) 
        variable.class<-c(rep('character',2),rep('numeric',7))
        household.power.consumption<-read.table('PA Source Data/household_power_consumption.txt',header=TRUE,
                                      sep=';',na.strings='?',colClasses=variable.class)
        household.power.consumption<-household.power.consumption[household.power.consumption$Date=='1/2/2007' | household.power.consumption$Date=='2/2/2007',]
        
        # Add variable headers and configure date and time variables
        cols<-c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity',
                'Sub_metering_1','Sub_metering_2','Sub_metering_3')
        colnames(household.power.consumption)<-cols
        household.power.consumption$DateTime<-as.POSIXlt(dmy(household.power.consumption$Date)+hms(household.power.consumption$Time))
        household.power.consumption<-household.power.consumption[,c(10,3:9)]
        
        # write the cleaned dataset to a table on the disk
        write.table(household.power.consumption,file='PA Source Data/household_power_consumption.txt',sep='|',row.names=FALSE)
} else {
        
        household.power.consumption<-read.table('PA Source Data/household_power_consumption.txt',header=TRUE,sep='|')
##        household.power.consumption$DateTime<-as.POSIXlt(household.power.consumption$DateTime)
        
}

# remove the large raw data set 
#if (file.exists('PA Source Data/household_household_power_consumption.txt')) {
#        x<-file.remove('PA Source Data/household_household_power_consumption.txt')
#}