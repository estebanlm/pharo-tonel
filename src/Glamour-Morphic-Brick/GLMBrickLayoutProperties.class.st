"
A GLMBrickLayoutProperties is  a holder class of layout properties used by layout policy

Instance Variables
	horizontalPercent:		<Object>
	marginBottom:		<Object>
	marginLeft:		<Object>
	marginRight:		<Object>
	marginTop:		<Object>
	maxHeightBlock:		<Object>
	maxWidthBlock:		<Object>
	minHeight:		<Object>
	minWidth:		<Object>
	paddingBottom:		<Object>
	paddingLeft:		<Object>
	paddingRight:		<Object>
	paddingTop:		<Object>
	verticalPercent:		<Object>

horizontalPercent
	- xxxxx

marginBottom
	- xxxxx

marginLeft
	- xxxxx

marginRight
	- xxxxx

marginTop
	- xxxxx

maxHeightBlock
	- xxxxx

maxWidthBlock
	- xxxxx

minHeight
	- xxxxx

minWidth
	- xxxxx

paddingBottom
	- xxxxx

paddingLeft
	- xxxxx

paddingRight
	- xxxxx

paddingTop
	- xxxxx

verticalPercent
	- xxxxx

"
Class {
	#name : #GLMBrickLayoutProperties,
	#superclass : #TableLayoutProperties,
	#instVars : [
		'floating',
		'hAlign',
		'heightDependencies',
		'maxHeight',
		'maxWidth',
		'minHeight',
		'vAlign',
		'widthDependencies',
		'zIndex',
		'minWidth',
		'isDirty',
		'hState',
		'vState'
	],
	#category : #Glamour-Morphic-Brick-Layouts,
	#timestamp : 'AliakseiSyrel 10/17/2014 10:13'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>floating [

	^ floating ifNil: [ floating := #none ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>floating: aSymbol [
	floating := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hAlign [

	^ hAlign ifNil: [ hAlign := #none ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hAlign: aSymbol [

	hAlign := aSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hPercent [

	^ self hState percent
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hPercent: anInteger [

	hState := self hState onParentDo: [ :s | s percent: anInteger ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hShrinkWrap [
	"my width will change to fit children"
	hState := self hState onChildrenDo: #yourself
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hSpaceFill [
	"my width will change to fill 100% of my parent"
	self hSpaceFill: 100
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hSpaceFill: anInteger [
	"my width will change to fill anInteger percents of my parent"
	self hPercent: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hState [

	^ hState
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hasMaxHeight [

	^ (self maxHeight isNumber ifTrue: [ self maxHeight isInfinite ] ifFalse: [ false ]) not
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hasMaxWidth [

	^ (self maxWidth isNumber ifTrue: [ self maxWidth isInfinite ] ifFalse: [ false ]) not
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hasMinHeight [

	^ (self minHeight isNumber ifTrue: [ self minHeight <= 0 ] ifFalse: [ false ]) not
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>hasMinWidth [

	^ (self minWidth isNumber ifTrue: [ self minWidth <= 0 ] ifFalse: [ false ]) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>height [

	^ self vState dimension
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>height: anObject [

	vState := self vState onMyselfDo: [ :s | s dimension: anObject ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>heightDependencies [

	^ heightDependencies ifNil: [ heightDependencies := OrderedCollection new ]
]

{
	#category : #scripting-advanced,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>heightDependency: anObject [

	self heightDependencies add: anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>initialize [
	super initialize.
	
	hState := GLMBrickLayoutDummState new.
	vState := GLMBrickLayoutDummState new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>isClean [

	^ self isDirty not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>isDirty [

	^ isDirty ifNil: [ isDirty := true ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>isHShrinkWrap [

	^ self hState isOnChildren
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>isHSpaceFill [

	^ self hState isOnParent
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>isHeightCustom [

	^ self vState isOnMyself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>isVShrinkWrap [

	^ self vState isOnChildren
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>isVSpaceFill [

	^ self vState isOnParent
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>isWidthCustom [

	^ self hState isOnMyself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>markClean [

	isDirty := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>markDirty [

	isDirty := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>maxHeight [

	^ maxHeight ifNil: [ maxHeight := Float infinity ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>maxHeight: anObject [

	maxHeight := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>maxWidth [

	^ maxWidth ifNil: [ maxWidth := Float infinity ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>maxWidth: anObject [

	maxWidth := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>minHeight [

	^ minHeight ifNil: [ minHeight := 0 ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>minHeight: anObject [
	
	minHeight := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>minWidth [

	^ minWidth ifNil: [ minWidth := 0 ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>minWidth: anObject [
	minWidth := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>vAlign [

	^ vAlign ifNil: [ vAlign := #none ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>vAlign: aSymbol [

	vAlign := aSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>vPercent [

	^ self vState percent
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>vPercent: anInteger [

	vState := self vState onParentDo: [ :s | s percent: anInteger ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>vShrinkWrap [

	vState := self vState onChildrenDo: #yourself
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>vSpaceFill [
	"my height will change to fill 100% of my parent"
	self vSpaceFill: 100
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>vSpaceFill: anInteger [
	"my height will change to fill anInteger percents of my parent"
	self vPercent: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>vState [

	^ vState
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>width [

	^ self hState dimension
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>width: anObject [

	hState := self hState onMyselfDo: [ :s | s dimension: anObject ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>widthDependencies [

	^ widthDependencies ifNil: [ widthDependencies := OrderedCollection new ]	
]

{
	#category : #scripting-advanced,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>widthDependency: anObject [

	self widthDependencies add: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>zIndex [

	^ zIndex ifNil: [ zIndex := 1 ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutProperties>>zIndex: anObject [
	zIndex := anObject
]
