"
I represent the declaration of a class comment in a file.  My contents are the class comment to import, and the comment reader is the object who knows the class where to put the class comment.

Sending me the message #import makes me install the comment into the class.
"
Class {
	#name : #ClassCommentChunk,
	#superclass : #BehaviorOwnedChunk,
	#instVars : [
		'stamp'
	],
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassCommentChunk class>>contents: someContents behaviorName: behaviorName isMeta: aBoolean stamp: stamp [
	^self new
			contents: someContents;
			behaviorName: behaviorName;
			isMeta: aBoolean;
			stamp: stamp;
			yourself
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassCommentChunk>>accept: aVisitor [

	^ aVisitor visitClassCommentChunk: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassCommentChunk>>description [

	^ 'Comment (', behaviorName, ')', stamp asString
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassCommentChunk>>importFor: aRequestor logSource: logSource [
	(self existsBehavior)
		ifFalse: [ self error: ('Cannot install comment in unexistent behavior {1}' format: { behaviorName asString } ) ].
	
	^self targetClass theNonMetaClass
						classComment: contents
						stamp: stamp
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassCommentChunk>>isClassCommentDeclaration [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassCommentChunk>>stamp [
	^ stamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassCommentChunk>>stamp: classCommentStamp [
	stamp := classCommentStamp
]
