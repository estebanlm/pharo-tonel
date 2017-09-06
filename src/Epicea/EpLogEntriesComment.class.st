"
I represent a comment to Epicea entries  performed in an EpLogBrowser.
"
Class {
	#name : #EpLogEntriesComment,
	#superclass : #EpLogBrowserOperation,
	#instVars : [
		'newComment',
		'oldComment'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogEntriesComment class>>entryReferences: aCollection oldComment: aString newComment: anotherString [
	^ self basicNew
		initializeWithEntryReferences: aCollection 
		oldComment: aString 
		newComment: anotherString;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogEntriesComment>>accept: aVisitor  [
	^ aVisitor visitLogCommentModification: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogEntriesComment>>comment [
	^ self newComment
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogEntriesComment>>copyWithEntryReferences: aCollection [
	^ self class
		entryReferences: aCollection
		oldComment: self oldComment
		newComment: self newComment
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogEntriesComment>>initializeWithEntryReferences: aCollection oldComment: theOldComment newComment: theNewComment  [
	self initializeWith: aCollection.
	oldComment := theOldComment.
	newComment := theNewComment.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogEntriesComment>>isEpLogEntriesComment [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogEntriesComment>>newComment [
	^ newComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogEntriesComment>>oldComment [
	^ oldComment
]
