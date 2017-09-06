"
This class provides the support for the languages in 'Latin-9' category.
"
Class {
	#name : #Latin9Environment,
	#superclass : #LanguageEnvironment,
	#category : #Multilingual-Languages,
	#timestamp : '<historical>'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:12'
}
Latin9Environment class>>initialize [

	EncodedCharSet declareEncodedCharSet: self atIndex: 17+1.
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 07:16:12'
}
Latin9Environment class>>leadingChar [

	^0
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 07:16:12'
}
Latin9Environment class>>supportedLanguages [
	"Return the languages that this class supports. 
	Any translations for those languages will use this class as their environment."
	
	^#('hu' 'sl' 'hr' 'ro' 'cs' 'sk')
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 07:16:12'
}
Latin9Environment class>>systemConverterClass [

	Smalltalk os isWin32 
		ifTrue: [^CP1252TextConverter ].

	^ ISO885915TextConverter.

]
