"
I am a Spec specific subclass of TransferMorph used to initialize the trasnfer morph state correctly with the Spec constraints
"
Class {
	#name : #SpecTransferMorph,
	#superclass : #TransferMorph,
	#instVars : [
		'model'
	],
	#category : #Spec-MorphicAdapters-Support,
	#timestamp : 'BenjaminVanRyseghem 4/24/2014 16:44'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTransferMorph>>initialize [

	super initialize.

	dragHand := ActiveHand
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTransferMorph>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTransferMorph>>model: anObject [
	model := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTransferMorph>>passenger: aBlock [
	passenger := aBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTransferMorph>>shouldCopy [

	^ self dragHand shiftPressed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTransferMorph>>source: aBlock [
	source := aBlock value
]
