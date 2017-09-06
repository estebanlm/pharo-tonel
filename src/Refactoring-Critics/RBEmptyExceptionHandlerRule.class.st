"
Empty exception handler blocks hide potential bugs. The situation should be handled in a more robust way.

[  .... ]
	on: Error
	do: [  ]
	
having an empty block is a bad idea because the program silently fails.
"
Class {
	#name : #RBEmptyExceptionHandlerRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:28'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEmptyExceptionHandlerRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'EmptyExceptionHandlerRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEmptyExceptionHandlerRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEmptyExceptionHandlerRule>>initialize [
	super initialize.
	self matcher 
		matches: '`@block 
			on: `{ :node |
				| class |
				node isVariable 
					and: [ (class := Smalltalk classNamed: node name) notNil
					and: [ (class includesBehavior: Exception)
					and: [ (class includesBehavior: Notification) not ] ] ] }
			do: [ :`@err | | `@temps | ]'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEmptyExceptionHandlerRule>>name [
	^ 'Empty exception handler'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEmptyExceptionHandlerRule>>rationale [
	^ 'Empty exception handler blocks hide potential bugs. The situation should be handled in a more robust way.'
]
