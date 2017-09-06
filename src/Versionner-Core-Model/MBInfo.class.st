"
Common superclass for Versionner infos
"
Class {
	#name : #MBInfo,
	#superclass : #Object,
	#instVars : [
		'name',
		'text',
		'validationResult',
		'validationIcon',
		'validationIconSymbol'
	],
	#classVars : [
		'ValidateAll'
	],
	#category : #Versionner-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:11'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo class>>helpLabel [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo class>>validateAll [

	ValidateAll == nil ifTrue: [ ValidateAll := false ].
	^ValidateAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo class>>validateAll: aBool [

	ValidateAll := aBool
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>announcer  [

	^self configurationRoot announcer
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>asStringOrText [

	^self text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>browseValidationResults [

	self validate explore
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>buildStringOrText [
	^self printString
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>clearValidationIcon [

	validationIcon := nil
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>commands [
	^ (self class allSelectors select:
		[ :k | k beginsWith: 'cmd'  ]) collect: [ :k | self perform: k ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>configurationInfo [

	^self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>configurationRoot [

	^self configurationInfo configurationRoot
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>extractPackageSignatureFrom: aWorkingCopy [
	| ref |
	(aWorkingCopy isNil or: [ aWorkingCopy ancestors isEmpty ])
		ifTrue: [ ^ '' ].
	ref := GoferVersionReference name: aWorkingCopy ancestors first name.
	^ ref author , '.' , ref versionNumber asString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>interestedInPackageNamed: packageName [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>isDirty [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>name: aName [
	name := aName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>printOn: aStream [
	self name ifNil: [ aStream nextPutAll: '' . ^ self ].
	aStream nextPutAll: self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>project [
	"Answer the MetacelloProject associated with the receiver."
	
	^nil
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>repositories [
	"Return the repositories associated with the receiver."

	^#()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>text [
	text ifNil: [ text := self buildStringOrText ].
	^text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>text: anObject [
	text := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>validate [
	"Returns by default an empty collection of problems"
	
	^#()
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>validateFull [

	self  validationResult: nil.
	^self validate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfo>>validationResult: anObject [

	validationResult := anObject
]
