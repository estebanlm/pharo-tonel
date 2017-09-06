"
I represent any commitable object, mainly a simple commit or a slice
"
Class {
	#name : #KomitableObject,
	#superclass : #Object,
	#instVars : [
		'author',
		'entities',
		'message',
		'timestamp',
		'remote',
		'unselectedEntities'
	],
	#category : #Komitter-Models,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>author [
	^ author
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>author: anObject [
	author := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>commitToMonticello [

	Komitter resetLastMessage.
	KomitStagingArea resetCurrent.

	MCKomitSubmitter new
		submitCommit: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>entities [
	^ entities
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>entities: aDictionary [
	entities := aDictionary
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>initialize [

	super initialize.
	author := Author fullName.
	entities := Dictionary new.
	unselectedEntities := Dictionary new.
	message := ''.
	timestamp := DateAndTime now.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>message [
	^ message
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>message: anObject [
	message := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>remote [
	^ remote
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>remote: anObject [
	remote := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>repository [
	
	^ self remote remote
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>timestamp [
	^ timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>timestamp: anObject [
	timestamp := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>unselectedEntities [
	^ unselectedEntities
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitableObject>>unselectedEntities: anObject [
	unselectedEntities := anObject
]
