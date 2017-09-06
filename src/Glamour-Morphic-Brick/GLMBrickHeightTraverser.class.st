"

"
Class {
	#name : #GLMBrickHeightTraverser,
	#superclass : #GLMBrickLayoutTraverser,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #Glamour-Morphic-Brick-Layouts-Utils,
	#timestamp : ''
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser class>>cleanUp [

	uniqueInstance := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser class>>uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>customDependencies: aBrick [

	^ aBrick layout heightDependencies
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>hasMaxDimensionRestriction: aBrick [

	^ aBrick layout hasMaxHeight
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>hasMinDimensionRestriction: aBrick [

	^ aBrick layout hasMinHeight
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>isClean: aBrick [

	^ aBrick isHeightClean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>isOppositeClean: aBrick [

	^ aBrick isWidthClean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>markClean: aBrick [

	aBrick markHeightClean
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>markDirty: aBrick [

	self markLayoutDirty: aBrick owner.
	aBrick markHeightDirty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>opposite [

	^ GLMBrickWidthTraverser uniqueInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>state [

	^ #vState
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickHeightTraverser>>updateDimension: aBrick [
	"my height is already calculated, maybe because my children triggered calculation"
	aBrick isHeightClean ifTrue: [ ^ self ].
	
	(self dimensionPolicy: aBrick) updateHeight: aBrick
]
