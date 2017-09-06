"

"
Class {
	#name : #STONWriteAsciiOnlyReadTests,
	#superclass : #STONWriteReadTests,
	#category : #STON-Tests,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriteAsciiOnlyReadTests>>serialize: anObject [
	^ String streamContents: [ :stream |
		STON writer 
			on: stream; 
			asciiOnly: true;
			nextPut: anObject ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriteAsciiOnlyReadTests>>serializeJson: anObject [
	^ String streamContents: [ :stream |
		STON jsonWriter 
			on: stream; 
			asciiOnly: true;
			nextPut: anObject ]
]
