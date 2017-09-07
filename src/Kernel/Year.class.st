"
I represent a year.
"
Class {
	#name : #Year,
	#superclass : #Timespan,
	#category : #Kernel-Chronology,
	#timestamp : 'marcus.denker 6/5/2009 11:24'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Year class>>daysInYear: yearInteger [

	^ 365 + ((self isLeapYear: yearInteger) ifTrue: [1] ifFalse: [0]).

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Year class>>isLeapYear: aYearInteger [


	| adjustedYear |
	adjustedYear := aYearInteger > 0
		ifTrue: [aYearInteger]
		ifFalse: [(aYearInteger + 1) negated].

	"There was no year 0"
	^ ((adjustedYear \\ 4 ~= 0) or: [(adjustedYear \\ 100 = 0) and: [adjustedYear \\ 400 ~= 0]]) not.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Year class>>starting: aDateAndTime duration: aDuration [
	"Return a new year, starting from the beginning the year the given DateAndTime is in."
	| aYear |
	aYear := aDateAndTime asDateAndTime year.

	^ super
		starting: (DateAndTime year: aYear month: 1 day: 1)
		duration: (Duration days: (self daysInYear: aYear)).
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Year class>>year: aYear [

	^ self starting: (DateAndTime year: aYear month: 1 day: 1).
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:33'
}
Year>>asYear [

	^ self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Year>>daysInMonth [

	^ Date daysInMonth  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Year>>daysInYear [

	^ self duration days.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Year>>firstThursday [
	"Return the years first Thursday.
	According to the ISO 8601 definition, the first week starts with the years first Thursday (week day number 5)"
	 ^ self start + (5 - self start dayOfWeek) days
]

{
	#category : #changes,
	#timestamp : ' 8/31/2017 07:16:33'
}
Year>>previous [
	"This implementation handles leap years correctly"
	
	^ self class year: (self year - 1)
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Year>>printOn: aStream [

	aStream nextPutAll: 'a Year ('.
 	self start year printOn: aStream. 
	aStream nextPutAll: ')'.

]
