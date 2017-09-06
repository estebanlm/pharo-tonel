"
A NaturalLanguageTranslator is a dummy translator.

The localization framework is found in the gettext package usually 
overriding this class completely. 

As an alternative you can register a translator using
  
   NaturalLanguageTranslator current: myTranslator

If this is done the messages will be dispatched to it
"
Class {
	#name : #NaturalLanguageTranslator,
	#superclass : #Object,
	#classVars : [
		'Current'
	],
	#category : #System-Localization-Translations,
	#timestamp : 'TorstenBergmann 9/16/2014 14:49'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:31'
}
NaturalLanguageTranslator class>>cleanUp [
	 Current ifNotNil: [ Current cleanUp ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
NaturalLanguageTranslator class>>current  [
	"Return the currently registered translator"
	
	^Current 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
NaturalLanguageTranslator class>>current: aTranslator [
	"Register a translator that should receiver the translation messages"
	
	Current := aTranslator
]

{
	#category : #translate,
	#timestamp : ' 8/31/2017 05:26:31'
}
NaturalLanguageTranslator class>>translate: aString [
	"Dispatch to a registered translator to translate the given string or (if there is no translator) return the untranslated string."
	Current ifNotNil: [ ^Current translate: aString ].
	^ aString
]

{
	#category : #translate,
	#timestamp : ' 8/31/2017 05:26:31'
}
NaturalLanguageTranslator class>>translate: aString toLocale: localeID [
	"Dispatch to a registered translator to translate the given string with the given locale ID or (if there is no translator) return the untranslated string."
	Current ifNotNil: [ ^Current translate: aString toLocale: localeID ].
	^ aString
]
