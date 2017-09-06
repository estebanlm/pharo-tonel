"
This class represents an interface, which should be supported by all shapes used for drawing with Athens framework.

Shapes do not have to inherit directly from me, for example Rectangle implements my protocol (via extensions), and as result can be used as a valid shape for drawing with Athens.
"
Class {
	#name : #AthensShape,
	#superclass : #AthensAbstractShape,
	#category : #Athens-Core,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensShape>>asAthensShapeOn: canvas [
	"Receiver is a shape, no conversion is needed."
	^ self
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensShape>>paintFillsUsing: aPaint on: anAthensCanvas  [
	"This method is a part of rendering dispatch  Canvas->receiver->paint"
	
	self subclassResponsibility
]
