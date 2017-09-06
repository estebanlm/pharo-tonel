"
The ID for localization
"
Class {
	#name : #LocaleID,
	#superclass : #Object,
	#instVars : [
		'isoLanguage',
		'isoCountry'
	],
	#category : #System-Localization-Locales,
	#timestamp : 'TorstenBergmann 1/31/2014 10:08'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID class>>current [
	^Locale current localeID
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID class>>default [
	^ self isoLanguage: 'en'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID class>>isoLanguage: langString [
	^self isoLanguage: langString isoCountry: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID class>>isoLanguage: langString isoCountry: countryStringOrNil [
	^self new isoLanguage: langString isoCountry: countryStringOrNil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID class>>isoString: isoString [
	"Parse the isoString (<language>-<country>) into its components and return the matching LocaleID"
	"LocaleID isoString: 'en' "
	"LocaleID isoString: 'en-us' "

	| parts language country |
	parts := isoString findTokens: #($- ).
	language := parts first.
	parts size > 1
		ifTrue: [country := parts second].
	^self isoLanguage: language isoCountry: country
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID class>>posixName: aString  [
	^ self
		isoString: (aString copyReplaceAll: '_' with: '-')
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>= anotherObject [
	self class == anotherObject class
		ifFalse: [^false].
	^self isoLanguage = anotherObject isoLanguage
		and: [self isoCountry = anotherObject isoCountry]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>displayCountry [
	^(ISOLanguageDefinition iso2Countries at: self isoCountry asUppercase ifAbsent: [ self isoCountry ]) 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>displayLanguage [
	| language |
	language := (ISOLanguageDefinition iso2LanguageTable
				at: self isoLanguage
				ifAbsent: [^ self isoLanguage]) language.
	^ self isoCountry
		ifNil: [language]
		ifNotNil: [language , ' (' , self displayCountry , ')']
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>hasParent [
	^self isoCountry notNil
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>hash [
	^self isoLanguage hash bitXor: self isoCountry hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>isoCountry [
	^isoCountry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>isoLanguage [
	^isoLanguage
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>isoLanguage: langString isoCountry: countryStringOrNil [
	isoLanguage := langString.
	isoCountry := countryStringOrNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>isoString [
	^self asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>parent [
	^self class isoLanguage: self isoLanguage
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>posixName [
	"(LocaleID isoString: 'es-MX') posixName"
	"(LocaleID isoString: 'es') posixName"
	"language[_territory]"
	^ self isoCountry
		ifNil: [self isoLanguage]
		ifNotNil: [self isoLanguage , '_' , self isoCountry]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>printOn: stream [
	"<language>-<country>"
	stream nextPutAll: self isoLanguage.
	self isoCountry
		ifNotNil: [stream nextPut: $-; nextPutAll: self isoCountry]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleID>>storeOn: aStream  [
	aStream nextPut: $(.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' isoString: '.
	aStream nextPutAll: '''' , self printString , ''''.
	aStream nextPut: $).

]
