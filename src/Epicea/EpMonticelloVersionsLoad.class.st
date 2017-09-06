"
I represent a Monticello ""Load Versions"" operation performed in the system.
"
Class {
	#name : #EpMonticelloVersionsLoad,
	#superclass : #EpEvent,
	#instVars : [
		'versionNames'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad class>>versionNames: aCollectionOfVersionNames [

	^ self basicNew
		initializeWith: aCollectionOfVersionNames;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad class>>versions: aCollectionOfVersions  [

	^ self versionNames: (aCollectionOfVersions collect: [ :version | version info name ])
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>= anObject [

	^ (self class = anObject class)
		and: [ self versionNames = anObject versionNames ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>accept: aChangeVisitor  [
	^ aChangeVisitor visitMonticelloVersionsLoad: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>affectedPackageName [
	
	self flag: #todo. "FIX: imprecise answer"
	
	^ self packageNames first
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>hash [

	^ self class hash
		bitXor: self versionNames hash
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>initializeWith: aCollectionOfVersionNames [
	self initialize.
	versionNames := aCollectionOfVersionNames
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>isMonticelloVersionsLoad [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>packageNames [

	^ versionNames collect: [ :each | each copyUpToLast: $- ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>printOn: aStream [

	super printOn: aStream.
	versionNames printElementsOn: aStream.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMonticelloVersionsLoad>>versionNames [
	^ versionNames
]
