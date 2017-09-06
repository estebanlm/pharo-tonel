"
A SlotExampleMovie is an example class to demonstrate the workings of relation slots.
"
Class {
	#name : #SlotExampleMovie,
	#superclass : #Object,
	#instVars : [
		'#name',
		'#year',
		'#director => ToOneRelationSlot inverse: #directedMovies inClass: #SlotExamplePerson',
		'#actors => ToManyRelationSlot inverse: #actedInMovies inClass: #SlotExamplePerson'
	],
	#category : #Slot-Tests-Associations,
	#timestamp : 'JanVanDeSandt 2/27/2015 11:27'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie class>>named: aString [

	^self new
		name: aString
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>actors [
	^ actors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>actors: anObject [
	actors := anObject
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>addActor: aPerson [

	^actors add: aPerson
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>director [
	^ director
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>director: aPerson [

	director := aPerson
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>initialize [
	super initialize.
	self class initializeSlots: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>name: anObject [
	name := anObject
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovie>>removeActor: aPerson [

	^actors remove: aPerson
]
