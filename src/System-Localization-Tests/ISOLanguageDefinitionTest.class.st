"

"
Class {
	#name : #ISOLanguageDefinitionTest,
	#superclass : #TestCase,
	#category : #System-Localization-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
ISOLanguageDefinitionTest>>testISO2LanguageDefinition [

	self 
		assert: (ISOLanguageDefinition iso2LanguageDefinition: 'de') language = 'German';
		assert: (ISOLanguageDefinition iso2LanguageDefinition: 'fr') language = 'French'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
ISOLanguageDefinitionTest>>testISO3LanguageDefinition [

	self 
		assert: (ISOLanguageDefinition iso3LanguageDefinition: 'deu') language = 'German';
		assert: (ISOLanguageDefinition iso3LanguageDefinition: 'fra') language = 'French'
]
