"
I am a model representing Pharo World.

This way, every spec application can be opened as the Pharo system window as window, to simulate native a application.
"
Class {
	#name : #WorldModel,
	#superclass : #WindowModel,
	#instVars : [
		'widget'
	],
	#category : #Spec-MorphicAdapters,
	#timestamp : 'NicolaiHess 5/25/2016 21:39'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel class>>defaultSpec [
	<spec>
	
	self setUpWorld.
	^ World asSpecAdapter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel class>>setUpWorld [

	World changeProportionalLayout.
	World submorphs do: [:e | e delete ].
 
 	(Smalltalk at: #PolymorphSystemSettings) 
		perform: #desktopColor: 
		with: Smalltalk ui theme backgroundColor.
 	"((Smalltalk at: #UITheme) perform: #currentSettings) perform: #windowColor: with: (Color r: 0.745 g: 0.745 b: 0.745)."
	(Smalltalk at: #TaskbarMorph) perform: #showTaskbar: with: false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>addModelIn: container withSpec: aSpec [
	
	self model ifNil: [ ^ self ].
	widget := self model buildWithSpec: aSpec.
	
	container
		addMorph: widget
		fullFrame: LayoutFrame identity
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>addModelIn: container withSpecLayout: aSpec [

	self model ifNil: [ ^ self ].
	widget := self model buildWithSpecLayout: aSpec.
	
	container
		addMorph: widget
		fullFrame: LayoutFrame identity
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>buildWidget [

	^ World asSpecAdapter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>defaultInitialExtent [
	
	^ World extent
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>ensureExtentFor: aWidget [

	self extent ifNotNil: [ :ext | DisplayScreen hostWindowSize: ext ].
	self initialExtent ifNotNil: [ :ext | DisplayScreen hostWindowSize: ext ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>isDisplayed [

	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>openWithSpec: aSpec [

	self buildWithSpec: aSpec.
	self updateTitle
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>openWithSpecLayout: aSpec [

	self buildWithSpecLayout: aSpec.
	self updateTitle
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>title: aString [

	^ DisplayScreen hostWindowTitle: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>updateTitle [
	"Update the window title"

	DisplayScreen hostWindowTitle: self title
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
WorldModel>>widget [

	^ widget 
]
