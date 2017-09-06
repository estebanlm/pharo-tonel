"
Identity transformation
"
Class {
	#name : #IdentityTransform,
	#superclass : #DisplayTransform,
	#classVars : [
		'Default'
	],
	#category : #Graphics-Transformations,
	#timestamp : 'TorstenBergmann 2/12/2014 22:28'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform class>>initialize [
	"IdentityTransform initialize"
	Default := self basicNew
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform class>>new [
	"There can be only one"
	^Default
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>angle [
	^ 0.0
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>asMatrixTransform2x3 [
	"Represent the receiver as a 2x3 matrix transformation"
	^MatrixTransform2x3 identity
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>composedWith: aTransform [
	^aTransform
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>composedWithGlobal: aTransformation [
	^aTransformation
]

{
	#category : #composing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>composedWithLocal: aTransformation [
	^aTransformation
]

{
	#category : #'transforming rects',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>globalBoundsToLocal: aRectangle [
	"Transform aRectangle from global coordinates into local coordinates"
	^aRectangle
]

{
	#category : #'transforming points',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>globalPointToLocal: aPoint [
	"Transform aPoint from global coordinates into local coordinates"
	^aPoint
]

{
	#category : #'transforming points',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>globalPointsToLocal: inArray [
	"Transform all the points of inArray from global into local coordinates"
	^inArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>inverseTransformation [
	"Return the inverse transformation of the receiver"
	^self
]

{
	#category : #'transforming points',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>invertBoundsRect: aRectangle [
	"Return a rectangle whose coordinates have been transformed
	from local back to global coordinates. Since I am the identity matrix
	no transformation is made."

	^aRectangle

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>isIdentity [
	"Return true if the receiver is the identity transform; that is, if applying to a point returns the point itself."
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>isPureTranslation [
	"Return true if the receiver specifies no rotation or scaling."
	^true
]

{
	#category : #'transforming rects',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>localBoundsToGlobal: aRectangle [
	"Transform aRectangle from local coordinates into global coordinates"
	^aRectangle
]

{
	#category : #'transforming points',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>localPointToGlobal: aPoint [
	"Transform aPoint from local coordinates into global coordinates"
	^aPoint
]

{
	#category : #'transforming points',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>localPointsToGlobal: inArray [
	"Transform all the points of inArray from local into global coordinates"
	^inArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>offset [
	^0@0
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>setIdentity [
	"I *am* the identity transform"
	^self
]

{
	#category : #'transforming rects',
	#timestamp : ' 8/31/2017 05:26:09'
}
IdentityTransform>>sourceQuadFor: aRectangle [
	^ aRectangle innerCorners
]
