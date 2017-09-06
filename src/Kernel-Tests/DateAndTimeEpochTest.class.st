"
I represent one of several Sunit test Cases intentended to provide complete coverage  for the Chronology set of classes as part of the external testing. The other Chronology sunit test cases are:
 DateTestCase
 DateAndTimeLeapTestCase,
 DurationTestCase,
 ScheduleTestCase
 TimeStampTestCase
 TimespanDoTestCase, 
 TimespanDoSpanAYearTestCase, 
 TimespanTestCase, 
 YearMonthWeekTestCase.  
These tests attempt to exercise all public and private methods.  Except, they do not explicitly depreciated methods. tlk
My fixtures are:
aDateAndTime = January 01, 1901 midnight (the start of the Squeak epoch) with localTimeZone = Grenwhich Meridian (local offset = 0 hours)
aDuration = 1 day, 2 hours, 3, minutes, 4 seconds and 5 nano seconds.
aTimeZone =  'Epoch Test Time Zone', 'ETZ' , offset: 12 hours, 15 minutes. 
"
Class {
	#name : #DateAndTimeEpochTest,
	#superclass : #TestCase,
	#instVars : [
		'aDateAndTime',
		'aDuration',
		'aTimeZone',
		'localTimeZoneToRestore'
	],
	#category : #Kernel-Tests-Chronology,
	#timestamp : 'tlk 1/6/2004 18:27'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>setUp [
     localTimeZoneToRestore := DateAndTime localTimeZone.
	aDateAndTime :=  DateAndTime localTimeZone: TimeZone default; epoch.
	aTimeZone := TimeZone offset: (Duration minutes: 135) name: 'Epoch Test Time Zone' abbreviation: 'ETZ'.
	aDuration := Duration days: 1 hours: 2 minutes: 3 seconds: 4 nanoSeconds: 5 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>tearDown [
     DateAndTime localTimeZone: localTimeZoneToRestore.
     "wish I could remove the time zones I added earlier, tut there is no method for that"

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsDate [
	self assert: aDateAndTime asDate =   'January 1, 1901' asDate.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsDateAndTime [
	self assert: aDateAndTime asDateAndTime =  aDateAndTime
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsDuration [
	self assert: aDateAndTime asDuration =  0 asDuration
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsLocal [
	self assert: aDateAndTime asLocal =  aDateAndTime.
	self assert: aDateAndTime asLocal = (aDateAndTime offset: aDateAndTime class localOffset)
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsMonth [
	self 
		assert: aDateAndTime asMonth
		equals: (Month year: 1901 month: 'January'). 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsNanoSeconds [
	self assert: aDateAndTime asNanoSeconds =  0 asDuration asNanoSeconds
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsSeconds [
	self assert: aDateAndTime asSeconds =  0 asDuration asSeconds
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsTime [
	self assert: aDateAndTime asTime =  Time midnight.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsUTC [
	self assert: aDateAndTime asUTC =  aDateAndTime
          
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsWeek [
	self assert: aDateAndTime asWeek = (Week starting: '12-31-1900' asDate). 


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testAsYear [
	self assert: aDateAndTime asYear =   (Year starting: '01-01-1901' asDate). 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testCurrent [
	self deny: aDateAndTime =  (DateAndTime current).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDateTime [
	self assert: aDateAndTime =  (DateAndTime date: '01-01-1901' asDate time: '00:00:00' asTime)

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDay [
	self assert: aDateAndTime day =   DateAndTime new day

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDayMonthYearDo [
	|iterations|
	iterations := 0.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  iterations := iterations + 1])  = 1.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachYear])  = 1901.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachMonth]) = 1.
	self assert: (aDateAndTime dayMonthYearDo: [:eachDay :eachMonth :eachYear |  eachDay]) = 1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDayOfMonth [
	self assert: aDateAndTime dayOfMonth  = 1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDayOfWeek [
	self assert: aDateAndTime dayOfWeek  = 3.
	self assert: aDateAndTime dayOfWeekAbbreviation = 'Tue'.
	self assert: aDateAndTime dayOfWeekName = 'Tuesday'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDayOfYear [
	self assert: aDateAndTime dayOfYear  = 1.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDaysInMonth [
	self assert: aDateAndTime daysInMonth  = 31.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDaysInYear [
	self assert: aDateAndTime daysInYear  = 365.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDaysLeftInYear [
	self assert: aDateAndTime daysLeftInYear  = 364.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testDuration [
	self assert: aDateAndTime duration  = 0 asDuration.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testEpoch [
	self assert: aDateAndTime =  '1901-01-01T00:00:00+00:00' asDateAndTime

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testFirstDayOfMonth [
	self assert: aDateAndTime firstDayOfMonth =   1

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testFromSeconds [
	self assert: aDateAndTime =  (DateAndTime fromSeconds: 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testFromString [
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1901-01-01T00:00:00+00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1901-01-01T00:00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1901-01-01T00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1901-01-01T00:00:00+00:00').

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testHash [
	self assert: aDateAndTime hash = DateAndTime new hash
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testHour [
	self assert: aDateAndTime hour =    aDateAndTime hour24.
	self assert: aDateAndTime hour =    0.
	self assert: aDateAndTime hour =    aDateAndTime hours

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testHour12 [
	self assert: aDateAndTime hour12  = DateAndTime new hour12.
	self assert: aDateAndTime hour12  = 12

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testIsLeapYear [
	self deny: aDateAndTime isLeapYear

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testJulianDayNumber [
	self assert: aDateAndTime =  (DateAndTime julianDayNumber: 2415386).
	self assert: aDateAndTime julianDayNumber = 2415386.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testLessThan [
	self assert: aDateAndTime  < (aDateAndTime + '1:00:00:00').
	self assert: aDateAndTime + -1 < aDateAndTime.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testMeridianAbbreviation [
	self assert: aDateAndTime meridianAbbreviation = 'AM'.

	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testMiddleOf [
	self assert: (aDateAndTime middleOf: '2:00:00:00' asDuration) = 
	 (Timespan starting: '12-31-1900' asDate duration: 2 days).
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testMidnight [
	self assert: aDateAndTime midnight =  aDateAndTime

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testMinus [
	self assert: aDateAndTime - aDateAndTime =  '0:00:00:00' asDuration.
	self assert: aDateAndTime - '0:00:00:00' asDuration = aDateAndTime.
	self assert: aDateAndTime - aDuration =  (DateAndTime year: 1900 month: 12 day: 30 hour: 21 minute: 56 second: 55 nanoSecond: 999999995 offset: 0 hours ).
	" I believe this Failure is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)" 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testMinute [
	self assert: aDateAndTime minute =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testMinutes [
	self assert: aDateAndTime minutes = 0

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testMonth [
	self assert: aDateAndTime month  = 1.
	self assert: aDateAndTime monthAbbreviation = 'Jan'.
	self assert: aDateAndTime monthName = 'January'.
	self assert: aDateAndTime monthIndex = 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testNanoSecond [
	self assert: aDateAndTime nanoSecond =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testNew [
	self assert: aDateAndTime =  (DateAndTime new).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testNoon [
	self assert: aDateAndTime noon = '1901-01-01T12:00:00+00:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testNow [
	self deny: aDateAndTime =  (DateAndTime now).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testOffset [

	self assert: aDateAndTime offset =  '0:00:00:00' asDuration.
	self assert: (aDateAndTime offset: '-0:12:00:00') equals:  '1900-12-31T12:00:00-12:00' asDateAndTime.
	self assert: (aDateAndTime offset: '0:12:00:00') equals:  '1901-01-01T12:00:00+12:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testPlus [
	self assert: aDateAndTime + '0:00:00:00' = aDateAndTime.
	self assert: aDateAndTime + 0 = aDateAndTime.
	self assert: aDateAndTime + aDuration = (DateAndTime year: 1901 month: 1 day: 2 hour: 2 minute: 3 second: 4 nanoSecond: 5 offset: 0 hours )
	" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testPrintOn [
	self assert: (String streamContents: [ :str | aDateAndTime printOn: str ]) equals: '1901-01-01T00:00:00+00:00'.
	self assert: (String streamContents: [ :str | aTimeZone printOn: str ]) equals: 'a TimeZone(ETZ)'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testSecond [
	self assert: aDateAndTime second =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testSeconds [
	self assert: aDateAndTime seconds =  0


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testTicks [
	self assert: aDateAndTime ticks =  (DateAndTime julianDayNumber: 2415386) ticks.
	self assert: aDateAndTime ticks = #(2415386 0 0)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testTicksOffset [
	self assert: aDateAndTime =  (aDateAndTime ticks:  #(2415386 0 0) offset: DateAndTime localOffset).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testTimeZone [
	self assert: aDateAndTime timeZoneName	= 'Universal Time'.
	self assert: aDateAndTime timeZoneAbbreviation	=  'UTC'


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testTo [
	self assert: (aDateAndTime to: aDateAndTime) = (DateAndTime new to: DateAndTime new) 
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testToBy [
	self assert: (aDateAndTime to: aDateAndTime + 10 days by: 5 days) = 
				(DateAndTime new to: DateAndTime new + 10 days by: 5 days ) 
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testToByDo [
	"self assert: (aDateAndTime to: aDateAndTime + 10 days by: 5 days do: []) =  "
	"MessageNotUnderstood: UndefinedObject>>starting:ending:  where UndefinedObject is Timespan "
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testToday [
	self deny: aDateAndTime =  (DateAndTime today).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testTommorrow [
	self assert: (DateAndTime today + 24 hours) =  (DateAndTime tomorrow).
	self deny: aDateAndTime =  (DateAndTime tomorrow).
     "MessageNotUnderstood: Date class>>starting:"
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testUtcOffset [
     self assert: (aDateAndTime offset: '0:12:00:00') =  '1901-01-01T12:00:00+12:00' asDateAndTime
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testYear [
	self assert: aDateAndTime year = 1901.

	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testYearDay [
	self assert: aDateAndTime =  (DateAndTime year: 1901 day: 1).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testYearDayHourMinuteSecond [
	self assert: aDateAndTime =  (DateAndTime year: 1901 day: 1 hour: 0 minute: 0 second: 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testYearMonthDay [
	self assert: aDateAndTime =  (DateAndTime year: 1901 month: 1 day: 1).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testYearMonthDayHourMinuteSecond [
	self assert: aDateAndTime =  (DateAndTime year: 1901 month: 1 day: 1 hour: 0 minute: 0 second: 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testYearMonthDayHourMinuteSecondNanosSecondOffset [
	self assert: aDateAndTime =  (DateAndTime year: 1901 month: 1 day: 1 hour: 0 minute: 0 second: 0 nanoSecond: 0 offset:0 hours ).
	self assert: ((DateAndTime year: 1 month: 1 day: 1 hour: 0 minute: 0 second: 0 nanoSecond: 0 offset: 0 hours ) +
				(Duration days: 1 hours: 2 minutes: 3 seconds: 4  nanoSeconds: 5) ) =  	
				(DateAndTime year: 1 month: 1 day: 2 hour: 2 minute: 3 second: 4 nanoSecond: 5 offset: 0 hours ) 
	" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"" I believe this is a bug in the nanosecond part of (DateAndTime >> year:month:day:hour:minute:second:nanoSecond:offset:)"   

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
DateAndTimeEpochTest>>testYesterday [
	self deny: aDateAndTime =  (DateAndTime yesterday).

]
