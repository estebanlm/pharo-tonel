"
I'm a simple test ressource for test purposes
"
Class {
	#name : #SimpleTestResourceCircular,
	#superclass : #SimpleTestResource,
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResourceCircular class>>resources [
	^preventAvailability isNil
		ifTrue: [super resources , (Array with: SimpleTestResourceA1)]
		ifFalse:
			[super resources
				, (Array with: SimpleTestResourceA1 with: SimpleTestResourceCircular1)]
]
