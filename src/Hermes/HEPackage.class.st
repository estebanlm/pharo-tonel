Class {
	#name : #HEPackage,
	#superclass : #HEAbstractExported,
	#instVars : [
		'version',
		'packageName',
		'classes',
		'extensionMethods',
		'traits'
	],
	#category : #Hermes-Model
}

{ #category : #formatting }
HEPackage class >> for: aPackage [
	^ self new
		fromPackage: aPackage;
		yourself
]

{ #category : #formatting }
HEPackage class >> formatVersion [
	^ 0
]

{ #category : #adding }
HEPackage >> addClass: anExportedClass [
	classes add: anExportedClass.
]

{ #category : #accessing }
HEPackage >> classes [
	^ classes
]

{ #category : #accessing }
HEPackage >> classes: anObject [
	classes := anObject
]

{ #category : #accessing }
HEPackage >> extensionMethods [
	^ extensionMethods
]

{ #category : #accessing }
HEPackage >> extensionMethods: anObject [
	extensionMethods := anObject
]

{ #category : #initialization }
HEPackage >> fromPackage: aPackage [
	| classDefinedSorted |
	packageName := aPackage name.

	traits := (aPackage definedClasses select: #isTrait) collect: [ :e | HETrait for: e ] as: OrderedCollection.

	classDefinedSorted := (aPackage definedClasses reject: #isTrait) sorted: [ :a :b | a allSuperclasses size < b allSuperclasses size ].

	classDefinedSorted do: [ :e | self addClass: (HEClass for: e) ].
	aPackage extensionMethods do: [ :e | extensionMethods add: (HEMethod for: e) ]
]

{ #category : #initialization }
HEPackage >> initialize [
	version := self class formatVersion.
	classes := OrderedCollection new.
	traits := OrderedCollection new.

	extensionMethods := OrderedCollection new.
]

{ #category : #accessing }
HEPackage >> packageName [
	^ packageName
]

{ #category : #accessing }
HEPackage >> packageName: anObject [
	packageName := anObject
]

{ #category : #printing }
HEPackage >> printOn: aStream [
	aStream
		nextPutAll: 'HEPackage ( ';
		nextPutAll: packageName asString;
		nextPutAll: ' )'
]

{ #category : #reading }
HEPackage >> readClassFrom: aReader [
	classes add: (HEClass readFrom: aReader).
	
]

{ #category : #reading }
HEPackage >> readFrom: aReader [
	| numberOfTraits numberOfClasses numberOfExtensionMethods |
	version := aReader readInt.
	packageName := aReader readByteSymbol.

	numberOfTraits := aReader readInt.
	1 to: numberOfTraits do: [ :idx | traits add: (HETrait readFrom: aReader)].

	numberOfClasses := aReader readInt.
	1 to: numberOfClasses do: [ :idx | classes add: (HEClass readFrom: aReader)].

	numberOfExtensionMethods := aReader readInt.
	1 to: numberOfExtensionMethods do: [ :idx | extensionMethods add: (HEMethod readFrom: aReader) ]
]

{ #category : #accessing }
HEPackage >> traits [
	^ traits
]

{ #category : #accessing }
HEPackage >> traits: anObject [
	traits := anObject
]

{ #category : #accessing }
HEPackage >> version [
	^ version
]

{ #category : #writing }
HEPackage >> writeInto: aWriter [
	aWriter writeInt: version.
	aWriter writeByteString: packageName.

	aWriter writeInt: traits size.
	traits do: [ :each | each writeInto: aWriter ].

	aWriter writeInt: classes size.
	classes do: [ :each | each writeInto: aWriter ].

	aWriter writeInt: extensionMethods size.
	extensionMethods do: [ :e | e writeInto: aWriter ].

	aWriter flush.
]
