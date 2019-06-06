library("dismo")

# the biovars function in the dismo library requires average monthly temperature maximum, minimum and monthly accumulated precipitation values
# the data source was generated with this notebook: http://bit.ly/2QQbCWf

# data source download: http://bit.ly/2Z6hA8p
# read file

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
