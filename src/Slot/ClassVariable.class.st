"
I model Class Variables and therefore Pool Variables, too. I am stored as a binding in the classPool of the class defining me.

The compiler forwards bytecode generation to me for accessing the variable.

You can subclass me and implement #read and #write: for creating special kinds of globals that can be used as special class Variables (similar to special Slots).

"
Class {
	#name : #ClassVariable,
	#superclass : #LiteralVariable,
	#category : #Slot-Variables,
	#timestamp : 'MarcusDenker 7/18/2014 10:02'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassVariable>>definitionString [
	"non special globals are defined by the symbol"
	^self isSpecial
		ifTrue: [super definitionString]
		ifFalse: [self name printString]

]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassVariable>>emitStore: methodBuilder [

	methodBuilder storeIntoLiteralVariable: self.


]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassVariable>>emitValue: methodBuilder [

	methodBuilder pushLiteralVariable: self.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassVariable>>isClassVariable [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassVariable>>isSpecial [
	"I just a class var Note: my subclasses are special"
	^(self class = ClassVariable) not
]
