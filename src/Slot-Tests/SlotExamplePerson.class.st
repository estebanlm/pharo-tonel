"
A SlotExamplePerson is an example class to demonstrate the workings of relation slots.
"
Class {
	#name : #SlotExamplePerson,
	#superclass : #Object,
	#instVars : [
		'#name',
		'#directedMovies => ToManyRelationSlot inverse: #director inClass: #SlotExampleMovie',
		'#actedInMovies => ToManyRelationSlot inverse: #actors inClass: #SlotExampleMovie'
	],
	#category : #Slot-Tests-Associations,
	#timestamp : 'JanVanDeSandt 2/27/2015 11:27'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExamplePerson class>>named: aString [

	^self new
		name: aString
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExamplePerson>>actedInMovies [
	^ actedInMovies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExamplePerson>>actedInMovies: anObject [
	actedInMovies := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExamplePerson>>directedMovies [
	^ directedMovies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExamplePerson>>directedMovies: anObject [
	directedMovies := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExamplePerson>>initialize [
	super initialize.
	self class initializeSlots: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExamplePerson>>name [
	
	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExamplePerson>>name: anObject [
	name := anObject
]
