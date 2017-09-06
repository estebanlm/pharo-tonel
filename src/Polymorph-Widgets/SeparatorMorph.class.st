"
Simple themed separator morph.
"
Class {
	#name : #SeparatorMorph,
	#superclass : #PanelMorph,
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 6/4/2007 14:13'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SeparatorMorph>>adoptPaneColor: paneColor [
	"Change our fill too."
	
	super adoptPaneColor: paneColor.
	paneColor ifNil: [^self].
	self fillStyle: (self theme separatorFillStyleFor: self)
]
