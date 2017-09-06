"
You are referencing a variable that is not declared anywhere. There is no temp, instance var, class var, or a global variable that can be bound to by this reference. Most likely you got into this state by writing an entirely correct code, but then the variable was removed.
"
Class {
	#name : #GRUndeclaredVariableRule,
	#superclass : #ReNodeBasedRule,
	#category : #GeneralRules,
	#timestamp : 'YuriyTymchuk 1/27/2017 11:19'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRUndeclaredVariableRule>>check: aNode forCritiquesDo: aCriticBlock [
	
	(aNode isVariable and: [
	 aNode isUndeclared ]) ifTrue: [ 
		aCriticBlock value: (
			self critiqueFor: aNode) ]
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRUndeclaredVariableRule>>critiqueFor: aNode [
	^ (super critiqueFor: aNode)
		tinyHint: aNode name;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRUndeclaredVariableRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRUndeclaredVariableRule>>name [
	^ 'References an undeclared variable'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRUndeclaredVariableRule>>severity [
	^ #error
]
