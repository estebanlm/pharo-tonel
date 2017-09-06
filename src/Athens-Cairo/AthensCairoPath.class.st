"
i used to hold shapes built by path builder in cairo backend
"
Class {
	#name : #AthensCairoPath,
	#superclass : #FFIExternalObject,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#category : #Athens-Cairo-Paths,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPath class>>finalizeResourceData: aHandle [

	self primDestroyPath: aHandle value 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPath class>>primDestroyPath: aHandle [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(void cairo_path_destroy ( ulong aHandle ))

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPath>>asAthensShapeOn: anAthensCanvas  [
	
	^ self
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPath>>initialize  [
	handle value = 0 ifTrue: [ 
		self error: 'Error creating new path' ].
	FFIExternalResourceManager addResource: self data: handle
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPath>>paintFillsUsing: aPaint on: anAthensCanvas  [
	
	"This method is a part of rendering dispatch  Canvas->receiver->paint"
	
	^ aPaint athensFillPath: self on: anAthensCanvas
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPath>>primDestroyPath: aHandle [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(void cairo_path_destroy ( ulong aHandle ))

]
