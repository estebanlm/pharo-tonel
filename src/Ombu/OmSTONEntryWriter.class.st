"
I implement how to write entries to a stream using Ston serializer.
"
Class {
	#name : #OmSTONEntryWriter,
	#superclass : #OmEntryWriter,
	#instVars : [
		'writer'
	],
	#category : #Ombu-Persistence,
	#timestamp : 'MartinDias 12/12/2014 16:11'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryWriter>>initialize [
	super initialize.
	writer := self newSTONWriter
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryWriter>>newSTONWriter [
	^ STON writer
		prettyPrint: true;
		yourself
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryWriter>>on: aStream nextEntryPut: anEntry  [

	OmCurrentGlobalName
		value: store globalName
		during: [
			writer 
				reset;
				on: aStream;
				nextPut: anEntry.

			aStream cr;cr ]
]
