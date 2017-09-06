"
I declare api and logic to layout Bricks
"
Trait {
	#name : #GLMBrickLayoutTrait,
	#traits : 'GLMBrickExtensionTrait',
	#classTraits : 'GLMBrickExtensionTrait classTrait',
	#category : #Glamour-Morphic-Brick-Traits,
	#timestamp : 'AliakseiSyrel 1/30/2015 10:48'
}

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>doLayout [

	self isLayotingAllowed ifTrue: [
		GLMBrickLayouter uniqueInstance layoutIn: self brickApi ]
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>doLayoutForce [

	self wrappedBounds
		markHeightDirty;
		markWidthDirty.
	
	self doLayout
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>doNotLayoutDuring: aBlock [
	|wasAllowed|
	wasAllowed := self isLayotingAllowed.
	self isLayotingAllowed: false.
	[ aBlock cull: self ]
		ensure: [ wasAllowed ifTrue: [ self isLayotingAllowed: true ] ]
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>floating [

	^ self layout floating
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>floating: aSymbol [

	self layout floating: aSymbol
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>hAlign [

	^ self layout hAlign
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>hAlign: aSymbol [
	<brickBuilderProperty: #Layout name: 'Horizontal align' as: #asSymbol getter: #hAlign model: #GLMUIBuilderTextFieldProperty>

	self layout hAlign: aSymbol
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>hShrinkWrap [

	self layout hShrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>hSpaceFill [

	self hSpaceFill: 100
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>hSpaceFill: anInteger [
	<brickBuilderProperty: #Layout name: 'Horizontal percent' as: #asInteger getter: #hPercent model: #GLMUIBuilderTextFieldProperty>

	self layout hSpaceFill: anInteger
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>hasProperty: aSymbol [

	^ self explicitRequirement
]

{
	#category : #brick-geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>innerBounds [

	^ self explicitRequirement
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>invalidateLayout [

	self layoutPolicy layout: self brickApi in: self wrappedBounds innerBounds
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>invalidateWith: aBlock [

	aBlock cull: self.
	self doLayoutForce.
]

{
	#category : #private-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>isLayotingAllowed [

	^ self valueOfProperty: #brickLayoutingAllowed ifAbsent: [ true ]
]

{
	#category : #private-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>isLayotingAllowed: aBoolean [

	self setProperty: #brickLayoutingAllowed toValue: aBoolean
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>layout [
	"Alias for layoutProperies"
	^ self layoutProperties
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>layout: aLayout [
	"Alias for layoutPolicy:"
	<brickBuilderProperty: #Layout name: 'Orientation' as: #brickBuilderLayout getter: #layoutPolicy model: #GLMUIBuilderTextFieldProperty>

	self layoutPolicy: aLayout
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>layoutAfter: aBlock [

	self doNotLayoutDuring: aBlock.
	self doLayout
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>layoutPolicy [

	^ self explicitRequirement
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>layoutPolicy: aLayout [

	self explicitRequirement
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>layoutProperties [

	^ self explicitRequirement
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>layoutProperties: aLayoutProperties [

	self explicitRequirement
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>layoutSubbricks [

	self layoutPolicy layout: self brickApi in: self innerBounds
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>onChildrenLayouted [
	"called when all my children finished layouting"
	self updateFoundationBounds
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>onLayoutEvent: aLayoutEvent [
	"in case layout want's to trigger any specific event"
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>onLayouted [
	"called when I'm layouted in my parent"
	self updateFoundationBounds
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>removeProperty: aSymbol [
	
	^ self explicitRequirement
]

{
	#category : #private-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>resetLayout [

	self vResizing: #rigid.
	self hResizing: #rigid.
	self height: nil.
	self width: nil
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>setProperty: aSymbol toValue: anObject [
	
	^ self explicitRequirement
]

{
	#category : #brick-structure,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>subbricks [

	^ self explicitRequirement
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>useHorizontalLinearLayout [

	self layout: GLMHorizontalLinearLayout uniqueInstance
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>useVerticalLinearLayout [

	self layout: GLMVerticalLinearLayout uniqueInstance
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>vAlign [

	^ self layout vAlign
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>vAlign: aSymbol [
	<brickBuilderProperty: #Layout name: 'Vertical align' as: #asSymbol getter: #vAlign model: #GLMUIBuilderTextFieldProperty>

	self layout vAlign: aSymbol
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>vShrinkWrap [

	self layout vShrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>vSpaceFill [

	self vSpaceFill: 100
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>vSpaceFill: anInteger [
	<brickBuilderProperty: #Layout name: 'Vertical percent' as: #asInteger getter: #vPercent model: #GLMUIBuilderTextFieldProperty>

	self layout vSpaceFill: anInteger
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>valueOfProperty: aSymbol [
	
	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>valueOfProperty: aSymbol ifAbsent: aBlock [
	
	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>valueOfProperty: aSymbol ifAbsentPut: aBlock  [
	
	^ self explicitRequirement
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>zIndex [

	^ self layout zIndex brickValue: self
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutTrait>>zIndex: anInteger [

	self layout zIndex: anInteger
]
