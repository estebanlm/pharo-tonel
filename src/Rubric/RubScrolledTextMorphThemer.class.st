"

"
Class {
	#name : #RubScrolledTextMorphThemer,
	#superclass : #Object,
	#category : #Rubric-Editing-Widgets,
	#timestamp : ''
}

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorphThemer>>disabledBorderStyleFor: aTextArea [
	^ self normalBorderStyleFor: aTextArea 
]

{
	#category : #colors,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorphThemer>>highlightBackgroundColorFor: aTextArea [

	^ Color veryLightGray alpha:0.01
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorphThemer>>highlightBorderStyleFor: aTextArea [
	^ BorderStyle inset 
		baseColor: Smalltalk ui theme selectionColor;
		width: 2
]

{
	#category : #border-styles,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextMorphThemer>>normalBorderStyleFor: aTextArea [
	^ BorderStyle 
		width: 0
		color: Color transparent
]
