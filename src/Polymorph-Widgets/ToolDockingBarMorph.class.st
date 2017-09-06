"
A non user-moveable docking bar that uses theme-based fill styles.
"
Class {
	#name : #ToolDockingBarMorph,
	#superclass : #DockingBarMorph,
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 10:20'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ToolDockingBarMorph>>gradientRamp [
	"If not set answer based on orininal color."
	
	^self normalFillStyle colorRamp
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:15'
}
ToolDockingBarMorph>>normalFillStyle [
	"Return the normal fillStyle of the receiver."
	
	^self theme dockingBarNormalFillStyleFor: self
]

{
	#category : #'private - layout',
	#timestamp : ' 8/31/2017 05:26:15'
}
ToolDockingBarMorph>>updateColor [
	"private - update the receiver's color"
	
	self autoGradient
		ifFalse: [^ self].
	self fillStyle: self normalFillStyle
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:15'
}
ToolDockingBarMorph>>wantsYellowButtonMenu [
	"Answer true if the receiver wants a yellow button menu."
	
	^false
]
