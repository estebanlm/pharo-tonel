"

"
Class {
	#name : #GLMBrickLayoutState,
	#superclass : #Object,
	#category : #Glamour-Morphic-Brick-Layouts,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>isOnChildren [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>isOnMyself [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>isOnParent [

	^ false
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>layout: aBrick on: aTraverser [

]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>layoutPolicy: aBrick on: aTraverser [

	^ aBrick layoutPolicy
]

{
	#category : #doing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>on: aSymbol do: aBlock ifAbsent: absentBlock [
	|state|
	state := (aSymbol cull: self)
		ifTrue: [ self ]
		ifFalse: absentBlock.
	aBlock cull: state.
	^ state
]

{
	#category : #doing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>onChildrenDo: aBlock [

	^ self
		on: #isOnChildren
		do: aBlock
		ifAbsent: [ GLMBrickLayoutChildrenState new ]
]

{
	#category : #doing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>onMyselfDo: aBlock [

	^ self
		on: #isOnMyself
		do: aBlock
		ifAbsent: [ GLMBrickLayoutMyselfState new ]
]

{
	#category : #doing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>onParentDo: aBlock [

	^ self
		on: #isOnParent
		do: aBlock
		ifAbsent: [ GLMBrickLayoutParentState new ]
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>updateHeight: aBrick on: aLayout [

]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickLayoutState>>updateWidth: aBrick on: aLayout [

]
