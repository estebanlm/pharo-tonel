"
I'm the entry point of this project.
I'm a kind of application model for the Komitter - this is why (it could be discussed) I create the UI of the Kommiter

A classic invocation is

| s k |
s := KomitStagingArea current.
k := Komitter new.
k stagingArea: s.
k open.

k lastCommit  
"
Class {
	#name : #Komitter,
	#superclass : #Model,
	#instVars : [
		'stagingArea',
		'lastCommit',
		'view'
	],
	#classInstVars : [
		'lastMessage'
	],
	#category : #Komitter-Models,
	#timestamp : 'StephaneDucasse 11/24/2015 19:16'
}

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter class>>komitterMenuOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Komitter)
		action: [ self openAndCommitToMonticello ];
		order: 0.29;
		parent: #Tools;
		help: 'Cherry pick what you commit';
		keyText: 'o, k';
		icon: self taskbarIcon.
	aBuilder withSeparatorAfter
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter class>>lastMessage [

	^ lastMessage ifNil: [ MCSaveVersionDialog previousMessages first ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter class>>lastMessage: aString [

	lastMessage := aString
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter class>>openAndCommitToMonticello [

	KomitStagingArea resetCurrent.
	^ self new
		stagingArea: KomitStagingArea current;
		openAndCommitToMonticello;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter class>>openAndCommitToMonticelloWorkingCopiesFilteredBy: aFilterBlock [
	| stagingArea |

	KomitStagingArea resetCurrent.
	stagingArea := KomitStagingArea currentFilteredBy: aFilterBlock.
	^ self new
		stagingArea: stagingArea;
		openAndCommitToMonticello;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter class>>resetLastMessage [

	lastMessage := nil
]

{
	#category : #icon,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter class>>taskbarIconName [
	^#komitterIcon
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>initialize [

	super initialize.
	self registerToAnnouncements.
	stagingArea := nil asValueHolder.
	lastCommit := nil asValueHolder.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>lastCommit [

	^ lastCommit value
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>lastCommit: aKomit [

	lastCommit value: aKomit
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>lastMessage [

	^ self class lastMessage
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>mcPackageModified: anAnnouncement [
	| package |

	package := anAnnouncement package koPackage.
	
	package patch isEmpty
		ifTrue: [ self stagingArea removePackage: package ]
		ifFalse: [ self stagingArea addPackage: package ].
	
	view ifNil: [ ^ self ].
	
	package patch isEmpty
		ifTrue: [ view removeRoot: package ]
		ifFalse: [ view addRoot: package ]
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>methodModified: anAnnouncement	 [

	self rebuildStagingArea.
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>methodMoved: anAnnouncement [

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>newSlice [

	^ KomitNewSlice new
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>openAndCommitToMonticello [

	self openAndDo: [ self lastCommit ifNotNil: [ self lastCommit commitToMonticello ]]
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>openAndDo: aBlock [
	
	self stagingArea packages
		ifEmpty: [ ^ self inform: 'No changes to commit' ].

	view ifNil: [ view := KomitterUI new
		model: self;
		yourself ].
	
	view openDialogWithSpec
		okAction: [ | valid |
			valid := view validate.
			valid ifTrue: [ self lastCommit: view komit ].
			aBlock value.
			valid ];
		cancelAction: [ 
			self lastCommit: nil.
			view cancel ];
		centered
]

{
	#category : #rebuilding,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>rebuildStagingArea [

	self stagingArea flush.
	view model: self
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>registerToAnnouncements [

	SystemAnnouncer uniqueInstance weak	
		when: MCPackageModified send: #rebuildStagingArea to: self;
		when: ClassAdded, ClassModifiedClassDefinition, ClassRenamed, ClassCommented send: #rebuildStagingArea to: self;
		when: ClassRepackaged send: #rebuildStagingArea to: self;
		when: ClassRemoved send: #rebuildStagingArea to: self;
		when: MethodAdded, MethodModified, MethodRecategorized send: #rebuildStagingArea to: self;
		when: MethodRepackaged send: #rebuildStagingArea to: self;
		when: MethodRemoved send: #rebuildStagingArea to: self
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>remotes [

	^ self stagingArea remotes asOrderedCollection
		add: self newSlice;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>remotesFor: aCollection [

	^ (self stagingArea remotesFor: aCollection) asOrderedCollection
		add: self newSlice;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>stagingArea [

	^ stagingArea value 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>stagingArea: anObject [

	stagingArea value: anObject
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komitter>>unsubscribe [
	SystemAnnouncer uniqueInstance unsubscribe: self
]
