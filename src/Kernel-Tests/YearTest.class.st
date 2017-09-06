"
SUnit tests for year handling
"
Class {
	#name : #YearTest,
	#superclass : #ClassTestCase,
	#category : #Kernel-Tests-Chronology,
	#timestamp : 'TorstenBergmann 2/5/2014 08:48'
}

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:30'
}
YearTest>>classToBeTested [

	^ Year
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
YearTest>>testPreviousInLeapYear [
	"self debug: #testPreviousInLeapYear"
	
	| leap |
	leap := Year year: 2008.
	self assert: leap isLeapYear. 
	self assert: (Year year: (leap year - 1)) = leap previous 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
YearTest>>testStart [
	"self debug: #testStart"
	
	| yyyy |
	yyyy := DateAndTime now year.
	self assert: Year current start = (DateAndTime year: yyyy month: 1 day: 1)
]
