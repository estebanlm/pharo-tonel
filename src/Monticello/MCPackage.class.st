"
MCPackage represents a package. It is merely a wrapper on top of a package set or packageInfo.

Strangely enough it does not inherit from MCDefinition.

Its most important method is snapshot which returns a snapshot with all the entities that should be saved. 
"
Class {
	#name : #MCPackage,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #Monticello-Base,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage class>>named: aString [
	^ self new name: aString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>= other [
	^ other species = self species and: [other name sameAs: name]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>correspondingRPackage [

	^ RPackageOrganizer default packageNamed: self name asSymbol ifAbsent: [ nil ]
]

{
	#category : #'working copies',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>hasWorkingCopy [
	^ MCWorkingCopy registry includesKey: self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>hash [
	^ name asLowercase hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>isDirty [
	
	^ self workingCopy
		ifNil: [ false ]
		ifNotNil: [ :wc | wc modified ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>name: aString [
	name := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>packageSet [
	^ RPackageSet named: name
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: name;
		nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>snapshot [
	| rPackageSet definitions categories |
	rPackageSet := self packageSet.
	definitions := OrderedCollection new.
	categories := rPackageSet categoryNames asArray.
	categories isEmpty 
		ifFalse: [ definitions add: (MCOrganizationDefinition categories: categories) ].
		
	rPackageSet methods 
		do: [:ea | definitions add: ea asMCMethodDefinition] 
		displayingProgress: [ :ea| 'Snapshotting methods...' ].
		
	rPackageSet overriddenMethods
		do: [:ea | definitions add:
					(rPackageSet changeRecordForOverriddenMethod: ea) asMCMethodDefinition]
		displayingProgress: [ :ea| 'Searching for overrides in ', ea asString ].
		
	rPackageSet definedClasses 
		do: [:ea | definitions addAll: ea classDefinitions] 
		displayingProgress: [ :ea| 'Snapshotting class ', ea asString ].
		
	^ MCSnapshot fromDefinitions: definitions

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>storeOn: aStream [
	aStream
		nextPutAll: 'MCPackage';
		space; nextPutAll: 'named: '; store: name.
]

{
	#category : #'working copies',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>unload [
	^ self workingCopy unload
]

{
	#category : #'working copies',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackage>>workingCopy [
	^ MCWorkingCopy forPackage: self.
]
