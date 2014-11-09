##sourceFile <- "./household_power_consumption.txt"
##powerConsumption <- read.table(sourceFile, sep = ";", header = T, na.strings = "?")
##data <- subset(powerConsumption, Date %in% c("1/2/2007", "2/2/2007"))

## Git Bash: Run the following two line code in Git Bash and not in R console or R Studio
head -n 1 ../household_power_consumption.txt > ./household_power_consumption_feb2007.txt
cat ../household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> ./household_power_consumption_feb2007.txt
## Ends here

sourceFile <- "./household_power_consumption_feb2007.txt"
data <- read.table(sourceFile, sep = ";", header = T, na.strings = "?")

data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## create a plot in the screen device
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     col = "red",
     xlim = c(0, 6),
     ylim = c(0, 1200),
     xaxp = c(0, 6, 3))

## Copy the plot to a file device (PNG file) with default width = 480px and height = 480px
dev.copy(png, file = "plot1.png")

## Close the file device
dev.off()