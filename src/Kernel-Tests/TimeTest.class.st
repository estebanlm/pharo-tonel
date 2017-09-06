"
This is the unit test for the class Time.


"
Class {
	#name : #TimeTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'time',
		'aTime',
		'localTimeZoneToRestore'
	],
	#category : #Kernel-Tests-Chronology,
	#timestamp : '<historical>'
}

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>classToBeTested [

	^ self timeClass
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>selectorsToBeIgnored [

	 | deprecated private special primitives timing benchmarks |

	deprecated := #().
	private := #( #print24:on: #print24:showSeconds:on: ).
	special := #( #< #= #new #printOn: #storeOn: ).
	primitives := #( #primMillisecondClock #primSecondsClock #primUTCSecondsClock #primUTCMicrosecondsClock #primUTCMillisecondsClock).
	timing := #( #millisecondClockValue #milliseconds:since: #millisecondsSince: ).
	benchmarks := #( #benchmarkMillisecondClock #benchmarkPrimitiveResponseDelay ). 

	^ super selectorsToBeIgnored, deprecated, private, special, primitives, timing, benchmarks.
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>setUp [

	localTimeZoneToRestore := DateAndTime localTimeZone.
	DateAndTime localTimeZone: TimeZone default.
	time := self timeClass fromSeconds: 14567.		"4:02:47 am"
	aTime := Time readFrom: '12:34:56 pm' readStream

]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>tearDown [
	DateAndTime localTimeZone: localTimeZoneToRestore.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAccessing [

	self
		assert: time hours = 4;
		assert: time minutes = 2;
		assert: time seconds = 47;
		assert: time asSeconds = 14567.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAddSeconds [
	self assert: (aTime addSeconds: 1) = (Time readFrom: '12:34:57' readStream).
	self assert: (aTime addSeconds: 60) = (Time readFrom: '12:35:56' readStream).
	self assert: (aTime addSeconds: 3600) = (Time readFrom: '13:34:56' readStream).
	self assert: (aTime addSeconds: 24 * 60 * 60) = (Time readFrom: '12:34:56' readStream)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAddTime [
	self assert: (aTime addTime: aTime) = (Time readFrom: '01:09:52' readStream)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testArithmetic [
	| t1 t2 t3 |
	t1 := time addSeconds: 70.		"4:03:57 am"
	self
		assert: t1 hours = 4;
		assert: t1 minutes = 3;
		assert: t1 seconds = 57.

	t2 := t1 addTime: (self timeClass fromSeconds: (60*60*5)).
	self
		assert: t2 hours = 9;
		assert: t2 minutes = 3;
		assert: t2 seconds = 57.

	t3 := t2 subtractTime: (self timeClass fromSeconds: (60*60*5) + 70).
	self
		assert: t3 = time.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAsDate [
	self assert: (aTime asDate) = (Date current)

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAsDateAndTime [
	self assert: (aTime asDateAndTime) = (DateAndTime current midnight + aTime)

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAsDuration [
	self assert: (aTime asDuration) = (Duration days: 0 hours: 12 minutes: 34 seconds: 56)

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAsNanoSeconds [
	self assert: (aTime asNanoSeconds) = 45296000000000


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAsSeconds [
	self assert: (aTime asSeconds) = 45296

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAsTime [
	self assert: (aTime asTime) = aTime


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAsWeek [
	self assert: aTime asWeek = (DateAndTime current midnight + aTime) asWeek

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testAsYear [
	self assert: aTime asYear = (DateAndTime current midnight + aTime) asYear

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testComparing [
	| t1 t2 t3 |
	t1 := self timeClass fromSeconds: 14567.		"4:02:47 am"
	t2 := self timeClass fromSeconds: 5000.		"1:23:20 am"
	t3 := self timeClass fromSeconds: 80000.		"10:13:20 pm"

	self
		assert: time = t1;
		assert: time hash = t1 hash;
		assert: time = time copy.
	self
		deny: t1 < t2;
		assert: t1 < t3.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testConverting [

	self
		assert: time asSeconds = 14567.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testDuration [
	self assert: aTime duration = 0 seconds
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testEqual [
	"self debug: #testEqual"
	
	self assert: aTime = (Time readFrom: '12:34:56' readStream).
	self assert: aTime = (Time readFrom: '12:34:56.00' readStream).
	self assert: aTime = (Time readFrom: '12:34:56.0000' readStream)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testFromSeconds [
	| t |
	t := self timeClass fromSeconds: 14567.
	self
		assert: t = time

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testGeneralInquiries [
	| date aDateAndTime |

	self should: [ self timeClass timeWords ] raise: MessageNotUnderstood.

	date := '2 June 1973' asDate.
	time := '4:02:47 am' asTime.
	aDateAndTime := self timeClass dateAndTimeFromSeconds: (2285280000 + 14567).
	self
		assert: aDateAndTime equals: {date. time}.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testHhmm24 [
	self assert: aTime hhmm24 = '1234'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testHour [
	self assert: aTime hour =  12.
	self assert: aTime hour12 =  12.
	self assert: aTime hour24 =  12.
	self assert: aTime hours =  12.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testLessThan [
	self assert: aTime < (Time readFrom: '12:34:57' readStream)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testMeridianAbbreviation [
	self assert: aTime meridianAbbreviation =  'PM'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testMinute [
	self assert: aTime minute =  34.
	self assert: aTime minutes =  34

]

{
	#category : #'tests input',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testNanoConstructor [

	| timeFromString timeFromNano timeFromNanoSecond |
	
	timeFromString := Time fromString: '01:23:45.67809'.
	timeFromNano := Time hour: 1 minute: 23 second: 45 nano: 67809.
	timeFromNanoSecond := Time hour: 1 minute: 23 second: 45 nanoSecond: 67809.
	
	self 
		assert: timeFromString equals: timeFromNano;
		deny: timeFromNano = timeFromNanoSecond.
	
	timeFromString := Time fromString: '01:23:45.0'.
	timeFromNano := Time hour: 1 minute: 23 second: 45 nano: 0.
	
	self assert: timeFromString equals: timeFromNano.

	timeFromString := Time fromString: '01:23:45.1234567890'.
	timeFromNano := Time hour: 1 minute: 23 second: 45 nano: 1234567890.
	
	self assert: timeFromString equals: timeFromNano

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testNanoSecond [
	self assert: aTime nanoSecond = 0
	"Right now all times all seconds"

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testNew [
	
	self assert: self timeClass new asSeconds = 0
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrint24 [
	self assert: aTime print24 = '12:34:56'
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrint24On [
	self assert: (String streamContents: [ :str | aTime print24: true on: str ]) equals: '12:34:56'
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrint24OnWithPM [
	self assert: (String streamContents: [ :str | aTime print24: false on: str ]) equals: '12:34:56 pm'
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrint24OnWithoutSeconds [
	self assert: (String streamContents: [ :str | aTime print24: true showSeconds: true on: str ]) equals: '12:34:56'
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrint24withNanos [
	self assert: '12:34:56.1' asTime print24 = '12:34:56'
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrintMinutes [
	self assert: aTime printMinutes = '12:34 pm'
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrintOn [
	self assert: (String streamContents: [ :str | aTime printOn: str ]) equals: '12:34:56 pm'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrintStringNanos [
	self assert: (Time hour: 15 minute: 15 second: 15  nanoSecond: (150 *
1000000)) printString = '3:15:15.15 pm'
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testPrinting [

	self	
		assert: time printString = '4:02:47 am';
		assert: time intervalString =  '4 hours 2 minutes 47 seconds';
		assert: time print24 = '04:02:47';
		assert: time printMinutes = '4:02 am';
		assert: time hhmm24 = '0402'.

]

{
	#category : #'tests input',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testReadFrom [
	"self debug: #testReadFrom"
	
	| string t |
	string := '4:02:47 am'.
	t := self timeClass readFrom: string readStream.
	self assert: time printString = t printString.

]

{
	#category : #'tests input',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testReadFromWithError [
	"self debug: #testReadFromWithError"
	
	| string |
	string := 'invalid'.
	self should: [self timeClass readFrom: string readStream] raise: Error.
	string := '0:invalid'.
	self should: [self timeClass readFrom: string readStream] raise: Error

]

{
	#category : #'tests input',
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testReadFromWithNanos [
	"self debug: #testReadFromWithNanos"
	
	#('4:02:47.5 am'
	'4:02:55.521 pm'
		"there is a bug with 520 instead of 521"
	
	) do: [:each |
			|  t |
			t := self timeClass readFrom: each readStream.
			self assert: t printString = each]

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testSecond [
	self assert: aTime second =  56.
	self assert: aTime seconds =  56

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testSeconds [
	
	self assert: (Time readFrom: '20:33:14.321-05:00' readStream) asDuration seconds = 14
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testStoreOn [
	self assert: (String streamContents: [ :str | aTime storeOn: str ]) equals: '''12:34:56 pm'' asTime'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testStoring [

	self	
		assert: time storeString = '''4:02:47 am'' asTime';
		assert: time = ('4:02:47 am' asTime).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testSubtractTime [
	self assert: (aTime subtractTime: aTime) = (Time readFrom: '00:00:00' readStream)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>testTicks [
	self assert: aTime ticks = #(0 45296 0).
	self assert: aTime  = (Time new ticks: #(0 45296 0))
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:30'
}
TimeTest>>timeClass [

	^ Time
]
