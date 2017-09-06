Extension {
	#name : #Integer
}

{
	#category : #'*Graphics-Primitives',
	#timestamp : ' 8/31/2017 05:26:09'
}
Integer>>asColorOfDepth: d [
	"Return a color value representing the receiver as color of the given depth"
	^Color colorFromPixelValue: self depth: d
]
