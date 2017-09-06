"
I am a refactory change for a class comment change. Creating a RBClass during a refactoring operation and 
setting its class comment will create a comment change. Executing this change will set the class comment of the
class with my change stamp.
"
Class {
	#name : #RBCommentChange,
	#superclass : #RBRefactoryClassChange,
	#instVars : [
		'comment'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:28'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCommentChange class>>comment: aString in: aClass [
	^ self new
		changeClass: aClass;
		comment: aString;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCommentChange>>asUndoOperation [
	^ self copy
		comment: self changeClass organization classComment;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCommentChange>>changeClass: aBehavior [
	super changeClass: aBehavior.
	isMeta := false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCommentChange>>changeString [
	^ 'Comment ' , self displayClassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCommentChange>>comment [
	^ comment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCommentChange>>comment: aString  [
	comment := aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCommentChange>>primitiveExecute [
	self changeClass 
		classComment: comment
		stamp: self changeStamp.
	SystemAnnouncer uniqueInstance 
		classCommented: self changeClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCommentChange>>printOn: aStream  [
	aStream
		nextPutAll: self displayClassName;
		nextPutAll: ' classComment: ';
		print: (self comment copyReplaceAll: '!' with: '!!');
		nextPutAll: ' stamp: ';
		print: (self changeStamp);
		nextPutAll: '!'
]
