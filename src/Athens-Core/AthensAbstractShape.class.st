"
In Athens, any object can play role of a shape.

I demonstrating the minimal protocol which should be supported
by ""shape"" role, to be used with Athens canvas.
See my methods comments for more details.

"
Class {
	#name : #AthensAbstractShape,
	#superclass : #Object,
	#category : #Athens-Core,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensAbstractShape>>asAthensShapeOn: canvas [
	"Note: The answered object of this message should conform with AthensShape protocol.	"
	self subclassResponsibility.
]
