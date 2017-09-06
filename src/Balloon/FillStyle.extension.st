Extension {
	#name : #FillStyle
}

{
	#category : #'*Balloon',
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>fillRectangle: aRectangle on: aCanvas [
	"Fill the given rectangle on the given canvas with the receiver."
	
	aCanvas fillRectangle: aRectangle basicFillStyle: self
]
