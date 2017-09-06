"

"
Class {
	#name : #LocaleChangedTest,
	#superclass : #TestCase,
	#category : #System-Localization-Tests,
	#timestamp : ''
}

{
	#category : #'private accessing',
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleChangedTest>>englishLocale [
	^ Locale isoLanguage: 'en'
]

{
	#category : #'private accessing',
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleChangedTest>>germanLocale [
	^ Locale isoLanguage: 'de'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleChangedTest>>testInstanceCreation [
	| instance |
	instance := LocaleChanged from: self englishLocale to: self germanLocale.
	
	self 
		assert: instance oldLocale = self englishLocale;
		assert: instance newLocale = self germanLocale 
	
]
