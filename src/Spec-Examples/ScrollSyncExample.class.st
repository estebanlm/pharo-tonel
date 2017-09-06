"
I am an example that exposes to the world how to use a ScrollPane announcement to have a nice morph being in sync with the current vertical scrollbar position.

self example
"
Class {
	#name : #ScrollSyncExample,
	#superclass : #ComposableModel,
	#instVars : [
		'text',
		'sideRuler',
		'currentVerticalScrollPosition'
	],
	#category : #Spec-Examples-Morphic,
	#timestamp : 'Spirita 7/28/2016 15:11'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample class>>defaultSpec [
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #sideRuler width: 50;
				add: #text ];
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample class>>example [
	^ self new openWithSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample class>>title [

	^ self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample>>currentVerticalScrollPosition [
	^ currentVerticalScrollPosition
]

{
	#category : #layouts,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample>>defaultSpecLayout [
	<spec>
	^ SpecLayout composed
		add: #sideRuler
			origin: 0 @ (1 - self currentVerticalScrollPosition)
			corner: 0 @ (1 - self currentVerticalScrollPosition)
			offsetOrigin: 0 @ -250
			offsetCorner: 50 @ 250;
		add: #text
			origin: 0 @ 0
			corner: 1 @ 1
			offsetOrigin: 50 @ 0
			offsetCorner: 0 @ 0;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample>>initialize [
	super initialize.
	sideRuler := (Morph new
		color: Color yellow;
		extent: 50 @ 500;
		useGradientFill;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself) asSpecAdapter.
	currentVerticalScrollPosition := 0
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample>>initializeWidgets [

	text := self newText.
		
	text whenBuiltDo: [ :builtAnnouncement | 
		text whenScrollValueChanged: [ :newPosition | self syncMorphPosition ] ].
	
	text text: self loremIpsum.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample>>loremIpsum [
	^ String loremIpsum: 2854
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample>>sideRuler [
	^ sideRuler
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample>>syncMorphPosition [
	currentVerticalScrollPosition = text scrollValue y
		ifTrue: [ ^ self ].
	currentVerticalScrollPosition := text scrollValue y.
	self needRebuild: false.
	text needRebuild: false.
	self buildWithSpecLayout: self defaultSpecLayout

	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
ScrollSyncExample>>text [
	^ text
]
