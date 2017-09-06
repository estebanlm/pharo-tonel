"
A change report
"
Class {
	#name : #HDChangeReport,
	#superclass : #HDReport,
	#instVars : [
		'gofer'
	],
	#category : #JenkinsTools-ExtraReports,
	#timestamp : 'TorstenBergmann 2/12/2014 22:31'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport class>>runClasses: aCollectionOfClasses named: aString [
	self error: 'The change report is only runnable on packages.'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport class>>runPackage: aString [
	^ self runPackages: (Array with: aString)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport class>>runPackages: aCollectionOfStrings [
	^ (self new initializeOn: aCollectionOfStrings) run
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>changesFor: aResolvedVersion [
	| references patch |
	references := gofer allResolved
		select: [ :each | each packageName = aResolvedVersion packageName ].
	patch := MCPatch 
		fromBase: (references size > 1 
			ifTrue: [ (references at: references size - 1) version snapshot ]
			ifFalse: [ MCSnapshot empty ])
		target: aResolvedVersion version snapshot.
	^ patch operations asSortedCollection
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>generateChange: aPatch on: aStream [
	aPatch isAddition
		ifTrue: [ ^ self generateChangeAddition: aPatch on: aStream ].
	aPatch isModification
		ifTrue: [ ^ self generateChangeModification: aPatch on: aStream ].
	aPatch isRemoval
		ifTrue: [ ^ self generateChangeRemoval: aPatch on: aStream ]
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>generateChangeAddition: aPatch on: aStream [
	aStream tab; tab; tab; nextPutAll: '<item action="add">'; nextPutAll: (self encode: (self convert: aPatch summary)); nextPutAll: '</item>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>generateChangeModification: aPatch on: aStream [
	aStream tab; tab; tab; nextPutAll: '<item action="change">'; nextPutAll: (self encode: (self convert: aPatch summary)); nextPutAll: '</item>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>generateChangeRemoval: aPatch on: aStream [
	aStream tab; tab; tab; nextPutAll: '<item action="remove">'; nextPutAll: (self encode: (self convert: aPatch summary)); nextPutAll: '</item>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>generateChangeSet: aResolvedVersion on: aStream [
	| info |
	info := aResolvedVersion version info.
	aStream tab; nextPutAll: '<logentry version="'; nextPutAll: (self encode: info name); nextPutAll: '">'; nextPut: Character lf.
	aStream tab; tab; nextPutAll: '<date>'; nextPutAll: (self encode: info date yyyymmdd); space; nextPutAll: (self encode: info time print24); nextPutAll: '</date>'; nextPut: Character lf.
	aStream tab; tab; nextPutAll: '<author>'; nextPutAll: (self encode: info author); nextPutAll: '</author>'; nextPut: Character lf.
	aStream tab; tab; nextPutAll: '<msg>'; nextPutAll: (self encode: (self convert: info message)); nextPutAll: '</msg>'; nextPut: Character lf.
	"aStream tab; tab; nextPutAll: '<items>'; nextPut: Character lf.
	(self changesFor: aResolvedVersion)
		do: [ :each | self generateChange: each on: aStream ].
	aStream tab; tab; nextPutAll: '</items>'; nextPut: Character lf."
	aStream tab; nextPutAll: '</logentry>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>generateOn: aStream [
	aStream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; nextPut: Character lf.
	aStream nextPutAll: '<changelog>'; nextPut: Character lf.
	self resolved
		do: [ :each | self generateChangeSet: each on: aStream ].
	aStream nextPutAll: '<changelog>'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>initializeOn: aCollection [
	gofer := Gofer new.
	aCollection do: [ :each | gofer package: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>resolved [
	^ gofer resolved
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDChangeReport>>run [
	
	'changelog.xml' asFileReference ensureDelete writeStreamDo: [ :stream|
		self generateOn: stream ]
]
