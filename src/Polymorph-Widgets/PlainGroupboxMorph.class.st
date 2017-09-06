"
Groupbox without title with a vertical layout. Appears in a lighter colour than the owner's pane colour.
"
Class {
	#name : #PlainGroupboxMorph,
	#superclass : #PanelMorph,
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 12:36'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PlainGroupboxMorph>>adoptPaneColor: paneColor [
	"Change our color too."
	
	super adoptPaneColor: (self theme subgroupColorFrom: paneColor).
	self borderStyle: (self theme plainGroupPanelBorderStyleFor: self)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
PlainGroupboxMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		borderStyle: (self theme plainGroupPanelBorderStyleFor: self);
		changeTableLayout; 
		layoutInset: 4;
		cellInset: 8;
		vResizing: #spaceFill;
		hResizing: #spaceFill
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PlainGroupboxMorph>>paneColorOrNil [
	"Answer the window's pane color or nil otherwise."

	^super paneColorOrNil ifNotNil: [:c | self theme subgroupColorFrom: c]
]
