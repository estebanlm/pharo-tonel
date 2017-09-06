"
A composite transform provides the effect of several levels of coordinate transformations.
"
Class {
	#name : #CompositeTransform,
	#superclass : #DisplayTransform,
	#instVars : [
		'globalTransform',
		'localTransform'
	],
	#category : #Graphics-Transformations,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform class>>globalTransform: gt localTransform: lt [
	^self new globalTransform: gt localTransform: lt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>angle [
	^ localTransform angle + globalTransform angle
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>asCompositeTransform [
	^self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>asMatrixTransform2x3 [
	^globalTransform asMatrixTransform2x3
		composedWithLocal: localTransform asMatrixTransform2x3
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>asMorphicTransform [
	"Squash a composite transform down to a simple one"
	^ MorphicTransform offset: self offset angle: self angle scale: self scale
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>composedWith: aTransform [
	"Return a new transform that has the effect of transforming points first by the receiver and then by the argument."

	self isIdentity ifTrue: [^ aTransform].
	aTransform isIdentity ifTrue: [^ self].
	^ CompositeTransform new globalTransform: self
							localTransform: aTransform
]

{
	#category : #'transforming points',
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>globalPointToLocal: aPoint [
	"Transform aPoint from global coordinates into local coordinates"
	^localTransform globalPointToLocal:
		(globalTransform globalPointToLocal: aPoint)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>globalTransform: gt localTransform: lt  [
	globalTransform := gt.
	localTransform := lt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>inverseTransformation [
	"Return the inverse transformation of the receiver"
	^self species new
		globalTransform: localTransform inverseTransformation
		localTransform: globalTransform inverseTransformation
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>invert: aPoint [
	^ globalTransform invert: (localTransform invert: aPoint)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>isCompositeTransform [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>isIdentity [
	^ globalTransform isIdentity and: [localTransform isIdentity]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>isPureTranslation [
	^ globalTransform isPureTranslation and: [localTransform isPureTranslation]
]

{
	#category : #'transforming points',
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>localPointToGlobal: aPoint [
	"Transform aPoint from global coordinates into local coordinates"
	^globalTransform localPointToGlobal:
		(localTransform localPointToGlobal: aPoint)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>offset [
	^ (self localPointToGlobal: 0@0) negated
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>scale [
	^ localTransform scale * globalTransform scale
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:09'
}
CompositeTransform>>transform: aPoint [
	^ localTransform transform: (globalTransform transform: aPoint)
]
