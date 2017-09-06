"
A group containing methods
"
Class {
	#name : #MethodGroup,
	#superclass : #Group,
	#instVars : [
		'methods'
	],
	#category : #Nautilus-GroupManager,
	#timestamp : 'FranckWarlouzet 7/7/2015 09:21'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup class>>named: aString methods: aCollectionOfMethods [
	^ self new
		name: aString;
		methods: aCollectionOfMethods;
		yourself
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>classes [
	| classesCollection |
	classesCollection := OrderedCollection new.
	methods
		do: [ :method | method methodClass ifNotNil: [ classesCollection addIfNotPresent:  method methodClass theNonMetaClass ] ].
	^ classesCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>elements [
	^ methods
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>hasClassNamed: aClassName [
	^ self classes includes: aClassName
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>initialize [
	super initialize.
	methods := OrderedCollection new.
	SystemAnnouncer uniqueInstance weak when: MethodAdded send: #methodAdded: to: self.
	SystemAnnouncer uniqueInstance weak when: MethodModified send: #methodModified: to: self
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>methodAdded: anAnnouncement [
	methods add: anAnnouncement methodAdded
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>methodModified: anAnnouncement [
	methods add: anAnnouncement newMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>methods [
	^ methods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>methods: aCollection [
	methods := aCollection.
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>methodsFor: aClass [
	| methodsForAClass |
	methodsForAClass := OrderedCollection new.
	aClass methods
		do: [ :method | 
			method methodClass = aClass
				ifTrue: [ methodsForAClass add: method ] ].
	^ methodsForAClass
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>methodsFor: aClass categorised: aSymbol [
	| methodsForAClass |
	aSymbol ifNil: [ ^ self methodsFor: aClass ].
	methodsForAClass := OrderedCollection new.
	( aClass methodsInProtocol: aSymbol)
		do: [ :method | 
			method methodClass = aClass
				ifTrue: [ methodsForAClass add: method ] ].
	^ methodsForAClass
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>protocolsFor: aClass [

	^ aClass protocols sort
]
