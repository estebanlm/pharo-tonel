"
I represent a ReDo operation performed in a EpLogBrowser.
"
Class {
	#name : #EpRedo,
	#superclass : #EpLogBrowserOperation,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:51'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRedo class>>forAll: aCollectionOfEntryReferences [
	^ self basicNew
		initializeWith: aCollectionOfEntryReferences;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRedo>>accept: aChangeVisitor [
	^ aChangeVisitor visitRedo: self
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRedo>>copyWithEntryReferences: aCollection [
	^ self class forAll: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRedo>>title [
	^ 'Apply changes'
]
