"
I represent a change in the comment of a class or a trait.
"
Class {
	#name : #EpBehaviorCommentChange,
	#superclass : #EpBehaviorChange,
	#instVars : [
		'behavior',
		'oldComment',
		'newComment',
		'oldStamp',
		'newStamp'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange class>>newWith: aClassCommentedAnnouncement  [

	^self
		newWithBehavior: aClassCommentedAnnouncement classCommented asEpiceaRingDefinition
		oldComment: aClassCommentedAnnouncement oldComment asString
		newComment: aClassCommentedAnnouncement newComment asString
		oldStamp: aClassCommentedAnnouncement oldStamp
		newStamp: aClassCommentedAnnouncement newStamp
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange class>>newWithBehavior: aBehavior oldComment: anOldComment newComment: aNewComment oldStamp: anOldStamp newStamp: aNewStamp [

	^ self basicNew
		initializeWithBehavior:aBehavior
		oldComment: anOldComment
		newComment: aNewComment
		oldStamp: anOldStamp
		newStamp: aNewStamp;
		yourself

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange>>accept: aChangeVisitor  [
	^ aChangeVisitor visitBehaviorCommentChange: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange>>behaviorAffected [
	^ behavior
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange>>behaviorAffectedName [
	^ behavior name
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange>>initializeWithBehavior: aBehavior oldComment: anOldComment newComment: aNewComment oldStamp: anOldStamp newStamp: aNewStamp [

	self initialize.
	behavior := aBehavior.
	oldComment := anOldComment.
	newComment := aNewComment.
	oldStamp := anOldStamp.
	newStamp := aNewStamp.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange>>newComment [
	^ newComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange>>newStamp [
	^ newStamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange>>oldComment [
	^ oldComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCommentChange>>oldStamp [
	^ oldStamp
]
