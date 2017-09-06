"
A simple inspector view that displays a morph
"
Class {
	#name : #EyeMorphViewer,
	#superclass : #EyeAbstractInspector,
	#instVars : [
		'container'
	],
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #spec,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMorphViewer class>>inspectorSpec [
	<spec>
	
	^ SpecLayout composed
		newRow: #container bottom: 0.3;
		addHSplitter;
		newRow: #text top: 0.7;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMorphViewer class>>label [
	^ 'Morph Viewer'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMorphViewer>>container [
	^ container ifNil: [ container := (PanelMorph new 
		changeProportionalLayout)
		asSpecAdapter
		 vSpaceFill;
		hSpaceFill]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMorphViewer>>initializePresenter [

	self whenWindowChanged: [ self objectChanged ]
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMorphViewer>>objectChanged [

	self text doItReceiver: self object. 
	self container morph removeAllMorphs.
	self container morph
		addMorph: self thumbnailMorph
		fullFrame: LayoutFrame identity
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMorphViewer>>step [
	self objectChanged
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMorphViewer>>thumbnailMorph [
	^self object taskThumbnailOfSize: self thumbnailSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMorphViewer>>thumbnailSize [
	^ self container extent
]
