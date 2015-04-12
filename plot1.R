# load data
source('Get_and_Clean_Data.R')

# open device
png(filename='plot1.png',width=480,height=480,units='px')

# plot data
hist(household.power.consumption$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
dev.off()



