"
I represent a duration starting on a specific DateAndTime.

"
Class {
	#name : #Timespan,
	#superclass : #Magnitude,
	#instVars : [
		'start',
		'duration'
	],
	#category : #Kernel-Chronology,
	#timestamp : 'brp 5/13/2003 08:07'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan class>>current  [

	^ self starting: DateAndTime now 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan class>>new [
	"Answer a Timespan starting on the Squeak epoch: 1 January 1901"

	^ self starting: DateAndTime new

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan class>>starting: aDateAndTime  [

	^ self starting: aDateAndTime duration: Duration zero 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan class>>starting: aDateAndTime duration: aDuration [

	^ self basicNew
  		start: aDateAndTime asDateAndTime;
 		duration: aDuration;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan class>>starting: startDateAndTime ending: endDateAndTime [

	^ self 
		starting: startDateAndTime 
		duration: (endDateAndTime asDateAndTime - startDateAndTime). 
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>+ operand [
	"operand conforms to protocol Duration" 	

	^ self class starting: (self start + operand) duration: self duration

]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>- operand [
	"operand conforms to protocol DateAndTime or protocol Duration"

	^ (operand respondsTo: #asDateAndTime) 
	 	ifTrue: [ self start - operand ]
	 	ifFalse: [ self + (operand negated) ]. 
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>< comparand [

	^ self start < comparand	 
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>= comparand [
	^ self species = comparand species 
		and: [ self start = comparand start 
				and: [ self duration = comparand duration ]]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asDate  [

	^ start asDate 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asDateAndTime [

	^ start 
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asDosTimestamp  [

	^ start asDosTimestamp 
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asDuration [

	^ self duration
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asMonth  [

	^ start asMonth 
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asSeconds [
 	"Answer the seconds since the Squeak epoch: 1 January 1901"
 
 	^ start asSeconds
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asTime [

	^ start asTime
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asWeek [

	^ start asWeek 
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>asYear  [

	^ start asYear
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>dates [


	| dates |

	dates := OrderedCollection new.
	self datesDo: [ :m | dates add: m ].
	^ dates asArray.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>datesDo: aBlock  [

	self do: aBlock with: start asDate. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>day [
	"Answer the day of the year represented by the receiver."
	^ self dayOfYear
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>dayOfMonth [
	"Answer the day of the month represented by the receiver."

	^ start dayOfMonth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>dayOfWeek [
	"Answer the day of the week represented by the receiver."

	^ start dayOfWeek
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>dayOfWeekName [
	"Answer the day of the week represented by the receiver."

	^ start dayOfWeekName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>dayOfYear [
	"Answer the day of the year represented by the receiver."

	^ start dayOfYear
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>daysInMonth  [

	^ start daysInMonth 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>daysInYear [
 	"Answer the number of days in the month represented by the receiver."

	^ start daysInYear 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>daysLeftInYear [
	^ start daysLeftInYear
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>do: aBlock with: aFirstElement [

 	self do: aBlock with: aFirstElement when: [ :t | true ]. 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>do: aBlock with: aFirstElement when: aConditionBlock [

	| element end |
	element := aFirstElement.
	end := self end.
	[ element start <= end ] whileTrue:
	
	[(aConditionBlock value: element)
			ifTrue: [ aBlock value: element ].
		element := element next. ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>duration [
 	"Answer the Duration of this timespan"

	^ duration 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>duration: aDuration [
	"Set the Duration of this timespan"

	duration := aDuration

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>end  [

	^ self duration asNanoSeconds = 0
		ifTrue: [ self start ]
		ifFalse: [ self next start - DateAndTime clockPrecision ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>every: aDuration do: aBlock [

	| element end |
	element := self start.
	end := self end.
	[ element <= end ] whileTrue:
	
	[ aBlock value: element.
		element := element + aDuration. ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>firstDayOfMonth [

	^ start firstDayOfMonth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>hash [

	^ start hash + duration hash 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>includes: aDateAndTime  [

	^ (aDateAndTime isKindOf: Timespan)
			ifTrue: [ 
				(self includes: aDateAndTime start)
					and: [ self includes: aDateAndTime end ] ]
			ifFalse: [ aDateAndTime asDateAndTime between: start and: self end ]

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>includesAll: aCollection [
	"Answer whether all the elements of aCollection are in the receiver."

	^ aCollection allSatisfy: [ :elem | self includes: elem ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>includesAllOf: aCollection  [

	self
		deprecated: 'Please use #includesAll: instead'
		transformWith: '`@receiver includesAllOf: `@statements' -> '`@receiver includesAll: `@statements'.
	
	^ self includesAll: aCollection

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>includesAny: aCollection [
	"Answer whether any element of aCollection is included in the receiver"

	^ aCollection anySatisfy: [ :elem | self includes: elem ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>includesAnyOf: aCollection  [
	
	self flag: 'use includesAny: instead'.
	
	^ self includesAny: aCollection
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>intersection: aTimespan [

	 "Return the Timespan both have in common, or nil"

	 | aBegin anEnd |
	 aBegin := self start max: aTimespan start.
	 anEnd := self end min: aTimespan end.
	 anEnd < aBegin ifTrue: [^nil].

	 ^ self class starting: aBegin ending: anEnd.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>isLeapYear [

	^ start isLeapYear 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>julianDayNumber  [

	^ start julianDayNumber 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>julianDayNumberUTC [
	^ start julianDayNumberUTC
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>month [

	^ start month 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>monthAbbreviation  [

	^ start monthAbbreviation 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>monthIndex [

	^ self month 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>monthName  [

	^ start monthName 
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>months [

	| months |
	months := OrderedCollection new: 12.
	self monthsDo: [ :m | months add: m ].
	^ months asArray.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>monthsDo: aBlock [

 	self do: aBlock with: start asMonth.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>next [

	^ self class starting: (start + duration) duration: duration 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>offset [
	^ start offset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>offset: anOffset [
	"Answer a <Timespan> equivalent to the receiver but with its local time 
	being offset from UTC by offset.
	Unlike #translateTo: this will NOT change the absolute in UTC "

	^ self class 
		starting: (self start offset: anOffset) 
		duration: self duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>previous  [

	^ self class starting: (start - duration) duration: duration 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>printOn: aStream  [

	super printOn: aStream.
	aStream 
		nextPut: $(;
		print: start;
		nextPut: $D;
		print: duration;
		nextPut: $).

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>start [
 	"Answer the start DateAndTime of this timespan"

	^ start 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>start: aDateAndTime [
	"Store the start DateAndTime of this timespan"

	start := aDateAndTime asDateAndTime

]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>to: anEnd [
	"Answer an Timespan. anEnd must be aDateAndTime or a Timespan" 
	| end |
	end := (anEnd isKindOf: Timespan)
		ifTrue: [ anEnd end ]
		ifFalse: [ anEnd asDateAndTime ].
	^ Timespan starting: (self start) ending: end. 
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>translateTo: aTimeZone [
	"Keep myself's representation and move it to another timezone offset.
	Note that unlike #offset: this WILL change the absolute time in UTC"
	
	^ self class
		starting: (start translateTo: aTimeZone)
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>translateToUTC  [
	" Move this represenation to UTC"
	^ self translateTo: 0
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>union: aTimespan [
	 "Return the Timespan spanned by both"

	| aBegin anEnd |

	aBegin := self start min: aTimespan start.
	anEnd := self end max: aTimespan end.
	^ Timespan starting: aBegin ending: (anEnd + DateAndTime clockPrecision).

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>weeks [


	| weeks |
	weeks := OrderedCollection new.
	self weeksDo: [ :m | weeks add: m ].
	^ weeks asArray.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>weeksDo: aBlock [

	self do: aBlock with: self asWeek.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>workDatesDo: aBlock [
 	"Exclude Saturday and Sunday"

	self do: aBlock with: start asDate when: [ :d | d dayOfWeek < 6 ]. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>year  [

	^ start year 
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>years [


	| years |
	years := OrderedCollection new.
	self yearsDo: [ :m | years add: m ].
	^ years asArray.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Timespan>>yearsDo: aBlock [

	self do: aBlock with: start asYear.
]
