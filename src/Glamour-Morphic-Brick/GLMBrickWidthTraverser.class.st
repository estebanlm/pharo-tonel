"

"
Class {
	#name : #GLMBrickWidthTraverser,
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
GLMBrickWidthTraverser class>>cleanUp [

	uniqueInstance := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser class>>uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>customDependencies: aBrick [

	^ aBrick layout widthDependencies
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>hasMaxDimensionRestriction: aBrick [

	^ aBrick layout hasMaxWidth
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>hasMinDimensionRestriction: aBrick [

	^ aBrick layout hasMinWidth
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>isClean: aBrick [

	^ aBrick isWidthClean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>isOppositeClean: aBrick [

	^ aBrick isHeightClean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>markClean: aBrick [

	aBrick markWidthClean
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>markDirty: aBrick [

	self markLayoutDirty: aBrick owner.
	aBrick markWidthDirty
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>opposite [

	^ GLMBrickHeightTraverser uniqueInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>state [

	^ #hState
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWidthTraverser>>updateDimension: aBrick [

	"my height is already calculated, maybe because it children triggered calculation"
	aBrick isWidthClean ifTrue: [ ^ self ].
	(self dimensionPolicy: aBrick)  updateWidth: aBrick
]
