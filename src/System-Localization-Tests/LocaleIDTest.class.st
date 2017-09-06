"
A unit test class for class LocaleID
"
Class {
	#name : #LocaleIDTest,
	#superclass : #TestCase,
	#category : #System-Localization-Tests,
	#timestamp : 'TorstenBergmann 9/16/2014 14:32'
}

{
	#category : #'tests - test data',
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>frenchLocaleID [

	^LocaleID isoLanguage: 'fr'
]

{
	#category : #'tests - test data',
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>germanLocaleID [

	^LocaleID isoLanguage: 'de'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>testComparision [

	self deny: self germanLocaleID = self frenchLocaleID.
	self assert: self germanLocaleID = self germanLocaleID.	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>testFromISOString [

	| locale |
	locale := LocaleID isoString: 'en-us'.
	self 
		assert: locale isoLanguage = 'en';
		assert: locale isoCountry = 'us'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>testFromSingleISOString [

	| locale |
	locale := LocaleID isoString: 'en'.
	self 
		assert: locale isoLanguage = 'en';
		assert: locale isoCountry isNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>testHashing [

	self assert: self germanLocaleID hash = self germanLocaleID hash.
	self assert: self frenchLocaleID hash = self frenchLocaleID hash.	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>testInstanceCreationWithISOLanguage [

	|germanLocale|
	germanLocale := LocaleID isoLanguage: 'de'.
	self assert: germanLocale isoLanguage = 'de'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>testInstanceCreationWithISOLanguageAndCountry [

	|locale|
	locale := LocaleID isoLanguage: 'zh' isoCountry: 'CN'.
	self 
		assert: locale isoLanguage = 'zh';
		assert: locale isoCountry = 'CN'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>testPosixNameConversion [

	| locale |
	locale := LocaleID posixName: 'en_us'.
	self 
		assert: locale isoLanguage = 'en';
		assert: locale isoCountry = 'us'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleIDTest>>testPrintString [

	| locale |
	locale := LocaleID isoString: 'en-us'.	
	self assert: locale printString = 'en-us'

]
