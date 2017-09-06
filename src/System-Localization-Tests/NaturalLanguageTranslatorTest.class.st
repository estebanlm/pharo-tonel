"
Tests for NaturalLanguageTranslator
"
Class {
	#name : #NaturalLanguageTranslatorTest,
	#superclass : #TestCase,
	#instVars : [
		'previousRegistered'
	],
	#category : #System-Localization-Tests,
	#timestamp : 'TorstenBergmann 9/16/2014 15:25'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
NaturalLanguageTranslatorTest>>setUp [

	super setUp.
	previousRegistered := NaturalLanguageTranslator current
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
NaturalLanguageTranslatorTest>>tearDown [

	NaturalLanguageTranslator current: previousRegistered.
	super tearDown
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
NaturalLanguageTranslatorTest>>testRegisterCustomTranslator [

	NaturalLanguageTranslator current: RegisterableTranslatorMock new.
	"Our custom translator translates the string differently"
	self assert: 'TestCase' translated = 'Testfall'.
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
NaturalLanguageTranslatorTest>>testTranslatePureString [

	self assert: 'Pharo' translated = 'Pharo'
]
