"
I am an abstract paint, which should be converted before it can be used by Athens.
I am backend agnostic, as opposed to concrete paint(s).
Also, any other object can play the role of paint, as long as it implements the conversion method, #asAthensPaintOn:

See other implementors of #asAthensPaintOn:, such as Color and Form.
"
Class {
	#name : #AthensAbstractPaint,
	#superclass : #Object,
	#category : #Athens-Core-Paints,
	#timestamp : 'FernandoOlivero 3/9/2012 14:03'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensAbstractPaint>>asAthensPaintOn: aCanvas	 [
	^ self
]
