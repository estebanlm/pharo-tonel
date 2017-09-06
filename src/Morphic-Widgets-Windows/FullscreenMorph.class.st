"
Provides for another morph to occupy the full screen area (less docking bars).
"
Class {
	#name : #FullscreenMorph,
	#superclass : #Morph,
	#category : #Morphic-Widgets-Windows-Widgets,
	#timestamp : 'gvc 5/18/2007 13:04'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>contentMorph [
	"Answer the current content."
	
	^self submorphs first
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>defaultColor [
	"Return the receiver's default color."
	
	^Color white
]

{
	#category : #'change reporting',
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>displayExtentChanged [

	self updateBounds
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		changeProportionalLayout;
		bounds: World clearArea;
		beSticky
]

{
	#category : #'private - layout',
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>layoutChanged [
	"Don't pass to owner, since the receiver doesn't care! Improves frame rate."
	
	fullBounds := nil.
	self layoutPolicy ifNotNil:[:l | l flushLayoutCache].
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>openAsIs [
	"Open in the current world with the current position and extent."
	
	^self openAsIsIn: self currentWorld

]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>openAsIsIn: aWorld [
	"Start stepping."
	
	aWorld addMorph: self.
	(self submorphs notEmpty and: [self submorphs first isSystemWindow])
		ifTrue: [self submorphs first openedFullscreen].
	aWorld startSteppingSubmorphsOf: self.
	
	self announceOpened.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>openInWorld: aWorld [
	"Open as is."
	
	^self openAsIsIn: aWorld
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>setContentMorph: aMorph [
	"Replace the submorphs with aMorph."
	
	self removeAllMorphs.
	self
		addMorph: aMorph
		fullFrame: LayoutFrame identity
]

{
	#category : #'private - layout',
	#timestamp : ' 8/31/2017 05:26:15'
}
FullscreenMorph>>updateBounds [
	"Update the receiver's bounds to fill the world."

	self bounds: self owner clearArea
	
]
