"
EncodedCharSet initialize.
LanguageEnvironment resetKnownEnvironments.
Locale switchToID: (LocaleID isoLanguage: 'ru').

"
Class {
	#name : #RussianEnvironment,
	#superclass : #LanguageEnvironment,
	#category : #Multilingual-OtherLanguages,
	#timestamp : 'StephaneDucasse 11/29/2011 22:25'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:15'
}
RussianEnvironment class>>initialize [

	EncodedCharSet declareEncodedCharSet: self atIndex: 15+1.
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 05:26:15'
}
RussianEnvironment class>>leadingChar [

	^0
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 05:26:15'
}
RussianEnvironment class>>supportedLanguages [
	"Return the languages that this class supports. 
	Any translations for those languages will use this class as their environment."
	
	^#('ru' )
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 05:26:15'
}
RussianEnvironment class>>systemConverterClass [

	^ UTF8TextConverter
]
