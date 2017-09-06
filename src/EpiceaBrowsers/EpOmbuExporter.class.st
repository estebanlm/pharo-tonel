"
I know how to export Epicea entries from one log to a new one.
"
Class {
	#name : #EpOmbuExporter,
	#superclass : #Object,
	#instVars : [
		'outputLog'
	],
	#category : #EpiceaBrowsers-Exporter,
	#timestamp : 'MartinDias 5/27/2014 14:29'
}

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOmbuExporter class>>askFileNameAndFileOut: entries in: aDirectory [

	| fileNameOrNil outputLog |
	fileNameOrNil := UIManager default
		request: 'Enter a file name (without extension)'
		initialAnswer: 'FileOut_', (UUID new asString36 first: 3).

	fileNameOrNil ifNil: [ ^ self ].

	(OmFileStore existsStoreNamed: fileNameOrNil inDirectory: aDirectory)
		ifTrue: [ ^ self inform: 'File already exists' ].

	outputLog := EpLog newWithStore: 
		(OmStoreFactory current named: fileNameOrNil inDirectory: aDirectory).

	self new 
		outputLog: outputLog;
		fileOut: entries.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOmbuExporter>>fileOut: epiceaEntries [

	| originalReference anEvent exportedReference visitor map |	
	map := Dictionary new.
	visitor := EpReferenceFixerVisitor newWithMap: map.
	
	epiceaEntries do: [ :anEntry | 
		originalReference := (anEntry tagAt: OmStore selfReferenceKey).

		anEvent := anEntry content accept: visitor.
		
		exportedReference := outputLog addEntryWith: anEvent tags: [ :tags |  ].
		
		map at: originalReference put: exportedReference.
		].
	
	outputLog store flush.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOmbuExporter>>outputLog [
	^ outputLog
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOmbuExporter>>outputLog: anObject [
	outputLog := anObject
]
