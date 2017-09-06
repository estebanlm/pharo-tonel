"
I am an abstract superclass for some visitors that answer Strings describing EpEvent instances.
"
Class {
	#name : #EpContentStringVisitor,
	#superclass : #EpEntryContentVisitor,
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 10/27/2014 18:05'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpContentStringVisitor>>displayBrowserOperation: aBrowserOperationEvent [

	^ String streamContents: [ :stream |
		stream 
			print: aBrowserOperationEvent entryReferences size;
			nextPutAll: ' code changes produced' ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpContentStringVisitor>>printProtocol: protocol sourceCode: sourceCode [

	^ String streamContents: [ :stream |
		stream
			nextPutAll: '"protocol: '; 
			nextPutAll: protocol printString;
			nextPut: $"; cr; cr;
			nextPutAll: sourceCode ]	
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpContentStringVisitor>>stringForBehavior: aClassOrTrait [

	^ String streamContents: [ :stream |
		stream
			nextPutAll: aClassOrTrait definitionSource;
			nextPut: $.;
			cr; cr;
			nextPutAll: aClassOrTrait theMetaClass definitionSource ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpContentStringVisitor>>visitEvent: anEvent [
	"By default display an empty string"

	^ ''
]
