Extension {
	#name : #String
}

{
	#category : #'*System-Localization',
	#timestamp : ' 8/31/2017 05:26:31'
}
String>>translated [
"answer the receiver translated to the default language"
	^ NaturalLanguageTranslator translate: self

]

{
	#category : #'*System-Localization',
	#timestamp : ' 8/31/2017 05:26:31'
}
String>>translatedTo: localeID  [
	"answer the receiver translated to the given locale id"
	^ NaturalLanguageTranslator translate: self toLocale: localeID
]
