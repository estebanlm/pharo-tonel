"
STONWritePrettyPrinterReadTests tests pretty printed serialization followed by materialization.
"
Class {
	#name : #STONWritePrettyPrinterReadTests,
	#superclass : #STONWriteReadTests,
	#category : #STON-Tests,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWritePrettyPrinterReadTests>>serialize: anObject [
	^ String streamContents: [ :stream |
		STON writer 
			on: stream; 
			prettyPrint: true;
			nextPut: anObject ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWritePrettyPrinterReadTests>>serializeJson: anObject [
	^ String streamContents: [ :stream |
		STON jsonWriter 
			on: stream; 
			prettyPrint: true;
			nextPut: anObject ]
]
