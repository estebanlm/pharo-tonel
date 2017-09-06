"
This rule checks if all subclassResponsibility methods are defined in all leaf classes. if such a method is not overridden, a subclassResponsibility message can be occur when this method is called.
"
Class {
	#name : #RBSubclassResponsibilityNotDefinedRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:24'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSubclassResponsibilityNotDefinedRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSubclassResponsibilityNotDefinedRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SubclassResponsibilityNotDefinedRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSubclassResponsibilityNotDefinedRule>>basicCheck: aClass  [
	^ (aClass whichSelectorsReferTo: #subclassResponsibility) anySatisfy:  
		[ :each | 
		 aClass subclasses 
			anySatisfy:  [ :class | 
				class subclasses isEmpty and: [ (class whichClassIncludesSelector: each) == aClass ] ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSubclassResponsibilityNotDefinedRule>>checkClass: aClass  [
	(aClass whichSelectorsReferTo: #subclassResponsibility) do: 
		[ :each | 
		(aClass subclasses 
			anySatisfy:  
				[ :class | 
				class subclasses isEmpty and:
				[ (class whichClassIncludesSelector: each) == aClass ] ])  ifTrue: 
			[ result 
				addClass: aClass
				selector: each ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSubclassResponsibilityNotDefinedRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSubclassResponsibilityNotDefinedRule>>name [
	^ 'Subclass responsibility not defined'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSubclassResponsibilityNotDefinedRule>>rationale [
	^ 'Checks that all methods which send #subclassResponsibility, which indicates that they are abstract, are defined in all leaf classes.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSubclassResponsibilityNotDefinedRule>>severity [
	^ #error
]
