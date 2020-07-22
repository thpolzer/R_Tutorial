## 1. Create some dummy data
df <- data.frame(matrix(rnorm(3600,120000,5300),nrow=900))
names(df) <- c("Revenue.fy.2018","revenue2019","profit.fy.2018","profit2019")

# 1. Fixing character vectors - tolower(), toupper()
## Revenue.2018 is the only header with a capital letter, so this should be corrected
names(df)[1] <- tolower(names(df)[1])

# 2. Splitting strings strsplit()
## you might want to remove the dot
## since dot is a reserved character it must be escaped using \\
splitNames <- strsplit(names(df),"\\.")
splitNames[[1]][1]
splitNames[[1]][2]
splitNames[[1]][3]


# 3. Substitue strings
# sub() replaces the first occurence of a given character within a string by the value of a passed character
FirstOcc <- sub("\\.","-",names(df))
# gsub() replaces all occurences of a given character within a string by the value of a passed character
AllOcc <- gsub("\\.","-",names(df))
compare <- data.frame(list(FirstOcc,AllOcc))
names(compare) <- c(c("FirstOcc","AllOcc"))

# 4. Finding values grep()
## by default grep() returns the indices of the occurences of the search string
load("workspacedata/cardata.RData")
grep("Opel",cardata1$brand)
## if you set value=TRUE you get all hits
celebrities <- c("Thomas Müller","Brad Pitt", "Thomas Polzer","Emmanuel Macron","Udo Lindenberg")
grep("Thomas",celebrities, value = TRUE)

# 5. Length of a string
## empty space counts!
stringLength <- nchar("Usain Bolt")

# 6. Substring substr()
## besides the string you need to define the positions of the first and last character (each including)
substr("Manuel Neuer",8,12)

# 7. Concatenating strings paste()
## if no separator has been defined an empty space will be added automatically
paste("Thomas","Müller")
## otherwise you need to define a separator
paste("Thomas","Müller","Footballplayer",sep="-")
## or no separator 
paste("Thomas","Müller",sep="")
# equivalent
paste0("Thomas","Müller")

rm(list=ls())





