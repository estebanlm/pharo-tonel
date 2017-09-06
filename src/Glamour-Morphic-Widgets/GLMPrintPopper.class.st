"
I am a popper that displays a notification message: I can display a given object or evaluate the selection of the attached text editor. 

I also offer a button for inspecting the object that is displayed.

GLMPrintPopper simpleObjectPopper
	
GLMPrintPopper selectionEvaluationPopper
"
Class {
	#name : #GLMPrintPopper,
	#superclass : #GLMPopper,
	#instVars : [
		'inspectButton'
	],
	#category : #Glamour-Morphic-Widgets-Popper,
	#timestamp : 'AndreiChis 10/1/2014 13:24'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrintPopper class>>selectionEvaluationPopper [
	"
	self selectionEvaluationPopper
	"
	GLMPrintPopper new 
		evaluateAndOpenFromRubric: (RubScrolledTextMorph new 
			beForSmalltalkCode;
			updateTextWith: '1+2+4';
			setSelection: (1to:6))
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrintPopper class>>simpleObjectPopper [
	"
	self simpleObjectPopper
	"

	GLMPrintPopper new 
		openFromRubric: RubScrolledTextMorph new 
		withResult: 'notification goes here'.
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrintPopper>>evaluateAndOpenFromRubric: aMorph [

	self 
		openFromRubric: aMorph
		withResult: aMorph textArea editor evaluateSelection
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrintPopper>>initialize [
	super initialize.
	self initializeInspectButton.
	self initializeTextMorph
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrintPopper>>initializeInspectButton [

	inspectButton := MultistateButtonMorph new
		extent: GLMUIThemeExtraIcons glamorousInspect extent;
		activeEnabledOverUpFillStyle: (ImageFillStyle form: GLMUIThemeExtraIcons glamorousInspect);
		setBalloonText: 'Inspect' translated.
	self
		addMorph: inspectButton
		fullFrame: (LayoutFrame fractions: (1 @ 0 corner: 1 @ 0) offsets: (inspectButton width  @ 0 corner: 0 @ (2*inspectButton width) ))
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrintPopper>>initializeTextMorph [
	textMorph := RubScrolledTextMorph new.
	textMorph
		beReadOnly;
		beWrapped;
		textFont: self theme textFont;
		textColor: self theme textColor;
		backgroundColor: BalloonMorph balloonColor.
	self
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		addMorph: textMorph fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1) offsets: (0 @ 0 corner: 0 @ 0))
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrintPopper>>openFromRubric: aMorph withResult: anObject [
	| string |
	string := anObject printString.
	self withString: string from: aMorph.
	self width: self width + inspectButton width.
	textMorph textArea
		on: $i meta
		do: [ anObject inspect ].
	textMorph textArea
		on: Character cr asKeyCombination
		do: [ 
			self delete.
			aMorph textArea removeHighlightSegment.
			aMorph editor atEndOfLineInsertAndSelect: string asComment.
			aMorph takeKeyboardFocus ].
	textMorph textArea
		on: $p meta
		do: [ 
			self delete.
			aMorph textArea removeHighlightSegment.
			aMorph editor atEndOfLineInsertAndSelect: string.
			aMorph takeKeyboardFocus ].
	inspectButton addUpAction: [ anObject inspect ].
	self openInWorld
]
