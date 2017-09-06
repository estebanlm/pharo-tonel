"
This smell arises when a breakpoint,  logging statement,  etc is found in a method. This debugging code should not be left in production code.  Here are messages currently checked: clearHaltOnce,  doOnlyOnce: ,  halt, halt:   onCount:  object2, haltOnCount: , haltOnce, hatIf: , inspectOnCount: , inspectOnce, inspectUntilCount: , rearmOneShot, setHaltOnce, flag: , isThisEverCalled, isThisEverCalled: , logEntry, logExecution, logExit, needsWork and Transcript  messages.
"
Class {
	#name : #RBCodeCruftLeftInMethodsRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 17:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'CodeCruftLeftInMethodsRule'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>addRuleRemoving: patternString [
	"When you are completely removing statement(s), you can not just match the relevant node. You must match the whole method and then replace it minus the part to be removed"

	| findString replaceString methodTemplate |
	methodTemplate := '| `@Temps |
``@.Statements1.
{1}.
``@.Statements2'.
	findString := methodTemplate format: { patternString }.
	replaceString := methodTemplate format: { '' }.
	self rewriteRule replace: findString with: replaceString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>debuggingPatterns [
	| result |
	result := self debuggingSelectors collect: [ :e | self patternFor: e ].
	^ result, { 'Transcript `@message: `@arg' }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>debuggingSelectors [
	
	^ (Object allSelectorsInProtocol: 'flagging'),
	(Object allSelectorsInProtocol: 'debugging')
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>group [
	^ 'Bugs'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>haltPatterns [
	| result |
	result := self haltSelectors collect: [ :e | self patternFor: e ].
	^ result, { 'Halt `@message: `@arg' }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>haltSelectors [
	| objectConvenience miscellaneous |
	objectConvenience := Object allSelectorsInProtocol: #halting.
	miscellaneous := #(inspectOnce).
	^ objectConvenience, miscellaneous
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>initialize [
	super initialize.
	self patterns do: [ :halt | self addRuleRemoving: halt ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>name [
	^ 'Debugging code left in methods'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>patternFor: selector [
	selector isUnary ifTrue: [ ^ '`@object ', selector ].
	selector isBinary ifTrue: [ ^ '`@object ', selector, ' `@arg' ].
	^ self patternForKeywordSelector: selector
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>patternForKeywordSelector: selector [
	|  index |
	^ String streamContents: [ :str |
		str nextPutAll: '`@object '.
		index := 1.
		selector keywords
			do: [ :keyword | 
				str
					nextPutAll: keyword;
					nextPutAll: ' `@arg';
					print: index ]
			separatedBy: [ 
				index := index + 1.
				str space ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>patterns [
	^ self debuggingPatterns, self haltPatterns
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>rationale [
	^ 'Breakpoints, logging statements, etc. should not be left in production code.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCodeCruftLeftInMethodsRule>>severity [
	^ #error
]
