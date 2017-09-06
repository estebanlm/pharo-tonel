"
I am an abstract class defining the interface for reading sources containing class and method definitions.
I should define loadDefinitions as a subclassResponsibility, but don't.
MCVersionReader could be a subclass of me for reading sources containing additional metadata, but isn't. 

I'm useless and can be safely removed. I'm only referenced in MCMczReader>>extractDefinitionsFrom: and it can be replaced by MCReader.
"
Class {
	#name : #MCSnapshotReader,
	#superclass : #MCReader,
	#instVars : [
		'definitions'
	],
	#category : #Monticello-Storing,
	#timestamp : 'LaurentLaffont 2/23/2011 20:21'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshotReader class>>snapshotFromStream: aStream [
	^ (self on: aStream) snapshot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshotReader>>definitions [
	definitions ifNil: [self loadDefinitions].
	^ definitions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshotReader>>snapshot [
	^ MCSnapshot fromDefinitions: self definitions
]
