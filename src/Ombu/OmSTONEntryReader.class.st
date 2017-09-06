"
I implement how to read entries from a stream using Ston serializer.
"
Class {
	#name : #OmSTONEntryReader,
	#superclass : #OmEntryReader,
	#instVars : [
		'reader'
	],
	#category : #Ombu-Persistence,
	#timestamp : 'MartinDias 12/12/2014 16:11'
}

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryReader>>entryPositionsDo: aBlock [

	[ self
		nextEntryPositionIfFound: [:position |
			aBlock value: position. true ] 
		ifNone: [ false ]
	] whileTrue
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryReader>>entryPositionsReverseDo: aBlock [

	| found token |
	token := 'OmEntry {'.
	stream setToEnd.

	[	[ 	found := stream backUpTo: token. 
			stream skip: token size negated. ] 
				doWhileTrue: [ found and: [ stream peek = $\ ] ].

		found ifFalse: [ ^self ].

		stream skip: token size negated.
		aBlock value: stream position.
			
	] doWhileTrue: true

]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryReader>>entryPositionsUpTo: endPosition [

	| positions |
	positions := OrderedCollection new.
	
	self entryPositionsDo: [ :position |
		position > endPosition ifTrue: [ ^positions ].
		positions add: position ].
	
	^ positions
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryReader>>nextEntry [

	^ OmCurrentGlobalName
		value: store globalName
		during: [
			self stonReader
				reset;
				next ]
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryReader>>nextEntryPositionIfFound: foundBlock ifNone: noneBlock [

	| token |
	token := 'OmEntry {'.
	
	[ 	stream upToAll: token.
		stream peek = $\ ] whileTrue.	"here we handle case when log contains this method itself"

	^stream atEnd
		ifTrue: noneBlock
		ifFalse: [ foundBlock value: stream position - token size ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryReader>>stonReader [

	^ reader ifNil: [ 
		reader := STON reader
			allowComplexMapKeys: true;
			yourself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSTONEntryReader>>stream: aReadStream [

	super stream: aReadStream.
	self stonReader on: stream.

]
