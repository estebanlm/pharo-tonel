"
Support for GeneralScrollPane.
"
Class {
	#name : #GeneralScrollBar,
	#superclass : #ScrollBar,
	#instVars : [
		'showState'
	],
	#category : #Morphic-Widgets-Scrolling,
	#timestamp : 'gvc 5/18/2007 13:01'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>initialize [
	"Initialize the receiver."

	super initialize.
	self showWhenNeeded
]

{
	#category : #'model access',
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>setValue: newValue [
	"Bypass screwed up scrollbar!"
	
	^self perform: #setValue: withArguments: {newValue} inSuperclass: Slider
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>showAlways [
	"Set the scrollbar to be always shown."

	self showState: #always
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>showNever [
	"Set the scrollbar to be never shown."

	self showState: #never
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>showState [

	^ showState
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>showState: anObject [

	showState := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>showWhenNeeded [
	"Set the scrollbar to be shown if needed."

	self showState: #whenNeeded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>showsAlways [
	"Answer whether the scrollbar should always be shown."

	^self showState == #always
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>showsNever [
	"Answer whether the scrollbar should never be shown."

	^self showState == #never
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
GeneralScrollBar>>showsWhenNeeded [
	"Answer whether the scrollbar should be shown if needed."

	^self showState == #whenNeeded
]
