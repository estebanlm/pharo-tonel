"
I'm a mock object to mock a translator
"
Class {
	#name : #RegisterableTranslatorMock,
	#superclass : #Object,
	#instVars : [
		'translations'
	],
	#category : #System-Localization-Tests,
	#timestamp : 'TorstenBergmann 9/16/2014 15:16'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:46'
}
RegisterableTranslatorMock>>initialize [
	"Initializes the receiver"
	
	super initialize.
	translations := Dictionary new.
	translations at: #'TestCase' put: 'Testfall'
]

{
	#category : #translate,
	#timestamp : ' 8/31/2017 05:26:46'
}
RegisterableTranslatorMock>>translate: aString [
	"Dispatch to a registered translator to translate the given string or (if there is no translator) return the untranslated string."
	^translations at: aString asSymbol ifAbsent: [ aString ] 

]

{
	#category : #translate,
	#timestamp : ' 8/31/2017 05:26:46'
}
RegisterableTranslatorMock>>translate: aString toLocale: localeID [
 
	^self translate: aString
]
