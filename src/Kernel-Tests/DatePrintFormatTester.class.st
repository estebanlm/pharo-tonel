"
I am a helper object used for validating formatted Date strings.


"
Class {
	#name : #DatePrintFormatTester,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#instVars : [
		'dayPosition',
		'monthPosition',
		'yearPosition',
		'delimiter',
		'monthType',
		'yearType',
		'date'
	],
	#category : #Kernel-Tests-Chronology,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester class>>on: aDate [

	^ self new date: aDate.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>date: aDate  [

	date := aDate.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>dayPosition: dayPos monthPosition: moPos yearPosition: yrPos delimiter: aCharacter monthType: moType yearType: yrType  [

	dayPosition := dayPos.
	monthPosition := moPos.
	yearPosition := yrPos.
	delimiter := aCharacter.
	monthType := moType.
	yearType := yrType.
	^ self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>delimiter: aCharacter  [

	delimiter := aCharacter.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>monthType: anInteger  [

	monthType := anInteger.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>monthType: aNumber shouldPrintAs: aString  [

	| actual |
	monthType := aNumber.
	actual := self tokens at: monthPosition.
	self assert: actual equals: aString.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>printFormat [

	^ date printFormat: { dayPosition. monthPosition. yearPosition. delimiter. monthType. yearType }.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>shouldEqual: expectedOutputString  [

	self assert: self printFormat equals: expectedOutputString.

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>tokens [

	^ self printFormat findTokens: { delimiter }.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:30'
}
DatePrintFormatTester>>yearType: aNumber shouldPrintAs: aString  [

	| actual tokens isMonthMissing yearTokenIndex |
	yearType := aNumber.
	tokens := self tokens.
	isMonthMissing := tokens size = 2.
	yearTokenIndex := isMonthMissing
		ifTrue: [ 2 ]
		ifFalse: [ 3 ].
	actual := tokens at: yearTokenIndex.
	
	self assert: actual equals: aString.
]
