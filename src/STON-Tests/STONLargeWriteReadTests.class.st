"
STONLargeWriteReadTests test the optimalizations for large structures.
"
Class {
	#name : #STONLargeWriteReadTests,
	#superclass : #STONWriteReadTests,
	#category : #STON-Tests,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONLargeWriteReadTests>>materialize: string [
	^ STON reader
		on: string readStream;
		optimizeForLargeStructures;
		next
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONLargeWriteReadTests>>serialize: anObject [
	^ String streamContents: [ :stream |
		STON writer 
			on: stream; 
			optimizeForLargeStructures; 
			nextPut: anObject ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONLargeWriteReadTests>>serializeJson: anObject [
	^ String streamContents: [ :stream |
		STON jsonWriter 
			on: stream; 
			prettyPrint: true;
			optimizeForLargeStructures; 
			nextPut: anObject ]
]
