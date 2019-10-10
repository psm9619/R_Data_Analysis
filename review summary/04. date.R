# Date & Time

# In R, regular format of date & time is 'Yr(full)-mon-date' & 'hr(in 24hr format)-min-sec time zone'
Sys.Date() ; Sys.time()     # prints the current date ; prints full date time time zone
# in American style, 
date()    # prints 'Day Mon(in 3 letter) Date Time Year' (ex. Sun Jun 09 21:58:29 2019)

# If you type in the date like "2019-05-30", it is "" -> character class
class ("2019-06-09")
# but if use the system's date function, class of Date data is "Date" type
class(Sys.Date())     #returns "Date" as a class
# converts the character string to a Date class data
a <- as.Date("2019-05-30")
class (a)

# If a typed-in date is in inofficial style, must provide the format = "..." that is used
as.Date("190530", format="%y%m%d")
as.Date("2019년 06월 15일", format = "%Y년 %m월 %d일")
as.Date ("05-30", format = "%m-%d")

# calculate the dates
as.Date(10, origin = Sys.Date())  # returns the date, 10 days from today 
# can't calculate using dates in Character type. must convert to Date beforehand 
# "2019-06-30" - "2019-06-15"
as.Date("2019-06-30")- as.Date("2019-06-15") 

# simple calculations 
d <- d - days(2)  ; d
d + years(1)
d + months(-2)


# -------------------------------------------------------------------------------------------
install.packages("lubridate") #consistent and memorable syntax to help working with dates
library (lubridate)
#---------------------------------------------------------------------------------------------

# getting current date is easier now! (Dont' need to type Sys.Date())
now ()
year(now()) ; month(now()) ; day(now())
wday(now()) # counts from the first day of wk (Sun is 1st day, Sat is 7th day)
month (now(), label = T) ; wday(now(), label = T)  #returns the current & list of labels in order

h_1 <- hm("22:30")  ; h_1  # 22H 30M 0S -> Hr, Min, Sec
h_2 <- hms("22:30:14")  ; h_2  # 22H 30M 14S -> H,M,S



























