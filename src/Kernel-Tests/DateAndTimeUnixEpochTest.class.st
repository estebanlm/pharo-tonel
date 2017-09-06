"
Tests for unix epoch of DateAndTime
"
Class {
	#name : #DateAndTimeUnixEpochTest,
	#superclass : #TestCase,
	#instVars : [
		'aDateAndTime',
		'aDuration',
		'aTimeZone',
		'localTimeZoneToRestore'
	],
	#category : #Kernel-Tests-Chronology,
	#timestamp : 'TorstenBergmann 2/5/2014 08:33'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>setUp [
     localTimeZoneToRestore := DateAndTime localTimeZone.
	aDateAndTime :=  DateAndTime localTimeZone: TimeZone default; unixEpoch.
	aTimeZone := TimeZone offset: (Duration minutes: 135) name: 'Unix Epoch Test Time Zone' abbreviation: 'UTZ'.
	aDuration := Duration days: 1 hours: 2 minutes: 3 seconds: 4 nanoSeconds: 5 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>tearDown [
     DateAndTime localTimeZone: localTimeZoneToRestore.
     "wish I could remove the time zones I added earlier, tut there is no method for that"

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsDate [
	self assert: aDateAndTime asDate =   'January 1, 1970' asDate.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsDateAndTime [
	self assert: aDateAndTime asDateAndTime =  aDateAndTime
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsDuration [
	self assert: aDateAndTime asDuration =  0 asDuration
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsLocal [
	self assert: aDateAndTime asLocal =  aDateAndTime.
	self assert: aDateAndTime asLocal = (aDateAndTime offset: aDateAndTime class localOffset)
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsMonth [
	self 
		assert: aDateAndTime asMonth
		equals: (Month year: 1970 month: 'January'). 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsNanoSeconds [
	self assert: aDateAndTime asNanoSeconds =  0 asDuration asNanoSeconds
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsSeconds [
	self assert: aDateAndTime asSeconds = 2177452800
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsTime [
	self assert: aDateAndTime asTime =  Time midnight.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsUTC [
	self assert: aDateAndTime asUTC =  aDateAndTime
          
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsWeek [
	self assert: aDateAndTime asWeek = (Week starting: '12-31-1969' asDate). 


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testAsYear [
	self assert: aDateAndTime asYear =   (Year starting: '01-01-1970' asDate). 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testCurrent [
	self deny: aDateAndTime =  (DateAndTime current).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDateTime [
	self assert: aDateAndTime =  (DateAndTime date: '01-01-1970' asDate time: '00:00:00' asTime)

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDay [
	self assert: aDateAndTime day =   DateAndTime new day

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDayMonthYearDo [
	|iterations|
	iterations := 0.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  iterations := iterations + 1])  = 1.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachYear])  = 1970.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachMonth]) = 1.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachDay]) = 1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDayOfMonth [
	self assert: aDateAndTime dayOfMonth  = 1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDayOfWeek [
	self assert: aDateAndTime dayOfWeek  = 5.
	self assert: aDateAndTime dayOfWeekAbbreviation = 'Thu'.
	self assert: aDateAndTime dayOfWeekName = 'Thursday'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDayOfYear [
	self assert: aDateAndTime dayOfYear  = 1.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDaysInMonth [
	self assert: aDateAndTime daysInMonth  = 31.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDaysInYear [
	self assert: aDateAndTime daysInYear  = 365.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDaysLeftInYear [
	self assert: aDateAndTime daysLeftInYear  = 364.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testDuration [
	self assert: aDateAndTime duration  = 0 asDuration.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testEpoch [
	self assert: aDateAndTime =  '1970-01-01T00:00:00+00:00' asDateAndTime

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testFirstDayOfMonth [
	self assert: aDateAndTime firstDayOfMonth =   1

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testFromSeconds [
	self assert: aDateAndTime =  (DateAndTime fromSeconds: 2177452800).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testFromString [
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1970-01-01T00:00:00+00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1970-01-01T00:00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1970-01-01T00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1970-01-01T00:00:00+00:00').

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testHash [
	self assert: aDateAndTime hash = (DateAndTime year: 1970 month: 1 day: 1) hash
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testHour [
	self assert: aDateAndTime hour =    aDateAndTime hour24.
	self assert: aDateAndTime hour =    0.
	self assert: aDateAndTime hour =    aDateAndTime hours

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testHour12 [
	self assert: aDateAndTime hour12  = DateAndTime new hour12.
	self assert: aDateAndTime hour12  = 12

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testIsLeapYear [
	self deny: aDateAndTime isLeapYear

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testJulianDayNumber [
	self assert: aDateAndTime =  (DateAndTime julianDayNumber: 2440588).
	self assert: aDateAndTime julianDayNumber = 2440588.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testLessThan [
	self assert: aDateAndTime  < (aDateAndTime + '1:00:00:00').
	self assert: aDateAndTime + -1 < aDateAndTime.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testMeridianAbbreviation [
	self assert: aDateAndTime meridianAbbreviation = 'AM'.

	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testMiddleOf [
	self assert: (aDateAndTime middleOf: '2:00:00:00' asDuration) = 
	 (Timespan starting: '12-31-1969' asDate duration: 2 days).
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testMidnight [
	self assert: aDateAndTime midnight =  aDateAndTime

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testMinus [
	self assert: aDateAndTime - aDateAndTime =  '0:00:00:00' asDuration.
	self assert: aDateAndTime - '0:00:00:00' asDuration = aDateAndTime.
	self assert: aDateAndTime - aDuration =  (DateAndTime year: 1969 month: 12 day: 30 hour: 21 minute: 56 second: 55 nanoSecond: 999999995 offset: 0 hours ).
	" I believe this Failure is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)" 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testMinute [
	self assert: aDateAndTime minute =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testMinutes [
	self assert: aDateAndTime minutes = 0

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testMonth [
	self assert: aDateAndTime month  = 1.
	self assert: aDateAndTime monthAbbreviation = 'Jan'.
	self assert: aDateAndTime monthName = 'January'.
	self assert: aDateAndTime monthIndex = 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testNanoSecond [
	self assert: aDateAndTime nanoSecond =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testNoon [
	self assert: aDateAndTime noon = '1970-01-01T12:00:00+00:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testNow [
	self deny: aDateAndTime =  (DateAndTime now).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testOffset [
	self assert: aDateAndTime offset =  '0:00:00:00' asDuration.
     self assert: (aDateAndTime offset: '0:12:00:00') equals:  '1970-01-01T12:00:00+12:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testPlus [
	self assert: aDateAndTime + '0:00:00:00' = aDateAndTime.
	self assert: aDateAndTime + 0 = aDateAndTime.
	self assert: aDateAndTime + aDuration = (DateAndTime year: 1970 month: 1 day: 2 hour: 2 minute: 3 second: 4 nanoSecond: 5 offset: 0 hours )
	" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testPrintOn [
	self assert: (String streamContents: [ :str | aDateAndTime printOn: str ]) equals: '1970-01-01T00:00:00+00:00'.
	self assert: (String streamContents: [ :str | aTimeZone printOn: str ]) equals: 'a TimeZone(UTZ)'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testSecond [
	self assert: aDateAndTime second =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testSeconds [
	self assert: aDateAndTime seconds =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testTicks [
	self assert: aDateAndTime ticks =  (DateAndTime julianDayNumber: 2440588) ticks.
	self assert: aDateAndTime ticks = #(2440588 0 0)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testTicksOffset [
	self assert: aDateAndTime =  (aDateAndTime ticks:  #(2415386 0 0) offset: DateAndTime localOffset).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testTimeZone [
	self assert: aDateAndTime timeZoneName	= 'Universal Time'.
	self assert: aDateAndTime timeZoneAbbreviation	=  'UTC'


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testTo [
	self assert: (aDateAndTime to: aDateAndTime) = ((DateAndTime year: 1970 month: 1 day: 1) to: (DateAndTime year: 1970 month: 1 day: 1)) 
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testToBy [
	self assert: (aDateAndTime to: aDateAndTime + 10 days by: 5 days) = 
				((DateAndTime year: 1970 month: 1 day: 1) to:
				 (DateAndTime year: 1970 month: 1 day: 1) + 10 days by: 5 days ) 
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testToByDo [
	"self assert: (aDateAndTime to: aDateAndTime + 10 days by: 5 days do: []) =  "
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testToday [
	self deny: aDateAndTime =  (DateAndTime today).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testTommorrow [
	self assert: (DateAndTime today + 24 hours) =  (DateAndTime tomorrow).
	self deny: aDateAndTime =  (DateAndTime tomorrow).
     "MessageNotUnderstood: Date class>>starting:"
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testUtcOffset [
     self assert: (aDateAndTime offset: '0:12:00:00') =  '1970-01-01T12:00:00+12:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testYear [
	self assert: aDateAndTime year = 1970.

	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testYearDay [
	self assert: aDateAndTime =  (DateAndTime year: 1970 day: 1).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testYearDayHourMinuteSecond [
	self assert: aDateAndTime =  (DateAndTime year: 1970 day: 1 hour: 0 minute: 0 second: 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testYearMonthDay [
	self assert: aDateAndTime =  (DateAndTime year: 1970 month: 1 day: 1).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testYearMonthDayHourMinuteSecond [
	self assert: aDateAndTime =  (DateAndTime year: 1970 month: 1 day: 1 hour: 0 minute: 0 second: 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testYearMonthDayHourMinuteSecondNanosSecondOffset [
	self assert: aDateAndTime =  (DateAndTime year: 1970 month: 1 day: 1 hour: 0 minute: 0 second: 0 nanoSecond: 0 offset:0 hours ).
	self assert: ((DateAndTime year: 1 month: 1 day: 1 hour: 0 minute: 0 second: 0 nanoSecond: 0 offset: 0 hours ) +
				(Duration days: 1 hours: 2 minutes: 3 seconds: 4  nanoSeconds: 5) ) =  	
				(DateAndTime year: 1 month: 1 day: 2 hour: 2 minute: 3 second: 4 nanoSecond: 5 offset: 0 hours ) 
	" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"   

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeUnixEpochTest>>testYesterday [
	self deny: aDateAndTime =  (DateAndTime yesterday).

]
