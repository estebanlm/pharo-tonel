"
I am an abstract class providing all the properties shared amongs all the morphic specific adapters
"
Class {
	#name : #AbstractMorphicAdapter,
	#superclass : #AbstractAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter class>>defaultSpec [

	^ SpecLayout composed
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>acceptDropBlock [

	^ self model acceptDropBlock
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>acceptDroppingMorph: draggedMorph event: event inMorph: source [

	^ self acceptDropBlock cull: draggedMorph model model cull: event cull: source model model
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>add: aWidget [
	
	self widgetDo: [ :w | w ensureLayoutAndAddMorph: aWidget asWidget ]
]

{
	#category : #dispatch,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>beginsWith: aString fromList: aMorph [
	"This method is used bu the list for the search of elements when you are typing directly in the list"
	
	^ false
]

{
	#category : #protocol-shortcuts,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>bindKeyCombination: aShortcut toAction: aBlock [

	self widget ifNotNil: [ :w | w bindKeyCombination: aShortcut toAction: aBlock ]
]

{
	#category : #protocol-shortcuts,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>bindMenuKeyCombination: aShortcut toAction: aBlock [

	self widget ifNotNil: [ :w | w bindKeyCombination: aShortcut toAction: aBlock ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>borderColor [

	^ self model borderColor
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>borderColor: color [

	self widget ifNotNil: [ :w | w borderColor: color ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>borderWidth [

	^ self model borderWidth
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>borderWidth: width [

	self widget ifNotNil: [ :w | w borderWidth: width ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>changed [

	^ self widgetDo: [ :w | w changed ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>color [

	^ self model color
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>color: color [

	self widgetDo: [ :w | w color: color ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>delete [
	
	self widgetDo: [ :w | w delete ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>disable [
	
	self model enabled: false
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>dragEnabled [

	^ self model dragEnabled
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>dragEnabled: aBoolean [

	self widget ifNotNil: [ :w | w dragEnabled: aBoolean ]
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>dragPassengerFor: item inMorph: dragSource  [
	
	^ self dragTransformationBlock cull: item cull: dragSource
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>dragPassengersFor: item inMorph: dragSource  [
	
	^ { self dragTransformationBlock cull: item cull: dragSource }
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>dragTransformationBlock [

	^ self model dragTransformationBlock
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>dropEnabled [

	^ self model dropEnabled
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>dropEnabled: aBoolean [

	self widget ifNotNil: [ :w | w dropEnabled: aBoolean ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>enable [

	self model enabled: true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>enabled [
	
	^ self model enabled
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>enabled: aBoolean [

	self widget ifNotNil: [ :w | w enabled: aBoolean ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>extent [

	^ self widget extent
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>hRigid [
	
	self widgetDo: [ :w | w hResizing: #rigid ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>hShrinkWrap [
	
	self widgetDo: [ :w | w hResizing: #shrinkWrap ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>hSpaceFill [
	
	self widgetDo: [ :w | w hResizing: #spaceFill ]
]

{
	#category : #dispatch,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>heightToDisplayInList: aList [
	"Return the width of my representation as a list item"
	
	self model extent ifNotNil: [:ex | ^ ex y ].
	self model initialExtent ifNotNil: [:ex | ^ ex y ].
	
	self widget ifNil: [ self buildWithSpec ].
	self widget 
		vResizing: #rigid;
		hResizing: #rigid.
		
	^ self widget heightToDisplayInList: aList
]

{
	#category : #dispatch,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>heightToDisplayInTree: aTree [
	"Return the width of my representation as a list item"
	
	self extent ifNotNil: [:ex | ^ ex y ].
	self initialExtent ifNotNil: [:ex | ^ ex y ].
	
	self widget ifNil: [ self buildWithSpec ].
	^ self widget heightToDisplayInTree: aTree
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>help [

	^ self model help
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>isMorphicAdapter [

	^ true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>layout: aLayout [
	| layout |
	
	layout := aLayout asMorphicLayout.

	self widgetDo: [ :w | w layoutFrame: layout ]
]

{
	#category : #dispatch,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>listRenderOn: aCanvas atRow: aRow bounds: drawBounds color: drawColor backgroundColor: backgroundColor from: aMorph [
	"Specify how this object as a list item should be drawn"

	self widget ifNil: [ self buildWithSpec ].
	self widget 
		vResizing: #rigid;
		hResizing: #rigid.
		
	self widget
		listRenderOn: aCanvas
		atRow: aRow
		bounds: drawBounds
		color: drawColor
		backgroundColor: backgroundColor
		from: aMorph
]

{
	#category : #protocol-shortcuts,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>removeKeyCombination: aShortcut [

	self widget ifNotNil: [ :w | w removeKeyCombination: aShortcut ]
]

{
	#category : #protocol-shortcuts,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>removeMenuKeyCombination: aShortcut [

	self widget ifNotNil: [ :w | w removeKeyCombination: aShortcut ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>removeSubWidgets [
	
	self widgetDo: [ :w | w removeAllMorphs ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>setBalloonText: aString [

	self widget ifNotNil: [ :w | w setBalloonText: aString ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>setModal: aWindow  [

	self widgetDo: [ :w | w setModal: aWindow ]
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>transferBlock [

	^ self model transferBlock
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>transferFor: passenger from: source [
	^ (self transferBlock cull: passenger cull: self model) buildWithSpec
]

{
	#category : #dispatch,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>treeRenderOn: aCanvas bounds: drawBounds color: drawColor font: aFont from: aMorph [
	"Specify how this object as a list item should be drawn"

	self widget ifNil: [ self buildWithSpec ].
	self widget treeRenderOn: aCanvas bounds: drawBounds color: drawColor font: aFont from: aMorph
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>useProportionalLayout [

	self widgetDo: [ :w | w changeProportionalLayout ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>vRigid [
	
	self widgetDo: [ :w | w vResizing: #rigid ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>vShrinkWrap [
	
	self widgetDo: [ :w | w vResizing: #shrinkWrap ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>vSpaceFill [
	
	self widgetDo: [ :w | w vResizing: #spaceFill ]
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>wantDropBlock [

	^ self model wantDropBlock
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>wantsDroppedMorph: draggedMorph event: anEvent inMorph: source [

	^ self wantDropBlock cull: draggedMorph cull: anEvent cull:source
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>when: anAnnouncement do: aBlock [

	self widgetDo: [ :w | w announcer
		when: anAnnouncement do: aBlock ]
]

{
	#category : #dispatch,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>widthToDisplayInList: aList [
	"Return the width of my representation as a list item"
	
	self model extent ifNotNil: [:ex | ^ ex x ].
	self model initialExtent ifNotNil: [:ex | ^ ex x ].

	self widget ifNil: [ self buildWithSpec ].
	self widget 
		vResizing: #rigid;
		hResizing: #rigid.
		
	^ self widget widthToDisplayInList: aList
]

{
	#category : #dispatch,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMorphicAdapter>>widthToDisplayInTree: aTree [
	"Return the width of my representation as a list item"
	
	self extent ifNotNil: [:ex | ^ ex x ].
	self initialExtent ifNotNil: [:ex | ^ ex x ].
	
	self widget ifNil: [ self buildWithSpec ].
	^ self widget widthToDisplayInTree: aTree
]
