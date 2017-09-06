"

"
Class {
	#name : #SlotMethodRecompilationTest,
	#superclass : #SlotSilentTest,
	#instVars : [
		'class'
	],
	#category : #Slot-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>method [
	^ class >> #m1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>methodBinding [
	^ self method classBinding
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>reshapeClass [
	^ class := self make: [ :builder | builder slots: #(#iv) ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>setUp [
	class := self make: [ :builder |
		builder traitComposition: TOne ].
	class compile: 'm1'.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>testClassReshapeShouldKeepClassBinding [
	"Check that when a class is reshaped, the recompilation of the methods gives correct class bindings (in the literal array of the methods)"

	self reshapeClass.
	self assert: self methodBinding == class binding
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>testClassReshapeShouldKeepClassBindingForTraitMethods [
	"A method should have the same binding than its class even if it come from a trait"
	self reshapeClass.
	self assert: (self traitMethodBinding == class binding).
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>testMethodClassBindingShouldBeClassBinding [
	"A method should have the same binding than its class"
	self assert: (self methodBinding == class binding).
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>testTraitMethodClassBindingShouldBeClassBinding [
	"A method should have the same binding than its class even if it come from a trait"
	self assert: (self traitMethodBinding == class binding).
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>traitMethod [
	^ class >> #one
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotMethodRecompilationTest>>traitMethodBinding [
	^ self traitMethod classBinding
]
