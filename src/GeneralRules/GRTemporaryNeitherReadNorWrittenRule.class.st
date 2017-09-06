"
There is something wrong in the method as you have variables that are either nor read or not written (or both).
"
Class {
	#name : #GRTemporaryNeitherReadNorWrittenRule,
	#superclass : #ReNodeBasedRule,
	#category : #GeneralRules,
	#timestamp : 'YuriyTymchuk 9/5/2016 13:52'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryNeitherReadNorWrittenRule>>check: aNode forCritiquesDo: aBlock [
	aNode isSequence ifTrue: [ 
		aNode temporaries do: [ :temp |
			self
				checkTemp: temp
				followedBy: aNode statements 
				forCritiquesDo: aBlock ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryNeitherReadNorWrittenRule>>checkTemp: aTemp followedBy: statements [
	| isRead isWritten |
	isRead := isWritten := false.
	statements do: [ :statement | 
		statement nodesDo: [ :node | 
			(node isVariable and: [
			 node name = aTemp name ]) ifTrue: [
					isRead    := isRead    or: [ node isUsed ].
					isWritten := isWritten or: [ node isWrite ] ] ] ].
		
	^ (isRead and: isWritten )
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryNeitherReadNorWrittenRule>>checkTemp: aTemp followedBy: statements forCritiquesDo: aBlock [
	(self checkTemp: aTemp followedBy: statements) ifFalse: [ 
		aBlock cull: (self critiqueFor: aTemp) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryNeitherReadNorWrittenRule>>group [
	^ 'Optimization'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRTemporaryNeitherReadNorWrittenRule>>name [
	^ 'Temporary variables not read or not written'
]
