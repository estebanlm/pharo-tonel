"
I represent a month.
"
Class {
	#name : #Month,
	#superclass : #Timespan,
	#pools : [
		'ChronologyConstants'
	],
	#category : #Kernel-Chronology,
	#timestamp : 'brp 5/13/2003 09:48'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>current [
	^ self starting: DateAndTime now
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>daysInMonth: indexOrName forYear: yearInteger  [

	| index |
	index := indexOrName isInteger 
				ifTrue: [indexOrName]
				ifFalse: [self indexOfMonth: indexOrName].
	^ (DaysInMonth at: index)
			+ ((index = 2
					and: [Year isLeapYear: yearInteger])
						ifTrue: [1] ifFalse: [0])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>indexOfMonth: aMonthName  [

	1 to: 12 do: [ :i |  (aMonthName, '*' match: (MonthNames at: i)) ifTrue: [^i] ].
 	self error: aMonthName , ' is not a recognized month name'.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>month: month [
	"Create a Month in the current year for the given <month>.
	<month> may be a number or a String with the name of the month."

	^ self 
		year: DateAndTime now year
		month: month

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>month: month year: year [
	^ self year: year month: month
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>nameOfMonth: anIndex [

	^ MonthNames at: anIndex.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>readFrom: aStream [

	| m y c |
	m := (ReadWriteStream with: '') reset.
	[(c := aStream next) isSeparator] whileFalse: [m nextPut: c].
	[(c := aStream next) isSeparator] whileTrue.
	y := (ReadWriteStream with: '') reset.
	y nextPut: c.
	[aStream atEnd] whileFalse: [y nextPut: aStream next].

	^ self 
		year: y contents asNumber
		month: (Month indexOfMonth: m contents)

"Month readFrom: 'July 1998' readStream"

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>starting: aDateAndTime duration: aDuration  [
	"Override - a each month has a defined duration"
	| start adjusted days |
	start := aDateAndTime asDateAndTime.
	adjusted := DateAndTime
				year: start year
				month: start month
				day: 1.
	days := self 
		daysInMonth: adjusted month 
		forYear: adjusted year.
	^ super
		starting: adjusted
		duration: (Duration days: days)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Month class>>year: year month: month [
	"Create a Month for the given <year> and <month>.
	<month> may be a number or a String with the
	name of the month. <year> should be with 4 digits."

	^ self starting: (DateAndTime year: year month: month day: 1)

]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month>>asMonth [

	^ self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month>>daysInMonth [

	^ self duration days.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month>>index [

	^ self monthIndex 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month>>name  [

	^ self monthName 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month>>previous  [

	^ self class starting: (self start - 1) 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Month>>printOn: aStream  [

	aStream nextPutAll: self monthName, ' ', self year printString.
]
