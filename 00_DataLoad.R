setwd("/home/ubuntu/R_Tutorial")

#### 1. Load csv file from filesystem ####
# Pls keep in mind:
#   Use read.csv when Comma is default separator and dot is used for decimals
#   Use read.csv2 when Semicolon is default separator and Comma is used for decimals
cardata1 <- read.csv("testdata/01_car1.csv",header=TRUE)
cardata2 <- read.csv2("testdata/02_car1.csv",header=TRUE)

#### 2. Load table from database ####
# in this example we'll be using MySQL database
# if not done before you need to install the RMySQL package first => install.packages("RMySQL")
library(RMySQL)
conn = dbConnect(MySQL(), user='ruser', password='BqWy6015', dbname='rtutorial', host='localhost')

## 2.1 list all tables
tables <- dbListTables(conn = conn)

## 2.2 retrieving data
# 2.2.1 fetch data
rs <- dbSendQuery(conn, "select * from cardata")
# 2.2.2 convert result into R specific dataframe
# The n in the function specifies the number of records to retrieve, using n=-1 retrieves all pending records
cardata <- fetch(rs,n=-1)

## 2.3 write table
# code has been commented out since repeated calls lead to a database error (creating a table that already exists)
#res <- dbWriteTable(conn, name='cardata_prices1', value=cardata2)

## 2.4 disconnect from database
dbDisconnect(conn)
rm(conn,rs,tables)


#### 3. Save data from existing workspace into a file and load it into new workspace

## 3.1 Textual format
# 3.1.1 saving and loading one single object: Use dput() function
# The file to be created needs to come with extension ".R"
dput(cardata1,file = "workspacedata/cardata1.R")
# if you want to load this data into your new workspace load it with dget() function
rm(cardata1) # remove cardata1 from workspace to see the effect in the next command
cardata1 <- dget("workspacedata/cardata1.R")
show(cardata1)
# 3.1.2 saving and loading multiple objects: Use dump() function (note: object names to be put in quotes inside the vector)
dump(c("cardata1","cardata2"),file = "workspacedata/cardata_objects.R")
# if you want to load this data into your new workspace load it with source() function which is the inverse of dump()
rm(cardata1,cardata2) # remove cardata1 and cardata2 from workspace to see the effect in the next command
source("workspacedata/cardata_objects.R")

## 3.2 Binary format
# with numeric data, one can often lose precision when converting to and from a textual format, so it’s better to stick 
# with a binary format.
# 3.2.1 saving and loading one single object: Use save() function, use ".rda" extension for the file
save(cardata1,cardata2, file = "workspacedata/cardata_binaryFormat.rda")
# if you want to load this data into your new workspace load it with load() function
rm(list=ls()) # clear workspace to see the effect in the next command
load("workspacedata/cardata_binaryFormat.rda") # workspace is back again
# 3.2.2 saving and loading multiple object: Use save() function, use ".RData" extension for the file (=convention)
save.image(file = "workspacedata/cardata.RData")
rm(list=ls()) # clear workspace to see the effect in the next command
load("workspacedata/cardata.RData") # workspace is back again

#### 4. Garbage Collector
# it is important to note that the two are very different in that gc does not delete any variables that you are still using - 
# it only frees up the memory for ones that you no longer have access to (whether removed using rm() or, say, created in a function 
# that has since returned). Running gc() will never make you lose variables.
# The question of whether you should call gc() after calling rm(), though, is a good one. The documentation 
# https://stat.ethz.ch/R-manual/R-patched/library/base/html/gc.html
# for gc helpfully notes:
# A call of gc causes a garbage collection to take place. 
# This will also take place automatically without user intervention, and the primary purpose of calling gc is for the report on 
# memory usage.
# However, it can be useful to call gc after a large object has been removed, as this may prompt R to return memory to the operating system.
rm(list=ls()) 
gc()
