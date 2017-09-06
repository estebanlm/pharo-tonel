"
I am a morph showing a preview image of another morph.  I should be used like a singleton: my class provides an unique instance of me. That instance can be hiden, shown or updated.
"
Class {
	#name : #GLMPagerPanePreviewMorph,
	#superclass : #ImageMorph,
	#instVars : [
		'thumbnail',
		'position'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #Glamour-Morphic-Pager-Morphic,
	#timestamp : 'AndreiChis 5/27/2014 19:59'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph class>>cleanUp [
	super cleanUp.
	uniqueInstance := nil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph class>>remove [

	self uniqueInstance delete.	
	uniqueInstance := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph class>>uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := GLMPagerPanePreviewMorph new ].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph>>align: aPoint [
	
	position := aPoint.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph>>defaultBorderWidth [
	^ 5
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph>>defaultBottomMargin [
	^ 11
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph>>hideFromWorld [
	"Remove the morph from the world"
	self delete
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph>>initialize [
	super initialize.

	self color: Color transparent.
	
	self theme pagerWidgetThemer previewPaneStyleFor: self.
	self borderWidth: self defaultBorderWidth.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph>>maxExtent [
	^ 300@300.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph>>showAt: aPoint [

	self 
		openInWorld;
		align: aPoint.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerPanePreviewMorph>>updateFor: aMorph [

	thumbnail := aMorph taskThumbnailOfSize: self maxExtent.
	self image: thumbnail form.
	
	self position: position - ((thumbnail width / 2)@(thumbnail height + self defaultBottomMargin + self defaultBorderWidth)).
]
