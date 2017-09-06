"
This smell arises when instance variables are defined in all subclasses. Many times you might want to pull the instance variable up into the class so that all the subclasses do not have to define it. In addition have a look at the initialize method in each of the subclasses because if the instance variable is really the same, it will be initialized similarly in different places.


"
Class {
	#name : #RBInstVarInSubclassesRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:59'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'InstVarInSubclassesRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule>>basicCheck: aClass  [
	| subs |
	subs := aClass subclasses.
	subs size > 1 ifTrue: 
		[ | sels |
		sels := Bag new.
		subs do: [ :each | sels addAll: each instVarNames ].
		^ sels asSet anySatisfy:  
			[ :val | 
			| count |
			count := sels occurrencesOf: val.
			count == subs size ] ].
	
	^ false
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule>>checkClass: aClass  [
	| subs |
	subs := aClass subclasses.
	subs size > 1 ifTrue: 
		[ | sels |
		sels := Bag new.
		subs do: [ :each | sels addAll: each instVarNames ].
		sels asSet do: 
			[ :val | 
			| count |
			count := sels occurrencesOf: val.
			count == subs size ifTrue: 
				[ result 
					addClass: aClass
					instanceVariable: val ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule>>name [
	^ 'Same instance variable defined in ALL subclasses'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule>>rationale [
	^ 'All subclasses of this class define the same variable. Most likely this variable should be pulled up to the superclass.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule>>resultClass [
	^ RBVariableEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstVarInSubclassesRule>>severity [
	^ #information
]
