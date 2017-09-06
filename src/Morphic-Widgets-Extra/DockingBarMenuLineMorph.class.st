"
A DockingBarMenuLineMorph is specialized version of its superclass for DockingBar behavior.

"
Class {
	#name : #DockingBarMenuLineMorph,
	#superclass : #MenuLineMorph,
	#category : #Morphic-Widgets-Extra,
	#timestamp : 'StephaneDucasse 9/28/2014 15:16'
}

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:14'
}
DockingBarMenuLineMorph>>minHeight [
	"Answer the receiver's minHeight"
	
	^owner isVertical
				ifTrue: [ self theme menuBorderWidth ]
				ifFalse: [10]
	
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:14'
}
DockingBarMenuLineMorph>>minWidth [
	"Answer the receiver's minWidth"

	^ owner isVertical
		ifTrue: [ 10 ]
		ifFalse: [ self theme menuBorderWidth ]
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
DockingBarMenuLineMorph>>noteNewOwner: aMorph  [
	"I have just been added as a submorph of aMorph"
	super noteNewOwner: aMorph.
	self updateLayoutInDockingBar
]

{
	#category : #'change reporting',
	#timestamp : ' 8/31/2017 05:26:14'
}
DockingBarMenuLineMorph>>ownerChanged [
	"The receiver's owner, some kind of a pasteup, has changed its layout."
	super ownerChanged.
	self updateLayoutInDockingBar
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
DockingBarMenuLineMorph>>updateLayoutInDockingBar [

	owner isVertical
		ifFalse: [
			self hResizing: #shrinkWrap.
			self vResizing: #spaceFill]
		ifTrue: [
			self hResizing: #spaceFill.
			self vResizing: #shrinkWrap].
	self extent: self minWidth @ self minHeight
]
