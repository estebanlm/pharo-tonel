"
I represent the declaration of a class organization in a file.  My contents is the class organization string to import, and the class organizer is the one of the changed class.

Sending me the message #import makes me install the class organization I carry into the class.
"
Class {
	#name : #ClassOrganizationChunk,
	#superclass : #BehaviorOwnedChunk,
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassOrganizationChunk class>>contents: someContents behaviorName: behaviorName isMeta: aBoolean [
	^self new
		contents: someContents;
		behaviorName: behaviorName;
		isMeta: aBoolean;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassOrganizationChunk class>>contents: someContents organizer: aClassOrganizer  [
	^self new
			contents: someContents;
			organizer: aClassOrganizer;
			yourself
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassOrganizationChunk>>accept: aVisitor [

	^ aVisitor visitClassOrganizationChunk: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassOrganizationChunk>>description [

	^ 'Organization (', behaviorName, ')'
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassOrganizationChunk>>importFor: aRequestor logSource: logSource [
	(self existsBehavior)
		ifFalse: [ self error: ('Cannot change organization of unexistent behavior {1}' format: { behaviorName asString } ) ]. 
		
	self targetClass organization changeFromString: contents
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ClassOrganizationChunk>>isClassOrganizationDeclaration [

	^ true
]
