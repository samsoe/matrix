library("dismo")

# read file
# data source download: http://bit.ly/2Z6hA8p
source = "~/Projects/matrix/output/temperature_precip-190604.csv"
MyData <- read.csv(file = source, header=TRUE, sep=",")

years = split(MyData, format(as.Date(MyData$datetime), "%Y"))

yr_num = names(years)

for (i in seq_along(years)) {
  tmin <- years[[i]]['tmin']
  tmax <- years[[i]]['tmax']
  prec <- years[[i]]['precip']
  biovars = biovars(prec, tmin, tmax)
  year <- yr_num[[i]]
  
  print(year)
  print(biovars)
}
