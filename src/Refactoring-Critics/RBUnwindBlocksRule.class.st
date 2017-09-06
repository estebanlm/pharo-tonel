"
Move assignment out of unwind blocks.

For example

[[[
[ statements. 
var := object ] ifCurtailed: block
]]]


[[[ 
var := [ statements. 
	    object] ifCurtailed: block
]]]
"
Class {
	#name : #RBUnwindBlocksRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 18:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnwindBlocksRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UnwindBlocksRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnwindBlocksRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnwindBlocksRule>>initialize [
	super initialize.
	self rewriteRule
		replace: '[| `@temps | ``@.Statements. `var := ``@object] ensure: ``@block'
			with: '`var := [| `@temps | ``@.Statements. ``@object] ensure: ``@block';
		replace: '[| `@temps | ``@.Statements. ^``@object] ensure: ``@block'
			with: '^[| `@temps | ``@.Statements. ``@object] ensure: ``@block';
		replace:'[| `@temps | ``@.Statements. `var := ``@object] ifCurtailed: ``@block'
			with: '`var := [| `@temps | ``@.Statements. ``@object] ifCurtailed: ``@block';
		replace:'[| `@temps | ``@.Statements. ^``@object] ifCurtailed: ``@block'
			with: '^[| `@temps | ``@.Statements. ``@object] ifCurtailed: ``@block'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnwindBlocksRule>>name [
	^ 'Move assignment out of unwind blocks'
]
