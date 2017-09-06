"
I implement an AthensAffineTransform interface.
"
Class {
	#name : #AthensCairoMatrix,
	#superclass : #FFIExternalStructure,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#classVars : [
		'OFFSET_SHX',
		'OFFSET_SHY',
		'OFFSET_SX',
		'OFFSET_SY',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#pools : [
		'AthensCairoDefs'
	],
	#category : #Athens-Cairo-Transforms,
	#timestamp : '<historical>'
}

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix class>>fieldsDesc [
	"self rebuildFieldAccessors"
	^ #(
   double sx; double shx;
   double shy; double sy;
   double x; double y;
	)
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>clearTranslation [
	"reset a translation from matrix, leaving only scale and rotation"
	
	self x: 0.
	self y: 0.
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>copy [
	^ self class new loadAffineTransform: self
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>copyFromMatrix: m [
	self assert: [ m getHandle ~= self getHandle ].
	LibC memCopy: m getHandle to: self getHandle size: self class byteSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>getMatrix [
	
	"Shall we answer an AthensAffineMatrix instead?
	
	^ AthensAffineMatrix new loadAffineTransform: self
	 "

	^ self copy
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>initialize [
	super initialize.
	self loadIdentity
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>initx: x y: y sx: sx sy: sy shx: shx shy: shy [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #(
		void cairo_matrix_init (AthensCairoMatrix * self,
			double sx,
			double shy,
			double shx,
			double sy,
			double x,
			double y))


]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>inverseTransform: aPoint  [

	^ self inverted transform: aPoint
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>invert [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #( cairo_status_t cairo_matrix_invert (AthensCairoMatrix *  self))


]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>inverted [
 	| m |
	m := self copy.
	m invert.
	^ m
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>loadAffineTransform: m [
	self 
		initx: m x 
		y: m y 
		sx: m sx 
		sy: m sy 
		shx: m shx 
		shy: m shy
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>loadIdentity [
	"initialize with identity transform"
	
	self primLoadIdentity 
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>multiplyBy: anAthensAffineTransform [
	
	self primMultiplyBy: (
		self class new loadAffineTransform: anAthensAffineTransform)
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>postCopy [
	self setHandle: self getHandle copy.
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>primLoadIdentity [
	"initialize with identity transform"
	
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self nbCall: #( void cairo_matrix_init_identity (AthensCairoMatrix * self ) )
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>primMultiplyBy: m [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^self nbCall: #(void   cairo_matrix_multiply
		(AthensCairoMatrix * self,
		AthensCairoMatrix * m ,
		AthensCairoMatrix * self ) )


]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>primTransformX: x Y: y [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #( void cairo_matrix_transform_point (AthensCairoMatrix *  self, double * x, double * y))


]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>restoreAfter: aBlock [
	|previous|
	previous := self copy.
	aBlock ensure: [ 
		"self copyFromMatrix: previous. 
		"self loadAffineTransform: previous ]
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>rotateByDegrees: angle [


	^ self rotateByRadians: angle degreesToRadians
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>rotateByRadians: angle [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #(
		void cairo_matrix_rotate (AthensCairoMatrix *  self,
                                                         double angle))


]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>scaleBy: factor [

	"if factor is number, do a uniform scale, 
	if not, then factor is assument to be an instance of Point containing non-uniform scale for each axis"
	factor isPoint 
		ifTrue: [ self scaleX: factor x asFloat Y: factor y asFloat ] 
		ifFalse: [ self scaleX: factor asFloat Y: factor asFloat ]

]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>scaleX: fx Y: fy [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #(
		void cairo_matrix_scale (AthensCairoMatrix * self,
                                                         double fx,
                                                         double fy))


]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>setRotationInRadians: radians [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #( void cairo_matrix_init_rotate (AthensCairoMatrix * self, double  radians))


]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>setScaleX: x Y: y [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #( void cairo_matrix_init_scale (AthensCairoMatrix * self, double  x, double  y))


]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>setTranslateX: x Y: y [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #( void cairo_matrix_init_translate (AthensCairoMatrix * self, double  x, double  y))


]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>shx [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SHX
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>shx: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SHX put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>shy [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SHY
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>shy: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SHY put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>sx [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SX
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>sx: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SX put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>sy [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SY
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>sy: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SY put: anObject
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>transform: aPoint [
	| x y |
	x := ByteArray new: 8.
	y := ByteArray new: 8.
	x doubleAt: 1 put: aPoint x.
	y doubleAt: 1 put: aPoint y.
	self primTransformX: x Y: y.
	^ (x doubleAt: 1) @ (y doubleAt: 1)
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>translateBy: aPoint [
	self translateX: aPoint x Y: aPoint y
]

{
	#category : #transformations,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>translateX: px Y: py [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #(
		void cairo_matrix_translate (AthensCairoMatrix * self,
                                                         double px,
                                                         double py))


]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>x [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoMatrix>>y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y put: anObject
]
