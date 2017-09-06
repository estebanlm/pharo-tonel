"
I am a binding in a Workspace. Used for non-defined temps
"
Class {
	#name : #WorkspaceVariable,
	#superclass : #LiteralVariable,
	#category : #Slot-Variables,
	#timestamp : 'MarcusDenker 8/5/2014 16:48'
}

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
WorkspaceVariable>>emitStore: methodBuilder [

	methodBuilder storeIntoLiteralVariable: self.


]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
WorkspaceVariable>>emitValue: methodBuilder [

	methodBuilder pushLiteralVariable: self.
]
