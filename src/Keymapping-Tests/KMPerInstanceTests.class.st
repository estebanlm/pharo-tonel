"

"
Class {
	#name : #KMPerInstanceTests,
	#superclass : #AbstractKeymappingTest,
	#category : #Keymapping-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMPerInstanceTests>>testAddMoreThanOneHandler [
	| flag morph |
	flag := 0.
	morph := Morph new.
	morph on: $i do: [ flag := flag + 1 ].
	morph on: $j do: [ flag := flag + 6 ].
	{ self eventKey: $i. self eventKey: $j }
		do: [:e | morph dispatchKeystrokeForEvent: e].
	self assert: flag equals: 7.
]
