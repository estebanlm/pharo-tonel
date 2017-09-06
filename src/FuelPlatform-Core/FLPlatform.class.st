"

"
Class {
	#name : #FLPlatform,
	#superclass : #Object,
	#classVars : [
		'Current'
	],
	#category : #FuelPlatform-Core,
	#timestamp : ''
}

{
	#category : #private-extensions,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>addExtensions [
	self extensionPragmas do: [ :pragma |
		(FLExtensionWrapper fromPragma: pragma) install ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>addHacks [
	self current
		useAuthor: 'Fuel'
		during: [ self basicAddHacks ]
]

{
	#category : #private-hacks,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>basicAddHacks [
	self
		fixMetacello;
		addExtensions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>current [
	^ Current ifNil: [ Current := self detectPlatform ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>detectPlatform [
	| matches mostSpecific |
	matches := self allSubclasses 
		select: [ :class | class isResponsibleForCurrentPlatform ].
	mostSpecific := matches first.
	matches do: [ :class |
		class allSubclasses size < mostSpecific allSubclasses size ifTrue: [
			mostSpecific := class ] ].
	
	^ mostSpecific new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>extensionCategoryName [
	^ 'FuelPlatformExtensions'
]

{
	#category : #private-extensions,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>extensionPragmas [
	| pragmas |
	pragmas := Dictionary new.
	#(
		flExtensionOf:
		flExtensionOf:selector:
		flExtensionOf:selector:isSource:
		flExtensionOf:isSource:) do: [ :selector |
			| stop |
			stop := false.
			self class withAllSuperclassesDo: [ :class |
				stop ifFalse: [
					Pragma withPragmasIn: class do:  [ :pragma |
						(pragma keyword = selector and: [
							"don't collect overridden methods"
							(pragmas includesKey: pragma selector) not ]) ifTrue: [
								pragmas
									at: pragma selector
									put: pragma ] ].
						FLPlatform class = class ifTrue: [ stop := true ] ] ] ].
			
	^ pragmas values
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>extensionProtocolName [
	^ '*', self extensionCategoryName
]

{
	#category : #private-hacks-metacello,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>fixMetacello [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>hacksCategoryName [
	^ 'FuelPlatformHacks'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>isResponsibleForCurrentPlatform [
	^ self subclassResponsibility
]

{
	#category : #private-convenience,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>removeModifications [
	((Smalltalk globals at: #(Smalltalk globals at: #PackageInfo)) named: self extensionProtocolName) extensionMethods do: [ :methodReference |
		methodReference actualClass removeSelector: methodReference selector ].
	((Smalltalk globals at: #(Smalltalk globals at: #PackageInfo)) named: self hacksCategoryName) in: [ :hacks |
		hacks classes do: [ :classOrTrait |
			classOrTrait removeFromSystem ].
		(Smalltalk globals at: #PackageOrganizer) default  unregisterPackage: hacks ].
	SystemOrganizer default removeCategory: self hacksCategoryName
]

{
	#category : #private-convenience,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform class>>reset [
	Current := nil
]

{
	#category : #accessing-system,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>absolutePathOf: aString [
	^ self subclassResponsibility
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>addHacks [
	self class addHacks
]

{
	#category : #accessing-files,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>deleteFileNamed: aFilename [
	self subclassResponsibility
]

{
	#category : #accessing-files,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>fileNamed: aFilename readStreamDo: aBlock [
	^ self subclassResponsibility
]

{
	#category : #accessing-files,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>fileNamed: aFilename writeStreamDo: aBlock [
	^ self subclassResponsibility
]

{
	#category : #accessing-system,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>imageName [
	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>isBigEndian [
	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>isPharo [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>isSpur [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>isSqueak [
	^ false
]

{
	#category : #accessing-compiler,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>renamedMethodCopyOf: aMethod selector: aSymbol [
	^ self subclassResponsibility
]

{
	#category : #accessing-system,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>useAuthor: aString during: aBlock [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPlatform>>versionNumber [
	^ ('\d+' asRegex matchesIn: self className) first asInteger
]
