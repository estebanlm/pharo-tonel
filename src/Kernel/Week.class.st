"
I represent a week.
"
Class {
	#name : #Week,
	#superclass : #Timespan,
	#classVars : [
		'StartDay'
	],
	#pools : [
		'ChronologyConstants'
	],
	#category : #Kernel-Chronology,
	#timestamp : 'brp 5/13/2003 09:48'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Week class>>dayNames [

	^ DayNames 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Week class>>indexOfDay: aSymbol [

	^ DayNames indexOf: aSymbol 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Week class>>nameOfDay: anIndex [

	^ DayNames at: anIndex 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Week class>>startDay [

	^ StartDay ifNil: [ StartDay := DayNames first ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Week class>>startDay: aSymbol [

	(DayNames includes: aSymbol)
		ifTrue: [ StartDay := aSymbol ]
		ifFalse: [ self error: aSymbol, ' is not a recognised day name' ]

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Week class>>starting: aDateAndTime duration: aDuration [
	"Override - the duration is always one week.
	 Week will start from the Week class>>startDay"

	| midnight delta adjusted |
	midnight := aDateAndTime asDateAndTime midnight.
	delta := ((midnight dayOfWeek + 7 - (DayNames indexOf: self startDay)) rem: 7) abs.
	adjusted := midnight - (Duration days: delta seconds: 0).

	^ super
		starting: adjusted
		duration: (Duration weeks: 1).
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Week class>>week: weekNumber [
	"Return a week in this year"
	^ self year: Year current week: weekNumber
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Week class>>year: aYear week: weekNumber [
	"Return the ISO week for the given week number and the given year.
	Week 1 contains the year's first Thursday (weekday = 5)"
	^ self starting: aYear asYear firstThursday + (weekNumber * 7 - 5"adjust for firstThursday") days
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Week>>asWeek [

	^ self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Week>>index [

	^ self asMonth dayOfWeek + self dayOfMonth - 2  // 7 + 1

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Week>>printOn: aStream [

	aStream nextPutAll: 'a Week starting: '.
	self start printOn: aStream. 
]
