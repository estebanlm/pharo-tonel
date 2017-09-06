"
I add some special behavior: 
	-  I override bytecode generation to generate ivar read and write bytecodes
	- I print the definition as #name 
"
Class {
	#name : #InstanceVariableSlot,
	#superclass : #IndexedSlot,
	#category : #Slot-Variables,
	#timestamp : 'MarcusDenker 1/22/2015 17:43'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceVariableSlot class>>resetIvarSlots [
	"when the Ivar slots need to be re-created (e.g. due to changes in the layout of the class),
	 this method re-creates for every ivar a ivar slot"
	"to be removed later when the system is in a stable state"

	| block |
	block := [ :class | 
	class instVarNames
		withIndexDo: [ :ivarName :index | 
			class classLayout slotScope
				at: index
				put:
					((InstanceVariableSlot named: ivarName asSymbol)
						index: index + class superclass allInstVarNames size;
						yourself) ] ].
	Smalltalk allClasses
		do: [ :class | 
			block value: class.
			block value: class classSide ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceVariableSlot>>definitionString [
	"non special globals are defined by the symbol"
	^self isSpecial
		ifTrue: [super definitionString]
		ifFalse: [self name printString]

]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceVariableSlot>>emitStore: methodBuilder [

	methodBuilder storeInstVar: index
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceVariableSlot>>emitValue: methodBuilder [

	methodBuilder pushInstVar: index.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceVariableSlot>>isReadIn: aCompiledCode [
	^aCompiledCode readsField: index
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceVariableSlot>>isSpecial [
	"I am just a backward compatible ivar slot. Note: my subclasses are special"
	^(self class = InstanceVariableSlot) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceVariableSlot>>isWrittenIn: aCompiledCode [
	^aCompiledCode writesField: index
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceVariableSlot>>usingMethods [
	"All methods that read or write the slot, we can do it here without having to use the AST"
	^self definingClass 
		ifNil: [ #() ]
		ifNotNil: [ :definingClass | definingClass withAllSubclasses flatCollect: [:class |  
		(class whichSelectorsAccess: self name) collect: [:sel | 
			class compiledMethodAt: sel ]]]
]
