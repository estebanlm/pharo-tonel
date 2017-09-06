"
I represent a powerful class for implementing recurring schedules.
"
Class {
	#name : #Schedule,
	#superclass : #Timespan,
	#instVars : [
		'schedule'
	],
	#category : #Kernel-Chronology,
	#timestamp : 'brp 5/13/2003 09:48'
}

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Schedule>>between: aStart and: anEnd do: aBlock [
	"from Cuis 99"
	
	| element end i startDate |
	end := self end min: anEnd.

	element := self start.	
	"Performance optimization. Avoid going through unnecesary days if easy."
	startDate := aStart asDate.
	(startDate > element asDate and: [ self everyDayAtSameTimes ]) ifTrue: [
		element := DateAndTime date: startDate time: element asTime ].

	i := 1.
	[ element < aStart ] whileTrue: [
		element := element + (schedule at: i).
		i := i + 1.
		i > schedule size ifTrue: [i := 1]].

	[ element <= end ] whileTrue: [
		aBlock value: element.
		element := element + (schedule at: i).
		i := i + 1.
		i > schedule size ifTrue: [i := 1]]
.

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Schedule>>dateAndTimes [

	| dateAndTimes |
	dateAndTimes := OrderedCollection new.
	self scheduleDo: [ :e | dateAndTimes add: e ].
	^ dateAndTimes asArray.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Schedule>>everyDayAtSameTimes [
	"Answer false if unknown"
	
	| count |
	count := (Duration days: 1) / self scheduleDuration.
	^ count >= 1 and: [ count isInteger ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Schedule>>includes: aDateAndTime [

	| dt |
	dt := aDateAndTime asDateAndTime.
	self scheduleDo: [ :e | e = dt ifTrue: [^true] ].
	^ false.

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Schedule>>schedule [
	^ schedule 
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Schedule>>schedule: anArrayOfDurations [

	schedule := anArrayOfDurations

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Schedule>>scheduleDo: aBlock [

	self between: (self start) and: (self end) do: aBlock. 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Schedule>>scheduleDuration [
	^ schedule sum
]
