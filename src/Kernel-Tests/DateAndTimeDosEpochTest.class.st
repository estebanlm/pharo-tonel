"
SUnit test for dos epoch (see DateAndTime)
"
Class {
	#name : #DateAndTimeDosEpochTest,
	#superclass : #TestCase,
	#instVars : [
		'aDateAndTime',
		'aDuration',
		'aTimeZone',
		'localTimeZoneToRestore'
	],
	#category : #Kernel-Tests-Chronology,
	#timestamp : 'TorstenBergmann 2/5/2014 08:32'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>setUp [
	localTimeZoneToRestore := DateAndTime localTimeZone.
	aDateAndTime :=  DateAndTime localTimeZone: TimeZone default; dosEpoch.
	aTimeZone := TimeZone offset: (Duration minutes: 135) name: 'DOS Epoch Test Time Zone' abbreviation: 'DTZ'.
	aDuration := Duration days: 1 hours: 2 minutes: 3 seconds: 4 nanoSeconds: 5 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>tearDown [
     "wish I could remove the time zones I added earlier, but there is no method for that"

     DateAndTime localTimeZone: localTimeZoneToRestore.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsDate [
	self assert: aDateAndTime asDate =   'January 1, 1980' asDate.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsDateAndTime [
	self assert: aDateAndTime asDateAndTime =  aDateAndTime
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsDuration [
	self assert: aDateAndTime asDuration =  0 asDuration
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsLocal [
	self assert: aDateAndTime asLocal =  aDateAndTime.
	self assert: aDateAndTime asLocal = (aDateAndTime offset: aDateAndTime class localOffset)
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsMonth [
	self
		assert: aDateAndTime asMonth 
		equals: (Month year: 1980 month: 'January'). 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsNanoSeconds [
	self assert: aDateAndTime asNanoSeconds =  0 asDuration asNanoSeconds
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsSeconds [
	self assert: aDateAndTime asSeconds = 2492985600
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsTime [
	self assert: aDateAndTime asTime =  Time midnight.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsUTC [
	self assert: aDateAndTime asUTC =  aDateAndTime
          
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsWeek [
	self assert: aDateAndTime asWeek = (Week starting: '12-31-1979' asDate). 


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testAsYear [
	self assert: aDateAndTime asYear =   (Year starting: '01-01-1980' asDate). 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testCurrent [
	self deny: aDateAndTime =  (DateAndTime current).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDateTime [
	self assert: aDateAndTime =  (DateAndTime date: '01-01-1980' asDate time: '00:00:00' asTime)

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDay [
	self assert: aDateAndTime day =   DateAndTime new day

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDayMonthYearDo [
	|iterations|
	iterations := 0.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  iterations := iterations + 1])  = 1.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachYear])  = 1980.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachMonth]) = 1.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachDay]) = 1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDayOfMonth [
	self assert: aDateAndTime dayOfMonth  = 1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDayOfWeek [
	self assert: aDateAndTime dayOfWeek  = 3.
	self assert: aDateAndTime dayOfWeekAbbreviation = 'Tue'.
	self assert: aDateAndTime dayOfWeekName = 'Tuesday'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDayOfYear [
	self assert: aDateAndTime dayOfYear  = 1.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDaysInMonth [
	self assert: aDateAndTime daysInMonth  = 31.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDaysInYear [
	self assert: aDateAndTime daysInYear  = 366.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDaysLeftInYear [
	self assert: aDateAndTime daysLeftInYear  = 365.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testDuration [
	self assert: aDateAndTime duration  = 0 asDuration.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testEpoch [
	self assert: aDateAndTime =  '1980-01-01T00:00:00+00:00' asDateAndTime

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testFirstDayOfMonth [
	self assert: aDateAndTime firstDayOfMonth =   1

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testFromSeconds [
	self assert: aDateAndTime =  (DateAndTime fromSeconds: 2492985600).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testFromString [
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1980-01-01T00:00:00+00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1980-01-01T00:00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1980-01-01T00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1980-01-01T00:00:00+00:00').

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testHash [
	self assert: aDateAndTime hash = (DateAndTime year: 1980 month: 1 day: 1) hash
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testHour [
	self assert: aDateAndTime hour =    aDateAndTime hour24.
	self assert: aDateAndTime hour =    0.
	self assert: aDateAndTime hour =    aDateAndTime hours

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testHour12 [
	self assert: aDateAndTime hour12  = DateAndTime new hour12.
	self assert: aDateAndTime hour12  = 12

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testIsLeapYear [
	self assert: aDateAndTime isLeapYear

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testJulianDayNumber [
	self assert: aDateAndTime =  (DateAndTime julianDayNumber: 2444240).
	self assert: aDateAndTime julianDayNumber = 2444240.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testLessThan [
	self assert: aDateAndTime  < (aDateAndTime + '1:00:00:00').
	self assert: aDateAndTime + -1 < aDateAndTime.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testMeridianAbbreviation [
	self assert: aDateAndTime meridianAbbreviation = 'AM'.

	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testMiddleOf [
	self assert: (aDateAndTime middleOf: '2:00:00:00' asDuration) = 
	 (Timespan starting: '12-31-1979' asDate duration: 2 days).
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testMidnight [
	self assert: aDateAndTime midnight =  aDateAndTime

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testMinus [
	self assert: aDateAndTime - aDateAndTime =  '0:00:00:00' asDuration.
	self assert: aDateAndTime - '0:00:00:00' asDuration = aDateAndTime.
	self assert: aDateAndTime - aDuration =  (DateAndTime year: 1979 month: 12 day: 30 hour: 21 minute: 56 second: 55 nanoSecond: 999999995 offset: 0 hours ).
	" I believe this Failure is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)" 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testMinute [
	self assert: aDateAndTime minute =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testMinutes [
	self assert: aDateAndTime minutes = 0

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testMonth [
	self assert: aDateAndTime month  = 1.
	self assert: aDateAndTime monthAbbreviation = 'Jan'.
	self assert: aDateAndTime monthName = 'January'.
	self assert: aDateAndTime monthIndex = 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testNanoSecond [
	self assert: aDateAndTime nanoSecond =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testNoon [
	self assert: aDateAndTime noon = '1980-01-01T12:00:00+00:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testNow [
	self deny: aDateAndTime =  (DateAndTime now).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testOffset [

	self assert: aDateAndTime offset =  '0:00:00:00' asDuration.
	self assert: (aDateAndTime offset: '-0:12:00:00') equals:  '1979-12-31T12:00:00-12:00' asDateAndTime.
	self assert: (aDateAndTime offset: '0:12:00:00') equals:  '1980-01-01T12:00:00+12:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testPlus [
	self assert: aDateAndTime + '0:00:00:00' = aDateAndTime.
	self assert: aDateAndTime + 0 = aDateAndTime.
	self assert: aDateAndTime + aDuration = (DateAndTime year: 1980 month: 1 day: 2 hour: 2 minute: 3 second: 4 nanoSecond: 5 offset: 0 hours )
	" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testPrintOn [
	self assert: (String streamContents: [ :str | aDateAndTime printOn: str ]) equals: '1980-01-01T00:00:00+00:00'.
	self assert: (String streamContents: [ :str | aTimeZone printOn: str ]) equals: 'a TimeZone(DTZ)'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testSecond [
	self assert: aDateAndTime second =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testSeconds [
	self assert: aDateAndTime seconds =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testTicks [
	self assert: aDateAndTime ticks =  (DateAndTime julianDayNumber: 2444240) ticks.
	self assert: aDateAndTime ticks = #(2444240 0 0)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testTicksOffset [
	self assert: aDateAndTime =  (aDateAndTime ticks:  #(2444240 0 0) offset: DateAndTime localOffset).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testTimeZone [
	self assert: aDateAndTime timeZoneName	= 'Universal Time'.
	self assert: aDateAndTime timeZoneAbbreviation	=  'UTC'


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testTo [
	self assert: (aDateAndTime to: aDateAndTime) = ((DateAndTime year: 1980 month: 1 day: 1) to: (DateAndTime year: 1980 month: 1 day: 1)) 
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testToBy [
	self assert: (aDateAndTime to: aDateAndTime + 10 days by: 5 days) = 
				((DateAndTime year: 1980 month: 1 day: 1) to:
				 (DateAndTime year: 1980 month: 1 day: 1) + 10 days by: 5 days ) 
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testToByDo [
	"self assert: (aDateAndTime to: aDateAndTime + 10 days by: 5 days do: []) =  "
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testToday [
	self deny: aDateAndTime =  (DateAndTime today).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testTommorrow [
	self assert: (DateAndTime today + 24 hours) =  (DateAndTime tomorrow).
	self deny: aDateAndTime =  (DateAndTime tomorrow).
     "MessageNotUnderstood: Date class>>starting:"
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testUtcOffset [
     self assert: (aDateAndTime offset: '0:12:00:00')  equals: '1980-01-01T12:00:00+12:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testYear [
	self assert: aDateAndTime year = 1980.

	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testYearDay [
	self assert: aDateAndTime =  (DateAndTime year: 1980 day: 1).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testYearDayHourMinuteSecond [
	self assert: aDateAndTime =  (DateAndTime year: 1980 day: 1 hour: 0 minute: 0 second: 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testYearMonthDay [
	self assert: aDateAndTime =  (DateAndTime year: 1980 month: 1 day: 1).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testYearMonthDayHourMinuteSecond [
	self assert: aDateAndTime =  (DateAndTime year: 1980 month: 1 day: 1 hour: 0 minute: 0 second: 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testYearMonthDayHourMinuteSecondNanosSecondOffset [
	self assert: aDateAndTime =  (DateAndTime year: 1980 month: 1 day: 1 hour: 0 minute: 0 second: 0 nanoSecond: 0 offset:0 hours ).
	self assert: ((DateAndTime year: 1 month: 1 day: 1 hour: 0 minute: 0 second: 0 nanoSecond: 0 offset: 0 hours ) +
				(Duration days: 1 hours: 2 minutes: 3 seconds: 4  nanoSeconds: 5) ) =  	
				(DateAndTime year: 1 month: 1 day: 2 hour: 2 minute: 3 second: 4 nanoSecond: 5 offset: 0 hours ) 
	" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"   

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeDosEpochTest>>testYesterday [
	self deny: aDateAndTime =  (DateAndTime yesterday).

]
