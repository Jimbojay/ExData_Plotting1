# load data
source('Get_and_Clean_Data.R')

# open device
png(filename='plot2.png',width=480,height=480,units='px')

# plot data
plot(household.power.consumption$DateTime,household.power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()