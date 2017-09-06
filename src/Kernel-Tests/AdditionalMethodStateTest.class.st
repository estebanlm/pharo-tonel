"
SUnit tests for AdditionalMethodState
"
Class {
	#name : #AdditionalMethodStateTest,
	#superclass : #TestCase,
	#instVars : [
		'atState'
	],
	#category : #Kernel-Tests-Methods,
	#timestamp : 'TorstenBergmann 2/5/2014 08:30'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
AdditionalMethodStateTest>>setUp [

	| pragma |

	pragma := (Object compiledMethodAt: #at:) penultimateLiteral at: #primitive:.
	
	atState := AdditionalMethodState selector: #at: with: pragma copy.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
AdditionalMethodStateTest>>testAnalogousCodeTo [
	"create a fake traitSource association property"
	| state |
	state := AdditionalMethodState new: 1.
	state 
		basicAt: 1
		put: #traitSource -> (TBehavior methodNamed: #>>).
		
	self 
		shouldnt: [ state analogousCodeTo: state ]
		raise: MessageNotUnderstood
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
AdditionalMethodStateTest>>testCopy [

	| copy |
	copy := atState copy.

	self deny: atState == copy.
	self assert: atState method == copy method.
	self assert: atState selector == copy selector.

	self assert: atState pragmas = copy pragmas.
	self assert: atState properties = copy properties.

	1 to: atState pragmas size do: [:index | self deny: (atState pragmas at: index) == (copy pragmas at: index)].
]
