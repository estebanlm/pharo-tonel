"
This smell arises when a class defines #= also and not #hash. If #hash is not defined then the instances of the class might not be able to be used in sets since equal element must have the same hash.

When a class defines = also and not hash, this can lead to really subtle bugs and behavior where sometimes it appears that an object is in a set and sometimes not. 

One pattern proposed by Kent Beck in Best Smalltalk Practices is to define hash in terms of instance variable hash xor. Here is an example:
	
	Book>>= anotherBook
		^ (self author = anotherBook author) and: [self title = anotherBook title]
	
	Book>>hash
		^ (self title hash bitXor: self title hash		
"
Class {
	#name : #RBDefinesEqualNotHashRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:10'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefinesEqualNotHashRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefinesEqualNotHashRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'DefinesEqualNotHashRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefinesEqualNotHashRule>>basicCheck: aClass  [
	^ ((aClass includesSelector: #=) and: [ (aClass includesSelector: #hash) not ])
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefinesEqualNotHashRule>>checkClass: aClass  [
	(self basicCheck: aClass) ifTrue: [
		result addClass: aClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefinesEqualNotHashRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefinesEqualNotHashRule>>name [
	^ 'Defines = but not hash'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefinesEqualNotHashRule>>rationale [
	^ 'Checks that all classes that define = also define hash.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDefinesEqualNotHashRule>>resultClass [
	^ RBClassEnvironment
]
