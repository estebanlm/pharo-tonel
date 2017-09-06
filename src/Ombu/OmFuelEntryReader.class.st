"
I implement how to read entries from a stream using Fuel serializer.
"
Class {
	#name : #OmFuelEntryReader,
	#superclass : #OmEntryReader,
	#instVars : [
		'materializer'
	],
	#category : #Ombu-Persistence,
	#timestamp : 'MartinDias 12/12/2014 16:11'
}

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFuelEntryReader>>entryPositionsDo: aBlock [

	self shouldBeImplemented
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFuelEntryReader>>initialize [
	super initialize.
	materializer := FLMaterializer new.
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFuelEntryReader>>nextEntry [

	^ (materializer materializeFrom: stream) root
]
