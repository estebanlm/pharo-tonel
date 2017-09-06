"
This smell arises when a method protocol is not equivalent to the one defined in the superclass of such method class. All methods should be put into a protocol (method category) that is equivalent to the one of the superclass, which is a standard style in Pharo. Furthermore, methods which are extended in the superclass are ignored, since they may have different protocol name. Pay attention when you apply automatic recategorisation because it may move method in antoher package if the method is defined in the superclass as an extension.


"
Class {
	#name : #RBInconsistentMethodClassificationRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:00'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInconsistentMethodClassificationRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInconsistentMethodClassificationRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'InconsistentMethodClassificationRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInconsistentMethodClassificationRule>>basicCheck: aMethod  [
	| ownerProtocol |
	ownerProtocol := aMethod protocol.
	ownerProtocol ifNil: [ ^ false ].
	(ownerProtocol == #'as yet unclassified' or: [ 
	 ownerProtocol first = $*	 ]) ifTrue: [ ^ false ].
	
	aMethod methodClass superclass ifNotNil: [ :superclass |
			(superclass lookupSelector: aMethod selector) ifNotNil: [ :superMethod |
				| superProtocol |
				superProtocol := superMethod protocol.
				(superProtocol isNil or: [ 
			 	 superProtocol == #'as yet unclassified' or: [ 
			 	 superProtocol first = $*	 ] ]) ifFalse: [ 
					^ ownerProtocol ~= superProtocol ] ] ].
	
	^ false
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInconsistentMethodClassificationRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: [ 
		result addMethod: aMethod  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInconsistentMethodClassificationRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInconsistentMethodClassificationRule>>name [
	^ 'Inconsistent method classification'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInconsistentMethodClassificationRule>>rationale [
	^ 'All methods should be put into a protocol (method category) that is equivalent to the one of the superclass, which is a Smalltalk style convention.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInconsistentMethodClassificationRule>>severity [
	^ #information
]
