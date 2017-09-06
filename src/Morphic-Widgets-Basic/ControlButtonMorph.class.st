"
Specially themed ""control"" button. Used for drop-lists, expanders etc.
"
Class {
	#name : #ControlButtonMorph,
	#superclass : #PluggableButtonMorph,
	#category : #Morphic-Widgets-Basic-Buttons,
	#timestamp : 'gvc 9/23/2008 12:04'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>disabledBorderStyle [
	"Return the disabled borderStyle of the receiver."
	
	^self theme controlButtonDisabledBorderStyleFor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>disabledFillStyle [
	"Return the disabled fillStyle of the receiver."
	
	^self theme controlButtonDisabledFillStyleFor: self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self layoutInset: (self theme controlButtonLabelInsetFor: self)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>minWidth [
	"Consult the theme also."

	^self perform: #minWidth withArguments: #() inSuperclass: Morph
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>mouseOverBorderStyle [
	"Return the mouse over borderStyle of the receiver."
	
	^self theme controlButtonMouseOverBorderStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>mouseOverFillStyle [
	"Return the mouse over fillStyle of the receiver."
	
	^self theme controlButtonMouseOverFillStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>normalBorderStyle [
	"Return the normal borderStyle of the receiver."
	
	^self theme controlButtonNormalBorderStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>normalFillStyle [
	"Return the normal fillStyle of the receiver."
	
	^self theme controlButtonNormalFillStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>pressedBorderStyle [
	"Return the pressed borderStyle of the receiver."
	
	^self theme controlButtonPressedBorderStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>pressedFillStyle [
	"Return the pressed fillStyle of the receiver."
	
	^self theme controlButtonPressedFillStyleFor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>selectedDisabledBorderStyle [
	"Return the selected disabled borderStyle of the receiver."
	
	^self theme controlButtonSelectedDisabledBorderStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>selectedDisabledFillStyle [
	"Return the selected disabled fillStyle of the receiver."
	
	^self theme controlButtonSelectedDisabledFillStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>selectedFillStyle [
	"Return the selected fillStyle of the receiver."
	
	^self theme controlButtonSelectedFillStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>selectedMouseOverBorderStyle [
	"Return the selected mouse over borderStyle of the receiver."
	
	^self theme controlButtonSelectedMouseOverBorderStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>selectedMouseOverFillStyle [
	"Return the selected mouse over fillStyle of the receiver."
	
	^self theme controlButtonSelectedMouseOverFillStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>selectedPressedBorderStyle [
	"Return the selected pressed borderStyle of the receiver."
	
	^self theme controlButtonSelectedPressedBorderStyleFor: self
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:14'
}
ControlButtonMorph>>selectedPressedFillStyle [
	"Return the selected pressed fillStyle of the receiver."
	
	^self theme controlButtonSelectedPressedFillStyleFor: self
]
