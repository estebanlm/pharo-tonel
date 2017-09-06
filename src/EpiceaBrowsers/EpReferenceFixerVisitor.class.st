"
I fix references from Epicea events to Epicea entries.
"
Class {
	#name : #EpReferenceFixerVisitor,
	#superclass : #Object,
	#traits : 'EpTEventVisitor',
	#classTraits : 'EpTEventVisitor classTrait',
	#instVars : [
		'referencesMap'
	],
	#category : #EpiceaBrowsers-Exporter,
	#timestamp : 'MartinDias 5/27/2014 14:29'
}

{
	#category : #instanceCreation,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpReferenceFixerVisitor class>>newWithMap: aMap  [

	^ self basicNew
		initializeWithMap: aMap;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpReferenceFixerVisitor>>initializeWithMap: aReferencesMap [

	self initialize.
	
	referencesMap := aReferencesMap
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpReferenceFixerVisitor>>visitEvent: anEvent [
	"No transformation in the general case"
	
	^ anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpReferenceFixerVisitor>>visitLogCommentModification: anEvent  [
	^ anEvent copyWithEntryReferences: referencesMap values.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpReferenceFixerVisitor>>visitRedo: aRedoEvent [
	^ aRedoEvent copyWithEntryReferences: referencesMap values.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpReferenceFixerVisitor>>visitUndo: anUndoEvent [
	^ anUndoEvent copyWithEntryReferences: referencesMap values.
]
