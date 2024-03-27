roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)  
}

roll()

---------------------------------

(x = matrix(1:4, 2, 2))

(y = matrix(rep(10, 1), 2, 2))

x * y

x %*% y

---------------------------------

k = Sys.time(); k
class(k)

p = as.POSIXlt(k)
names(unclass(p))
?names

dtstring = c("January 10, 2012 10:40", "December 9, 2011 9:10")
x = strptime(dtstring, "%B %d, %Y &H:&M")

rnorm(10)
x = list(a = 1:5, b = rnorm(10))
lapply(x, mean)
sapply(x, mean)
class(mean)

names(x)

x = list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x

lapply(x, function(elt) { elt[,1] })

library(datasets)
head(airquality)
s = split(airquality, airquality$Month)
str(s)
?str
sapply(s, function(x) {colMeans(x[, c("Ozone", "Solar.R", "Wind")])})

------------------------------
  
x = rnorm(9)
lev = gl(3,4,labels = c("Ocak","Şubat","Mart"))
?gl

lev

a =jsonlite::fromJSON("https://raw.githubusercontent.com/COMU-BLM4022/Exercises/main/Week4/Exercise1/example_2.json")

a
  length(a$quiz$sport$q1$options)

answers = sapply(a$quiz$maths, function(x) {
  x$options[1]
})
answers

grps = split(length(a$quiz$maths), a$quiz$maths)

dygraphs


---------------------------------------------------------------

library(readxl)

# excel okuma
#k = as.data.frame(read_excel("hava.xlsx"))
x = read_excel("hava.xlsx")
x = x[-1,]
havaK = as.data.frame(x)
names(havaK) = c("Time", "PM10", "PM2.5", "SO2", "CO", "NO2",  "NOX", "NO")

# POSIXct yapma
havaK$Time = as.POSIXct(havaK$Time)

# numeric çevirme için . ve , kurtulma işlemi
havaK[, 2:8] = sapply(havaK[, 2:8], function(x) {
  gsub("\\.", "", x)
})
havaK[, 2:8] = sapply(havaK[, 2:8], function(x) {
  gsub(",", ".", x)
})

# numeric yapma işlemi
havaK[, 2:8] = sapply(havaK[, 2:8], as.numeric)


library(dygraphs)
dygraph(havaK, x = "Time") %>%
  dySeries("PM10", label = "PM10") %>%
  dySeries("NO2", label = "NO2")

dygraph(havaK) %>%
  dyAxis("x", label = "Time") %>%
  dySeries("PM10", label = "PM10") %>%
  dySeries("CO", label = "CO") %>%
  dyOptions(stackedGraph = TRUE)

--------------------------------------------------




  