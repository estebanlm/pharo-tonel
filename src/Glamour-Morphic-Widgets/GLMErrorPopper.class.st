"
I am a popper that displays an error message.

GLMErrorPopper simpleErrorPopper
"
Class {
	#name : #GLMErrorPopper,
	#superclass : #GLMPopper,
	#category : #Glamour-Morphic-Widgets-Popper,
	#timestamp : 'AndreiChis 10/1/2014 13:03'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMErrorPopper class>>simpleErrorPopper [
	"
	self simpleErrorPopper
	"

	(GLMErrorPopper new 
		withString: 'error message goes here' 
		from: RubScrolledTextMorph new) openInWorld
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMErrorPopper>>initialize [
	super initialize.
	self initializeTextMorph
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMErrorPopper>>initializeTextMorph [
	textMorph := RubScrolledTextMorph new.
	textMorph
		beReadOnly;
		beWrapped;
		textFont: self theme textFont;
		textColor: self theme textColor;
		backgroundColor: self theme errorPopperBackgroundColor.
	self
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		addMorph: textMorph fullFrame: (LayoutFrame identity)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMErrorPopper>>withString: string from: aMorph [

	aMorph textArea removeHighlightSegment.
	super withString: string from: aMorph
]
