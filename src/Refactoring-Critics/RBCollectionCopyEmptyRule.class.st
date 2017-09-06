"
Checks that all subclasses of the Collection classes that add an instance variable also redefine the copyEmpty method. This method is used when the collection grows. It copies over the necessary instance variables to the new larger collection.
"
Class {
	#name : #RBCollectionCopyEmptyRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:11'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionCopyEmptyRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionCopyEmptyRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'CollectionCopyEmptyRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionCopyEmptyRule>>basicCheck: aClass  [
	^ ((aClass inheritsFrom: Collection)
	and: [ aClass isVariable 
	and: [ (aClass includesSelector: #copyEmpty) not 
	and: [ aClass instVarNames isEmpty not ]]])
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionCopyEmptyRule>>checkClass: aClass  [
	(self basicCheck: aClass)
		ifTrue: [ result addClass: aClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionCopyEmptyRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionCopyEmptyRule>>name [
	^ 'Subclass of collection that has instance variable but doesn''t define copyEmpty'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionCopyEmptyRule>>resultClass [
	^ RBClassEnvironment
]
