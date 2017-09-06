Extension {
	#name : #Color
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Color>>asRGBInteger [

	^(self red * 255) asInteger + ((self green * 255) asInteger << 8) + ((self blue * 255) asInteger << 16)
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Color class>>brickColorRegistry [

	^ ColorRegistry
]
