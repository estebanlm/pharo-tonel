"
I am a simple log utility that can be enabled by sending the #setDebug and disabled by using #removeDebug. I trace the keymapping events.
"
Class {
	#name : #KMLog,
	#superclass : #Object,
	#classInstVars : [
		'debug'
	],
	#category : #Keymapping-Core,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMLog class>>log: aKeyEvent [

	debug == true ifFalse: [ ^self ].
	
	self logger
		nextPutAll: aKeyEvent printString;
		cr;
		flush.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMLog class>>logCompleteMatch: aKeymap [

	debug == true ifFalse: [ ^self ].
	
	self logger 
		nextPutAll: 'Complete match: ';
		nextPutAll: aKeymap printString;
		cr;
		flush.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMLog class>>logCompleteMatchBetween: aMorph and: aKeymap [

	debug == true ifFalse: [ ^self ].
	
	self logger 
		nextPutAll: aMorph printString;
		nextPutAll: ' Complete match: ';
		nextPutAll: aKeymap printString;
		cr;
		flush.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMLog class>>logPartialMatch: anEvent [

	debug == true ifFalse: [ ^self ].
	
	self logger 
		nextPutAll: 'Partial match: ';
		nextPutAll: anEvent printString;
		cr;
		flush.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMLog class>>logger [

	^Transcript
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMLog class>>removeDebug [
	debug := false
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMLog class>>setDebug [
	debug := true
]
