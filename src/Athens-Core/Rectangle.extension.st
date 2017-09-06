Extension {
	#name : #Rectangle
}

{
	#category : #'*Athens-Core',
	#timestamp : ' 8/31/2017 05:26:26'
}
Rectangle>>asAthensShapeOn: anAthensCanvas  [
	"Just answer self. Receiver don't needs any conversion to be used with Athens"
	
	^ self
]

{
	#category : #'*Athens-Core',
	#timestamp : ' 8/31/2017 05:26:26'
}
Rectangle>>asPolygonTransformedBy: aTransform [
	"answer a clock-wise oriented polygon, representing receiver,
	transformed by transform"
	
	^ {
		aTransform transform: origin.
		aTransform transformX: corner x Y: origin y.
		aTransform transform: corner.
		aTransform transformX: origin x Y: corner y.
	}
]

{
	#category : #'*Athens-Core',
	#timestamp : ' 8/31/2017 05:26:26'
}
Rectangle>>paintFillsUsing: aPaint on: anAthensCanvas  [
	"This method is a part of rendering dispatch  Canvas->receiver->paint"
	
	^ aPaint athensFillRectangle: self on: anAthensCanvas
]
