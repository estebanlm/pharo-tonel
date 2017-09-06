"
This smell arises when a class has its class name directly in the source instead of ""self class"". The self class variant allows you to create subclasses without needing to redefine that method.
However we cannot systematically replace Class reference by self class or self because a Class reference is static and a self expression is dynamic. So the programmer may want to send messages to root of an hierarchy and not to the leaf classes. 
"
Class {
	#name : #RBRefersToClassRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:28'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefersToClassRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefersToClassRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'RefersToClassRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefersToClassRule>>basicCheck: aMethod [
	| class |
	class := aMethod methodClass theNonMetaClass.
	^ aMethod hasLiteral: (class environment associationAt: class name ifAbsent: [ ^ false ])
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefersToClassRule>>checkMethod: aMethod [
	(self basicCheck: aMethod) ifTrue: [ 
		result
			addMethod: aMethod;
			addSearchString: aMethod methodClass name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefersToClassRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefersToClassRule>>name [
	^ 'Refers to class name instead of "self class"'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRefersToClassRule>>rationale [
	^ 'Checks for direct reference to classes themselves.'
]
