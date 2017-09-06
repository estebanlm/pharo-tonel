"
I implement how to write entries to a stream using Fuel serializer.
"
Class {
	#name : #OmFuelEntryWriter,
	#superclass : #OmEntryWriter,
	#instVars : [
		'serializer'
	],
	#category : #Ombu-Persistence,
	#timestamp : 'MartinDias 12/12/2014 16:11'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFuelEntryWriter>>initialize [
	super initialize.
	serializer := FLSerializer new
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFuelEntryWriter>>on: aStream nextEntryPut: anEntry  [

	serializer
		serialize: anEntry 
		on: aStream
]
