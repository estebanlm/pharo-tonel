"
True defines the behavior of its single instance, true -- logical assertion. Notice how the truth-value checks become direct message sends, without the need for explicit testing.

Be aware however that most of these methods are not sent as real messages in normal use. Most are inline coded by the compiler as test and jump bytecodes - avoiding the overhead of the full message sends. So simply redefining these methods here will have no effect.
"
Class {
	#name : #True,
	#superclass : #Boolean,
	#category : #Kernel-Objects,
	#timestamp : '<historical>'
}

{
	#category : #'logical operations',
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>& aBoolean [
	"Evaluating conjunction -- answer aBoolean since receiver is true."

	^aBoolean
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>and: alternativeBlock [
	"Nonevaluating conjunction -- answer the value of alternativeBlock since
	the receiver is true."

	^alternativeBlock value
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>asBit [

	^ 1
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>ifFalse: alternativeBlock [
	"Since the condition is true, the value is the true alternative, which is nil. 
	Execution does not actually reach here because the expression is compiled 
	in-line."

	^nil
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>ifFalse: falseAlternativeBlock ifTrue: trueAlternativeBlock [
	"Answer the value of trueAlternativeBlock. Execution does not 
	actually reach here because the expression is compiled in-line."

	^trueAlternativeBlock value
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>ifTrue: alternativeBlock [
	"Answer the value of alternativeBlock. Execution does not actually 
	reach here because the expression is compiled in-line."

	^alternativeBlock value
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>ifTrue: trueAlternativeBlock ifFalse: falseAlternativeBlock [
	"Answer with the value of trueAlternativeBlock. Execution does not 
	actually reach here because the expression is compiled in-line."

	^trueAlternativeBlock value
]

{
	#category : #'logical operations',
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>not [
	"Negation--answer false since the receiver is true."

	^false
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>or: alternativeBlock [
	"Nonevaluating disjunction -- answer true since the receiver is true."

	^self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>printOn: aStream [

	aStream nextPutAll: 'true'
]

{
	#category : #'logical operations',
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>xor: aBoolean [
	^aBoolean value not
]

{
	#category : #'logical operations',
	#timestamp : ' 8/31/2017 07:16:33'
}
True>>| aBoolean [
	"Evaluating disjunction (OR) -- answer true since the receiver is true."

	^self
]
