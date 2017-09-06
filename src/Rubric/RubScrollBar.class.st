"
I am a scroll bar
"
Class {
	#name : #RubScrollBar,
	#superclass : #GeneralScrollBar,
	#category : #Rubric-Editing-Widgets,
	#timestamp : 'FranckWarlouzet 7/29/2015 15:51'
}

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrollBar>>mouseOverThumbButtonFillStyle [
	"Return the mouse over thumb fillStyle for the receiver."
	
	^(self theme scrollbarMouseOverThumbButtonFillStyleFor: self) asColor darker
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrollBar>>normalThumbFillStyle [
	"Return the normal thumb fillStyle for the receiver."
	
	^(self theme scrollbarNormalThumbFillStyleFor: self) asColor darker
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrollBar>>pressedThumbFillStyle [
	"Return the pressed thumb fillStyle for the receiver."
	
	^(self theme scrollbarPressedThumbFillStyleFor: self) asColor darker
]
