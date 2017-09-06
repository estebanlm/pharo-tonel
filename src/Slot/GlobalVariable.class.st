"
I model Globals. I am stored as a binding in the Smalltalk globals.

The compiler forwards bytecode generation to me for accessing the variable.
"
Class {
	#name : #GlobalVariable,
	#superclass : #LiteralVariable,
	#category : #Slot-Variables,
	#timestamp : 'MarcusDenker 7/18/2014 10:02'
}

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:35'
}
GlobalVariable>>definingClass [
	"The class defining the variable. For Globals, return nil"
	^nil
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
GlobalVariable>>emitStore: methodBuilder [
	methodBuilder storeIntoLiteralVariable: self.


]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
GlobalVariable>>emitValue: methodBuilder [
	methodBuilder pushLiteralVariable: self.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
GlobalVariable>>isGlobalVariable [
	^true
]
