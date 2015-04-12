# load data
source('Get_and_Clean_Data.R')

# open device
png(filename='plot4.png',width=480,height=480,units='px')

# make 4 plots within the png
par(mfrow=c(2,2))

# top-left plot
plot(household.power.consumption$DateTime,household.power.consumption$GlobalActivePower,xlab='',ylab='Global Active Power',type='l')

# top-right plot
plot(household.power.consumption$DateTime,household.power.consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')

# bottom-left plot
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(household.power.consumption$DateTime,household.power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(household.power.consumption$DateTime,household.power.consumption$SubMetering2,col=lncol[2])
lines(household.power.consumption$DateTime,household.power.consumption$SubMetering3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid',bty = "n")

# bottom-right
plot(household.power.consumption$DateTime,household.power.consumption$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')


# Turn off device
dev.off()