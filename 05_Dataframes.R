## INTRODUCTION
# A dataframe is a two-dimensional array-like structure in which each column 
# contains values of one variable and each row contains one set of values from 
# each column (similar to a table).
# Characteristics of a data frame:
# - column names should be non-empty.
# - row names should be unique.
# - The data stored in a data frame can be of numeric, factor or character type.
# - Each column should contain same number of data items.

# 1. Create a dataframe

# 1.1 Create an empty dataframe
#     This dataframe has neither a row nor a column (respective no column names yet)
df <- data.frame()
#     When filling the data frame, column- and rownames are assigned.
# 1.2 Create a dataframe manually
#     just as for the empty dataframe, the function data.frame is used.
#     After the column names and a = sign, a vector for each column is attached
#     and by comma separated (ATTENTION: all vectors need to be of the same size)
#     "stringsAsFactors" decides whether Strings will be used as character type
#     or as factor type (by default it is set to TRUE)
df1 <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Thomas","Axel","Frank","Gosia","Annika"),
  salary = c(450.6,515.2,611.0,729.0,380.2), 
  stringsAsFactors = FALSE
)
#     Alternatively, the function data.frame can take a matrix or variables
#     If the df is created from variables, variable names will be taken as
#     column names, for a matrix there are preselected columnnames
a <- c(10,20,30,40)
b <- c('book', 'pen', 'textbook', 'pencil_case')
c <- c(TRUE,FALSE,TRUE,FALSE)
d <- c(2.5, 8, 10, 7)
df2 <- data.frame(a,b,c,d)
Mat1 <- matrix(c(1, 5, 14, 23, 54, 9, 15, 85, 3, 42, 9, 7, 42, 87, 16), ncol=3)
df3 <- as.data.frame(t(Mat1))

# 1.3 Create a dataframe from stored data
#     to load data from csv, take a look at 00_DataLoad_DataSave.R
#     csv are automatically stored in dataframes:
#     with "header" you can define whether the csv contains columnnames or not
df4 <- read.csv("testdata/01_car1.csv",header=TRUE)
#     loading from an existing workspace is possible as well
df5 <- dget("workspacedata/cardata1.R")

# 2. Assigning column- and rownames
# 2.1 columnnames
namesdf2 <- names(df2)
#     setting the columnnames is using the names() function and assigning a vector
#     vector must have exactly the length the dataframe has columns
names(df2) <-c('ID', 'items', 'store', 'price')
namesdf2 <- names(df2)

# 2.2 rownames
#     vector to assign new rownames needs to have exactly amount of elements as df has rows
rownames <- row.names(df2)
row.names(df2) <- c('This','is','a','test')
rownames <- row.names(df2)

# 3. Gather information about existing dataframe
#    print the dataframe to the console
df2
#    print the dataframe structure
str(df2)
#    print the summary of the dataframe
summary(df2)


# 4. Select specific entries of a dataframe
#    Selecting specific rows/columns/items of a dataframe is called slicing
#    A data frame is composed of rows and columns, df[rows, columns]
#    Slicing can be specified by rows, columns or both:
#    selecting a specific row, but all columns: (result is a df as well)
row <- df2[2,]
#    selecting a specific column, but all rows: (result is a vector)
column <- df2[,3]
#    selecting a specific item:
item <- df2[2,3]
#    selecting a column by its name: (result is a vector)
column_by_name <- df4[,'age']
column_by_name2 <- df4$age
#    selecting multiple rows and columns at the same time
#    the following example will show the columns age and brand for the first 5 rows
my_selection <- df4[1:5,c('age','brand')]
#    subsetting with a condition is done with subset function: subset(df, condition)
my_subset <- subset(df4, subset = age >= 50)

# 5. Insert data into an existing dataframe
# 5.1 append a column
#     Appending a column is done creating a new vector (same length as df has rows)
#     After this the new column is appended using $ sign
location <- c('Germany', 'France', 'Spain', 'Italy')
df2$location <- location
#     Alternatively, a column can be added with the cbind() function
#     Therefore another df is created and then appended
regions <- data.frame(
  region = c("Hessen","Bretagne","Costa Brava","Tuscany"),
  stringsAsFactors = FALSE
)
df2 <- cbind(df2,regions)

# 5.2 inserting a row
#     To add more rows permanently to an existing data frame, we need to bring 
#     in the new rows in the same structure as the existing data frame and use 
#     the rbind() function. First: create the two data frames: We will take df1
#     and a new one (important: same structure!):
df1_append <- data.frame(
  emp_id = c (6:8), 
  emp_name = c("Ralph","Steffi","Wulf"),
  salary = c(627.9,832.1,880.2), 
  stringsAsFactors = FALSE
)
#     Bind the two data frames.
df1_finaldata <- rbind(df1,df1_append)


# 6. Remove data
# 6.1 remove a column
#     for removing a column, either you select all columns expect the one you 
#     want to delete, or by assigning NULL:
df2$location <- NULL
# 6.2 remove a row
#     for removing a row, either you select all rows except the one you want to delete,
#     or you build a subset (like explained in 4), or you kind of deselect all 
#     rows you want to delete:
df2_with_deleted_row <- df2[-c(3),]


# 7. Update/overwrite data
#    updating or overwriting data is done with selection
#    updating a single item means selecting this item and assigning a new value
df4[1,'age'] <- 18
#    The same applies for updating a whole row, column or just multiple entries
#    make sure the length of the input is exactly the length expected


# 8. Splitting a dataframe
# you can split your dataframe into multiple dataframes partitioned by a factor attribute
# result type is a list of dataframes
listOfsplittedDataframe <- split(df5,df5$brand)

rm(list=ls())

