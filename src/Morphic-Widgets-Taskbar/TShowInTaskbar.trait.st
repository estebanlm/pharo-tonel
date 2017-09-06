"
TShowInTaskbar is a trait to enable any morph to be shown in the taskbar. It implements the required parts so that the taskbar can build a button showing the given morph. 

A morph implementing this trait must implement the methods located under ""taskbar-required"".

Adding a menu when the taskbarbutton is right clicked can be done by implemenenting  #taskbarButtonMenu: to return a custom menu.

For mouseOver action, #taskbarCanShowThumbnail must be implemented to return true, and the behaviour when the mouse enters and leaves the taskbar button in their respective methods.
"
Trait {
	#name : #TShowInTaskbar,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Morphic-Widgets-Taskbar,
	#timestamp : 'HenrikNergaard 4/15/2016 11:51'
}

{
	#category : #taskbar-private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>customizeTaskbarButton: aButton [

	self taskbarCanShowThumbnail ifFalse: [ ^ self ].
	
	aButton 
	
		on: #mouseEnter 
		send: #taskbarButtonEntered:event:in: 
		to: self 
		withValue: aButton;
		
		on: #mouseLeave 
		send: #taskbarButtonLeft:event:in: 
		to: self  
		withValue: aButton.
]

{
	#category : #taskbar-public,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarButtonClicked [

	"Do something"
]

{
	#category : #taskbar-thumbnail,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarButtonEntered: aButton event: evt in: aMorph [
	"The mouse has entered out taskbar button.
	Show a thumbnail."
]

{
	#category : #taskbar-private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarButtonFor: aTaskbar [
	"Answer a new task bar button for the receiver.
	Answer nil if not required."
	
	| taskbarButton |
	
	taskbarButton := aTaskbar theme
		newBasicTaskbarButtonIn: aTaskbar
		for: self.
		
	self customizeTaskbarButton: taskbarButton.
	
	^ taskbarButton
]

{
	#category : #taskbar-required,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarButtonIsActive [

	"true/false"
	
	^self explicitRequirement
]

{
	#category : #taskbar-thumbnail,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarButtonLeft: aButton event: evt in: aMorph [
	"The mouse has left our taskbar button.
	Remove our thumbnail."
]

{
	#category : #taskbar-public,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarButtonMenu: aMenu [

	"default is to show no menu"
		
	^aMenu
]

{
	#category : #taskbar-thumbnail,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarCanShowThumbnail [

	^ false
]

{
	#category : #taskbar-required,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarLabel [
	"Answer the label to use for a taskbar button for the receiver."
	
	^self explicitRequirement
]

{
	#category : #taskbar-required,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarState [
	"Answer one of #minimized, #restored, #maximized or #active."
	
	^self explicitRequirement
]

{
	#category : #taskbar-private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TShowInTaskbar>>taskbarTask [

	^ TaskbarTask
		morph: self
		state: self taskbarState
		icon: self taskbarIcon
		label: self taskbarLabel
]
