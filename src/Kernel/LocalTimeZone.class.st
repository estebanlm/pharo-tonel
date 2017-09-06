"
I am the local time zone which will use the system's current time offset dynamically.

This is the default timezone.
"
Class {
	#name : #LocalTimeZone,
	#superclass : #AbstractTimeZone,
	#pools : [
		'ChronologyConstants'
	],
	#category : #Kernel-Chronology,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
LocalTimeZone>>abbreviation [
	^ String streamContents: [ :s |
		s nextPutAll: 'LT'; print: self offset hours; nextPut: $:.
		s nextPutAll: (self offset minutes printPaddedWith: $0 to: 2) ].
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
LocalTimeZone>>asFixedTimeZone [
	"Convert this dynamic timezone to one with a fixed offset."
	^ TimeZone
		offset: self offset
		name: 'Fixed Local Time'
		abbreviation: self abbreviation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
LocalTimeZone>>name [
	^ 'Local Time'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
LocalTimeZone>>offset [
	^ self primOffset minutes
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 07:16:33'
}
LocalTimeZone>>primOffset [
	"The offset from UTC in minutes, with positive offsets being towards the east.
	(San Francisco is in UTC -07*60 and Paris is in UTC +02*60 (daylight savings is not in effect)."
	<primitive:'primitiveTimezoneOffset' module: 'LocalePlugin'>
	^ 0
]
