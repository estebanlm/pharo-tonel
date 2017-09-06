"
I represent a Undo operation performed in a EpLogBrowser.
"
Class {
	#name : #EpUndo,
	#superclass : #EpLogBrowserOperation,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:51'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpUndo class>>forAll: aCollectionOfEntryReferences [
	^ self basicNew
		initializeWith: aCollectionOfEntryReferences;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpUndo>>accept: aChangeVisitor [
	^ aChangeVisitor visitUndo: self
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpUndo>>copyWithEntryReferences: aCollection [
	^ self class forAll: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpUndo>>title [
	^ 'Revert changes'
]
