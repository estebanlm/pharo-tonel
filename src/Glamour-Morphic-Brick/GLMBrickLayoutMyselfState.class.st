"

"
Class {
	#name : #GLMBrickLayoutMyselfState,
	#superclass : #GLMBrickLayoutState,
	#instVars : [
		'dimension'
	],
	#category : #Glamour-Morphic-Brick-Layouts,
	#timestamp : ''
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutMyselfState>>defaultDimension [

	^ 50
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutMyselfState>>dimension [
	^ dimension
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutMyselfState>>dimension: anObject [
	dimension := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutMyselfState>>initialize [
	super initialize.
	
	dimension := self defaultDimension
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutMyselfState>>isOnMyself [

	^ true
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutMyselfState>>layout: aBrick on: aTraverser [

	"immidiately set my dimension"
	aTraverser updateDimension: aBrick.
	aTraverser markClean: aBrick.
	aTraverser layoutChildrenOf: aBrick.
	aTraverser layoutOwnerOf: aBrick
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutMyselfState>>updateHeight: aBrick on: aLayout [

	aBrick withHeight: (aLayout normalizeHeight: (aLayout heightMyselfDependency: aBrick) of: aBrick)
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutMyselfState>>updateWidth: aBrick on: aLayout [

	aBrick withWidth: (aLayout normalizeWidth: (aLayout widthMyselfDependency: aBrick) of: aBrick)
]
