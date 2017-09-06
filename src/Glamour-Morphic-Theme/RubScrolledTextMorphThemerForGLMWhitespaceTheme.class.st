"

"
Class {
	#name : #RubScrolledTextMorphThemerForGLMWhitespaceTheme,
	#superclass : #RubScrolledTextMorphThemer,
	#category : #Glamour-Morphic-Theme,
	#timestamp : ''
}

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:34'
}
RubScrolledTextMorphThemerForGLMWhitespaceTheme>>normalBorderStyleFor: aTextArea [
	^ BorderStyle 
		width: 1
		color: (GLMWhitespaceTheme lightBaseColor)
]
