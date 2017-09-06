Extension {
	#name : #ColorMappingCanvas
}

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
ColorMappingCanvas>>rubParagraph: paragraph bounds: bounds color: c [
	"Draw the given paragraph"
	myCanvas
		rubParagraph: paragraph
		bounds: bounds
		color: (self mapColor: c)
]
