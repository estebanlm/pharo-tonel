"
I represent a cell for the table. 

Description
------------------

I contains other Morph that need to be render. I should be answered in FTDataSource>>#cellTable:column:row:, with this method a FTTableContainer can display all the needed cells.

Technically, FTDataSource can answer  any kind of morph, but I'm better prepared  for the role so is recommendable  to  use me.

Public API and Key Messages
-------------------

- #withTopSeparator 		this is use to put a separator before the cell. (For exmple on a FTOutlineDataSource).

Example
-------------------

FTCellMorph new
		addMorphBack: 'Example' asMorph;
		withTopSeparator;
		openInWindow.
 
Internal Representation and Key Implementation Points.
-----------------

    Instance Variables
	topSeparator:		This is a boolean to know if the cell need a topSeparator.

"
Class {
	#name : #FTCellMorph,
	#superclass : #Morph,
	#instVars : [
		'topSeparator'
	],
	#category : #Morphic-Widgets-FastTable,
	#timestamp : 'CyrilFerlicot 11/17/2015 14:08'
}

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTCellMorph>>defaultColor [
	^ Color transparent
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTCellMorph>>drawOn: aCanvas [
	super drawOn: aCanvas.
	topSeparator
		ifTrue: [ aCanvas line: bounds topLeft to: bounds topRight color: self seperatorColor ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTCellMorph>>initialize [
	super initialize.
	topSeparator := false.
	self
		clipSubmorphs: true;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #topLeft;
		wrapCentering: #center
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTCellMorph>>seperatorColor [
	^ Smalltalk ui theme scrollbarColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTCellMorph>>withTopSeparator [
	topSeparator := true
]
