Extension {
	#name : #Morph
}

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
Morph>>asSpecAdapter [

	^ MorphicGenericAdapter 
		morph: self
]

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
Morph>>heightToDisplayInTree: aTree [

	^ self minExtent y
]

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
Morph>>setModal: aSystemWindow [
	|area mySysWin keyboardFocus|

	keyboardFocus := self activeHand keyboardFocus.
	mySysWin := self isSystemWindow ifTrue: [self] ifFalse: [self ownerThatIsA: SystemWindow].
	mySysWin ifNil: [mySysWin := self].
	mySysWin modalLockTo: aSystemWindow.
	area := RealEstateAgent maximumUsableArea.
	aSystemWindow extent: aSystemWindow initialExtent.
	aSystemWindow position = (0@0)
		ifTrue: [aSystemWindow
				position: self activeHand position - (aSystemWindow extent // 2)].
	aSystemWindow
		bounds: (aSystemWindow bounds translatedToBeWithin: area).
	[ |aWidget | 
	aWidget := aSystemWindow.
	[aWidget world notNil] whileTrue: [
		aWidget outermostWorldMorph doOneCycle]]
		ensure: [mySysWin modalUnlockFrom: aSystemWindow.
				self activeHand newKeyboardFocus: keyboardFocus].
	^aSystemWindow
]

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
Morph>>treeRenderOn: aCanvas bounds: drawBounds color: drawColor font: aFont from: aMorph [

	self bounds: drawBounds.
	aMorph addMorphBack: self.
       
]

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
Morph>>widthToDisplayInTree: aTree [

	^ self minExtent x
]
