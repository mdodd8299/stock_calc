# Puts the data from "applestock.csv" into an array called "appleArray"
f = File.new("applestock.csv", "r")
appleArray = f.readlines
f.close

# Establishes that certain variables are equal to 0
	# All the data poins combined is = "allDataAddedTogether"
	# Total number of data points = "numberOfDataPoints"
allDataAddedTogether = 0
numberOfDataPoints = 0

# Finds the total number of data points and the sum of all the data
appleArray.each do |original|
	arrayChangedToFloat = original.to_f
	allDataAddedTogether = allDataAddedTogether + arrayChangedToFloat
	numberOfDataPoints = numberOfDataPoints + 1
end

# Finds the mean of the data
mean = allDataAddedTogether / numberOfDataPoints

# Finds the distance between each point and the mean (uses absoulute value). Also makes a new array called "distanceFromMean" and stores the data in it
distanceFromMean = []

appleArray.each do |distance|
	difference = distance.to_f - mean
	absDifference = difference.abs
	distanceFromMean.push absDifference 
end

# Squares each of the difference's and puts it into the array "differenceSquared"
distanceSquared = []

distanceFromMean.each do |squared|
	newDistance = squared **2
	distanceSquared.push newDistance
end

# Assign the variable "squaredNumbersAddedTogether"
squaredNumberAddedTogether = 0
distanceSquared.each do |past|
	squaredNumberAddedTogether = squaredNumberAddedTogether + past
end

# Subtracts one from the total number of data points
oneLess = numberOfDataPoints - 1

# Divides "squareNumberAddedTogether" by "oneLess"
divided = squaredNumberAddedTogether / oneLess


final = divided **0.5

puts "Your standard deviation is: " + final.to_s
# Out put the "z-value"
zArray = []
distanceFromMean.each do |point|
	zValue = point / final
	zArray.push zValue.round(4)
end

zList = File.new("zValueList", "w")
zList.puts zArray.join ("\n")
zList.close

puts "In addition, a list of your z-values have been placed in a new file named 'zValueList'"


