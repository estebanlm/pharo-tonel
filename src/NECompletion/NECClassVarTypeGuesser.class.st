"
I'm a simple InstructionClient that tries to guess the type of a given class variable name of a class. 
"
Class {
	#name : #NECClassVarTypeGuesser,
	#superclass : #NECVarTypeGuesser,
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECClassVarTypeGuesser>>methodRefs [
	| theClass classVarAssoc |
	theClass := receiverClass classThatDefinesClassVariable: variableName.
	classVarAssoc := theClass classPool associationAt: variableName asSymbol.
	classVarAssoc value 
		ifNil: [ ^ SystemNavigation new allCallsOn: classVarAssoc ]
		ifNotNil: [ ^ classVarAssoc value class ]
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECClassVarTypeGuesser>>popIntoLiteralVariable: anAssociation  [
	anAssociation key == variableName asSymbol 
		ifTrue: [ found := true ]
		ifFalse: [ self reset ]
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECClassVarTypeGuesser>>popIntoReceiverVariable: offset  [
	self reset
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECClassVarTypeGuesser>>send: selector super: supered numArgs: numberArguments  [

]
