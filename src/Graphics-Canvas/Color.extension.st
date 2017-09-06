Extension {
	#name : #Color
}

{
	#category : #'*Graphics-Canvas',
	#timestamp : ' 8/31/2017 05:26:10'
}
Color>>fillRectangle: aRectangle on: aCanvas [
	"Fill the given rectangle on the given canvas with the receiver."
	
	aCanvas fillRectangle: aRectangle basicFillStyle: self
]
