"
A unit test class for class Locale
"
Class {
	#name : #LocaleTest,
	#superclass : #TestCase,
	#category : #System-Localization-Tests,
	#timestamp : 'TorstenBergmann 9/16/2014 14:32'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleTest>>testCurrent [

	self assert: Locale current notNil
	
]
