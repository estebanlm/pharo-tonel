Extension {
	#name : #Color
}

{
	#category : #'*Athens-Cairo',
	#timestamp : ' 8/31/2017 05:26:26'
}
Color>>loadOnCairoCanvas: aCairoCanvas [
	aCairoCanvas
		setSourceR: self red g: self green b: self blue a: self alpha
]
