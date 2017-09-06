"

"
Class {
	#name : #FLPharoPlatform,
	#superclass : #FLPlatform,
	#category : #FuelPlatform-Pharo-Core-FuelPlatform-Pharo-Core,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform class>>addNativeBoostComponents [
	Smalltalk
		at: #NBExternalHandle
		ifPresent: [ :handle | ^ self ].
		
	Object variableByteSubclass: #NBExternalHandle
		instanceVariableNames: ''
		classVariableNames: ''
		category: self hacksCategoryName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform class>>addPackageManifest [
	Smalltalk
		at: #PackageManifest
		ifPresent: [ ^ self ].
	
	Object subclass: #PackageManifest
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self hacksCategoryName
]

{
	#category : #private-hacks,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform class>>basicAddHacks [
	super basicAddHacks.
	
	self
		addNativeBoostComponents;
		addPackageManifest
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform class>>isResponsibleForCurrentPlatform [
	^ SystemVersion current version beginsWith: 'Pharo'
]

{
	#category : #accessing-system,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform>>absolutePathOf: aString [
	^ aString asFileReference fullName
]

{
	#category : #accessing-system,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform>>imageName [
	^ Smalltalk image shortImageName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform>>isPharo [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform>>isSpur [
	^ true
]

{
	#category : #accessing-compiler,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform>>renamedMethodCopyOf: aMethod selector: aSymbol [
	| newMethod |
	newMethod := aMethod ast
		selector: aSymbol
		yourself.
	"#compiledMethod answers a new instance"
	^ newMethod compiledMethod
]

{
	#category : #accessing-system,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPharoPlatform>>useAuthor: aString during: aBlock [
	(Smalltalk at: #Author)
		useAuthor: aString
		during: aBlock
]
