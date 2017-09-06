"
I am an OSWindow world morph that includes a model, to be used with Spec and Glamour.
"
Class {
	#name : #OSWindowWorldMorphWithModel,
	#superclass : #OSWindowWorldMorph,
	#instVars : [
		'model'
	],
	#category : #OSWindow-Core-Morphic,
	#timestamp : 'RonieSalgado 9/9/2016 18:06'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorphWithModel>>model  [
    ^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorphWithModel>>model: anObject [
    "Set my model and make me me a dependent of the given object."

    model ifNotNil: [model removeDependent: self].
    anObject ifNotNil: [anObject addDependent: self].
    model := anObject.
]
