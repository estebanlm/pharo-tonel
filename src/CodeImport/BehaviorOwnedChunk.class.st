"
I'm an abstract class grouping the behavior of the code declarations that will be instaled in a behavior, such as methods, class comments, organizations...
"
Class {
	#name : #BehaviorOwnedChunk,
	#superclass : #CodeChunk,
	#instVars : [
		'behaviorName',
		'isMeta'
	],
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
BehaviorOwnedChunk>>behaviorName [
	^ behaviorName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
BehaviorOwnedChunk>>behaviorName: aBehaviorName [
	behaviorName := aBehaviorName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
BehaviorOwnedChunk>>existsBehavior [
	^self class environment includesKey: behaviorName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
BehaviorOwnedChunk>>isMeta [
	^ isMeta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
BehaviorOwnedChunk>>isMeta: aBoolean [
	isMeta := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
BehaviorOwnedChunk>>targetClass [
	| target |
	target := self class environment at: behaviorName.
	^isMeta
		ifTrue: [ target classSide ]
		ifFalse: [ target ]
]
