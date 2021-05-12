library(dplyr)

##
library(nycflights13)
dim(flights)
flights<-flights

##
head(flights,10)
filter(flights, month==1, day==1)

##
arrange(flights, year, month, day)

##
arrange(flights, desc(arr_delay))

##
#Select columns by name
select(flights, year, month, day)

#select all columns between year and day(inclusive)
select(flights,year:day)

select(flights,year:dep_delay)

#Select all columns except those from year to day ( inclusive)
select(flights,-(year:day))


#Create new columns-----

f1<-mutate(flights,
       gain=arr_delay-dep_delay,
       speed= distance/air_time*60)
f2<-mutate(f1,
           gain_per_hour = gain/(air_time/60))

##
sample_n(flights,10)

sample_frac(flights,0.01)

###
destinations <- group_by(flights, dest)
summarise(destinations,
        planes=n_distinct(tailnum),
        flights=n())

###
daily <- group_by(flights, year, month,day)
(per_day <- summarise(daily, flights=n()))
(per_month<- summarise(per_day, flights=sum(flights)))
(per_year <- summarise(per_month, flights = sum(flights)))


###
# Year represents the integer 1
select(flights,year)
select(flights,1)

##
filter(
  summarise(
    select(
      group_by(flights, year, month, day),
      arr_delay, dep_delay),
    arr=mean(arr_delay, na.rm=TRUE),
    dep=mean(dep_delay, na.rm=TRUE),
    arr>30 | dep>30
  )
)










write.csv(flights,"dataset.csv")
