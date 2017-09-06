"
We subclass panel morph to improve performance of pane color adaptation and reduce amount of layouts by checking if panel is in the world or not
"
Class {
	#name : #GLMPanelMorph,
	#superclass : #PanelMorph,
	#category : #Glamour-Morphic-Widgets,
	#timestamp : 'AliakseiSyrel 2/9/2017 14:41'
}

{
	#category : #'change reporting',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPanelMorph>>adoptPaneColor: paneColor [
	"Change our color too."

	self assureExtension.

	extension fillStyle
		ifNil: [ self color: paneColor ].
	self borderStyle baseColor: paneColor darker.
	
	self submorphsDo: [ :m | m adoptPaneColor: paneColor ]
]

{
	#category : #'change reporting',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPanelMorph>>changed [
	"Report that the area occupied by this morph should be redrawn.
	Fixed to include submorphs outside the outerBounds."

	self world
		ifNil: [ ^ self ].

 	^ fullBounds 
		ifNil: [ self invalidRect: self bounds ]
		ifNotNil: [ self invalidRect: fullBounds ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPanelMorph>>extent: aPoint [
	| newExtent |	
	newExtent := aPoint rounded.
	(bounds extent closeTo: newExtent)
		ifTrue: [ ^ self ].

	self invalidRect: bounds.
	bounds := bounds topLeft extent: newExtent.
	self layoutChanged.
	self invalidRect: bounds
]
