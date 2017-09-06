"
I am a slot in a class. 

Actual code generation is forwarded to the Slot class.

e.g. an InstanceVariableSlot will generate bytecode for reading and writing an ivar, while other Slots either just call the reflective operations of the Slot (#read: and #write:to) or do their own code generation.
"
Class {
	#name : #OCSlotVariable,
	#superclass : #OCAbstractVariable,
	#instVars : [
		'slot'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'MarcusDenker 7/2/2014 14:26'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable class>>semanticNodeClass [

	^RBInstanceVariableNode
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable>>emitStore: methodBuilder [

	slot emitStore: methodBuilder
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable>>emitValue: methodBuilder [

	slot emitValue: methodBuilder
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable>>isInstance [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable>>name [
	^ slot name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable>>name: aString [
	slot name: aString asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable>>slot [
	^ slot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable>>slot: aSlot [
	slot := aSlot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCSlotVariable>>variable [
	^slot
]
