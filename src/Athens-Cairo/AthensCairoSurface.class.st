"
i am a concrete implementation of Athens surface which using cairo graphics library for rendering.

Cairo library, by itself can have multiple surface types.
This class uses image surface (a bitmap located in system memory) and maps to cairo_image_surface_t* C type.

**NOTE**
As a workaround of bitblt bug, the actual Cairo surfaces, created internally is with 1 extra pixel higher than requested. This is, however completely hidden from users.
"
Class {
	#name : #AthensCairoSurface,
	#superclass : #AthensSurface,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#instVars : [
		'handle',
		'context',
		'builder',
		'id',
		'ftFontRenderer',
		'session'
	],
	#pools : [
		'AthensCairoDefs'
	],
	#classInstVars : [
		'session',
		'dispatch',
		'dispatchStruct'
	],
	#category : #Athens-Cairo,
	#timestamp : 'IgorStasenko 4/29/2014 17:05'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>asExternalTypeOn: generator  [
	"use handle ivar to hold my instance (cairo_surface_t)"
	^ FFIExternalObjectType objectClass: self
]

{
	#category : #'session management',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>checkSession [
	session == Smalltalk session 
		ifFalse: [ self initializeForNewSession ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>createFromFile: aFileName ifFailed: aBlock [
	"Right now, this protocol is Cairo backend only. "
	
 	| surface cstring |
	cstring := aFileName , (Character value: 0) asString.
	surface :=  self primCreateFromFile: cstring.
	surface isSuccess not
		ifTrue: [ 
			self destroySurfaceHandle: surface handle asInteger.
			^ aBlock cull: surface status ]
		ifFalse: [ surface initialize ].
	^ surface .
]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>createGetSurfaceFormatFn [
	"
		int getSurfaceFormat(sqIntptr_t handle, int* width, int* height, int* depth, int* isMSB);

		Return general information about the OS drawing surface.
		Return true if successful, false otherwise.

		The returned values describe the basic properties such as
		width, height, depth and LSB vs. MSB pixels.
	"
	^ FFICallback 
		signature: #(int (void *handle, int* width, int* height, int* depth, int* isMSB))
		block: [ :handle :width :height :depth :isMSB |
			[width signedLongAt: 1 put: (self get_width: handle).
			 height signedLongAt: 1 put: (self get_height: handle).
			 depth signedLongAt: 1 put: 32.
			 isMSB signedLongAt: 1 put: 0. 
			 1 "Everything ok"] 
			on: Error do: [ :e | 0 "Error happened" ]]
]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>createLockSurfaceFn [
	"
	int lockSurface(sqIntptr_t handle, int *pitch, int x, int y, int w, int h);
		Lock the bits of the surface.
		Return a pointer to the actual surface bits, or NULL on failure.
		If successful, store the pitch of the surface (e.g., the bytes
		per scan line).

		For equal source/dest handles only one locking operation is performed.
		This is to prevent locking of overlapping areas which does not work with
		certain APIs (e.g., DirectDraw prevents locking of overlapping areas). 
		A special case for non-overlapping but equal source/dest handle would 
		be possible but we would have to transfer this information over to 
		unlockSurfaces somehow (currently, only one unlock operation is 
		performed for equal source and dest handles). Also, this would require
		a change in the notion of ioLockSurface() which is right now interpreted
		as a hint and not as a requirement to lock only the specific portion of
		the surface.

		The arguments in ioLockSurface() provide the implementation with
		an explicit hint what area is affected. It can be very useful to
		know the max. affected area beforehand if getting the bits requires expensive
		copy operations (e.g., like a roundtrip to the X server or a glReadPixel op).
		However, the returned pointer *MUST* point to the virtual origin of the surface
		and not to the beginning of the rectangle. The promise made by BitBlt
		is to never access data outside the given rectangle (aligned to 4byte boundaries!)
		so it is okay to return a pointer to the virtual origin that is actually outside
		the valid memory area.

		The area provided in ioLockSurface() is already clipped (e.g., it will always
		be inside the source and dest boundingBox) but it is not aligned to word boundaries
		yet. It is up to the support code to compute accurate alignment if necessary.
	"

	^ FFICallback 
		signature: #(void * (void *handle, int *pitch, int x, int y, int w, int h))
		block: [ :handle :pitch :x :y :w :h |
			pitch signedLongAt: 1 put: (self get_stride: handle).
			self get_data: handle ]
]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>createShowSurfaceFn [
	"
	int showSurface(sqIntptr_t handle, int x, int y, int w, int h);
		Display the contents of the surface on the actual screen.

		If ioShowSurface() is called the surface in question represents
		a Squeak DisplayScreen.

	"
	^ nil
	"^ FFICallback 
		signature: #(int (void *handle, int x, int y, int w, int h))
		block: [ :handle :x :y :w :h | 0 ""Do nothing"" ]"
]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>createUnlockSurfaceFn [
	"
		int unlockSurface(sqIntptr_t handle, int x, int y, int w, int h);
		Unlock the bits of a (possibly modified) surface after BitBlt completed.
		The return value is ignored.

		The arguments provided specify the dirty region of the surface. If the
		surface is unmodified all arguments are set to zero.

	"
	^ nil
	"^ FFICallback 
		signature: #(int (void *handle, int x, int y, int w, int h))
		block: [ :handle :x :y :w :h | 0 ""Do nothing"" ]"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>destroyContextHandle: aHandle [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #( 	void cairo_destroy (size_t aHandle) )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>destroySurfaceHandle: handle [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #( void cairo_surface_destroy ( ulong handle ) )


]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>dispatchStruct [
	self checkSession.
	^ dispatchStruct
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>extent: anExtent [
	^ self extent: anExtent format: CAIRO_FORMAT_ARGB32
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>extent: anExtent format: aFormat [
	^ ( self primImage: aFormat width: anExtent x height: anExtent y + 1) initialize

]

{
	#category : #'finalize resources',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>finalizeResourceData: data [
	| handle id contextHandle |
	handle := data first.
	id := data second.
	contextHandle := data third.
	
	(self findSurface: id) = handle value ifFalse: [ 
		"self error: 'surface is not registered with surface plugin'."
		^ self ].
	
	self unregisterSurfaceWithId: id.
	self destroyContextHandle: contextHandle value. 
	self destroySurfaceHandle: handle value

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>findSurface: surfaceId [
	| buf |
	buf := ByteArray new: 4.  "sizeof(int)"
	
	
	(self ioFindSurface: surfaceId handle: buf) ifTrue: [
		^ buf nbUlongAt: 1
		].
	
	^ nil. 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>fromForm: aForm [
	| form surface newBits |
	
	form := aForm unhibernate; asFormOfDepth: 32.
	surface := self extent: aForm extent.
	
	"we should convert form bits with premultiplied alpha"
	
	newBits := form bits collect:[:pixel |
		| alpha r g b|
		alpha := (pixel >> 24) / 255.
		
		r := ( (pixel bitAnd: 255) * alpha ) asInteger.
		g := ( (pixel >>8 bitAnd: 255) * alpha ) asInteger.
		b := ( (pixel >>16 bitAnd: 255) * alpha ) asInteger.
		
		(pixel bitAnd: 16rFF000000) + (b<<16) + (g<<8) + r
		].
	
	LibC memCopy: newBits to: surface getDataPtr getHandle size: (form width * form height *4).
	
	surface markDirty.

	^ surface.
]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>get_data: surface [
	^ self ffiCall: #(void *cairo_image_surface_get_data (void *surface))
]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>get_height: surface [
	^ self ffiCall: #(int cairo_image_surface_get_height (void *surface))
]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>get_stride: surface [
	^ self ffiCall: #(int cairo_image_surface_get_stride (void *surface))
]

{
	#category : #'surface plugin callbacks',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>get_width: surface [
	^ self ffiCall: #(int cairo_image_surface_get_width (void *surface))
]

{
	#category : #'session management',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>initializeForNewSession [
	session := Smalltalk session.
	"create a dispatch structure"
	dispatchStruct := SQSurfaceDispatch externalNew.
	dispatchStruct 
		getSurfaceFormatFn: self createGetSurfaceFormatFn;
		lockSurfaceFn: self createLockSurfaceFn;
		unlockSurfaceFn: self createUnlockSurfaceFn;
		showSurfaceFn: self createShowSurfaceFn.
	"assign the pointer"
	dispatch := dispatchStruct getHandle.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>ioFindSurface: id dispatch: dispPtr handle: handlePtr [
"	int ioFindSurface(int surfaceID, sqSurfaceDispatch *fn, int *surfaceHandle);
		Find the surface with the given ID, and, optionally,
		the given set of surface functions. The registered handle
		is returned in surfaceHandle. Return true if successful
		(e.g., the surface has been found), false otherwise.
"


	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	self nbCall: #( bool ioFindSurface(int id, void * dispPtr, int *handlePtr) ) module: #SurfacePlugin
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>ioFindSurface: id handle: handlePtr [
"	int ioFindSurface(int surfaceID, sqSurfaceDispatch *fn, int *surfaceHandle);
		Find the surface with the given ID, and, optionally,
		the given set of surface functions. The registered handle
		is returned in surfaceHandle. Return true if successful
		(e.g., the surface has been found), false otherwise.
"


	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	self nbCall: #( bool ioFindSurface(int id, 0 , int *handlePtr) ) module: #SurfacePlugin
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>ioRegisterSurface: aCairoSurfaceHandle dispatch: sqSurfaceDispatchPtr surfaceId: idHolder [
"
	int ioRegisterSurface(int surfaceHandle, sqSurfaceDispatch *fn, int *surfaceID);

	Register a new surface with the given handle and
	the set of surface functions. The new ID is returned
	in surfaceID. Returns true if successful, false 
	otherwise.

"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>

	self nbCall: #(bool ioRegisterSurface(int aCairoSurfaceHandle, void *sqSurfaceDispatchPtr, void *idHolder)) module: #SurfacePlugin
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>ioUnregisterSurface: aCairoSurfaceId [
"
	ioUnregisterSurface:
	Unregister the surface with the given id.
	Returns true if successful, false otherwise. 

"

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	self nbCall: #( int ioUnregisterSurface(ulong aCairoSurfaceId) ) module: #SurfacePlugin
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>primCreateFromFile: aFileName [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin> 
	
	^self nbCall: #(AthensCairoSurface cairo_image_surface_create_from_png (char* aFileName)) 

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>primImage: aFormat width: aWidth height: aHeight [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #(AthensCairoSurface cairo_image_surface_create (int aFormat,
                                                         int aWidth,
                                                         int aHeight) )


]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>primImageFromData: data width: width height: height pitch: stride [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #(AthensCairoSurface cairo_image_surface_create_for_data (
		void *data,
		CAIRO_FORMAT_ARGB32,
		int width,
		int height,
		int stride) )


]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>primWidth: aWidth height: aHeight [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #( AthensCairoSurface cairo_image_surface_create (
						CAIRO_FORMAT_ARGB32,
						int aWidth,
						int aHeight) )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>registerSurface: anAthensCairoSurface [
	"register the cairo surface with surface plugin,
	so, it can be used directly by bitblt operations.
	Answer an id and unique session object"
	| id address |

	self checkSession.

	id := ByteArray new: 4.
	address := anAthensCairoSurface handle value.
	(self ioRegisterSurface: address dispatch: dispatch surfaceId: id)
		ifFalse: [ self error: 'Unable to register surface with SurfacePlugin' ].
	id := id signedLongAt: 1.
	
	^ id
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>unregisterSurfaceWithId: anAthensCairoSurfaceId [

	self ioUnregisterSurface: anAthensCairoSurfaceId
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface class>>width: aWidth height: aHeight [
	^ (self primWidth: aWidth height: aHeight+1) initialize
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>asAthensPaintOn: aCanvas [
	^ AthensCairoPatternSurfacePaint createForSurface: self.
 
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>asForm [
	"create a form and copy an image data there"
	self checkSession.
	self flush.
 	^ (AthensCairoSurfaceForm extent: (self width@(self height)) depth: 32 bits: id)
		surface: self;
		yourself
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>attemptToRecurseDrawing [
	^ self 
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>cacheAt: anObject ifAbsentPut: aBlock [
	"Answer an object from surface's cache identified by anObject,
	if there is no cached object under such identifier, evaluate a block
	and put it into cache. Then answer the result of evaluation.
	A surface using identity comparison for object identifiers.
	"
	^ CairoBackendCache soleInstance at: anObject ifAbsentPut: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>checkSession [
	session == Smalltalk session ifFalse: [ 
		self error: 'Attempt to use invalid external resource (left from previous session)' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>clear [
	^ self clear: Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>clear: clearPaint [
	currentCanvas pathTransform restoreAfter: [
		currentCanvas pathTransform loadIdentity.
		currentCanvas paintMode restoreAfter: [
			currentCanvas paintMode source.
			currentCanvas 
				setPaint: clearPaint;
				drawShape: (0@0 extent: self extent).
				
        ]].


]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>createFormPaint: aForm  [
	"here we should convert form to cairo surface"
	
	| newSurface |

	newSurface := self class fromForm: (aForm asFormOfDepth: 32).
	
	^ newSurface asAthensPaintOn: context


]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>createLinearGradient: aColorRamp start: aStartPoint stop: aStopPoint [
	^ AthensCairoGradientPaint 
		createLinearGradient: aColorRamp 
		start: aStartPoint 
		stop: aStopPoint
	
]

{
	#category : #creation,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>createPath: aPathCreatingBlock [
	^ builder createPath:  aPathCreatingBlock 
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>createRadialGradient: colorRamp center: aCenter radius: aRadius focalPoint: fp [
	^AthensCairoGradientPaint	
		radialBetween: fp
		extending: 0
		and: aCenter
		extending: aRadius
		withColorRamp: colorRamp
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>createSolidColorPaint: aColor  [

	^ AthensCairoSolidPaint new color: aColor
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>createStrokePaintFor: aPaint [

	^ AthensCairoStrokePaint new fillPaint: aPaint
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>drawDuring: aBlock [

	"You may draw on receiver only when inside a block and only using provided canvas object.
	This ensures releasing system resources used after finishing drawing"

	self checkSession.
	
	currentCanvas ifNotNil: [ self attemptToRecurseDrawing ].
	[
		currentCanvas := context.
		self privSetDefaults.
		aBlock value: currentCanvas.
		self flush.
	] ensure: [
		currentCanvas := nil.
	].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>extent [
	^ self width @ self height
]

{
	#category : #'rendering dispatch',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>fillPath: aPath withSolidColor: aColor  [

	self loadSolidColor: aColor.
	
	currentCanvas 
		newPath;
		loadPath: aPath;
		fill
	
]

{
	#category : #'rendering dispatch',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>fillRectangle: aRectangle withSolidColor: aColor [

	self loadSolidColor: aColor.
	
	currentCanvas
		newPath;
		rectangleX: aRectangle left y: aRectangle top width: aRectangle width height: aRectangle height;
		fill
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>flush [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #( void cairo_surface_flush (self) )
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>flushCacheAt: anObject [

	"Flush (delete) any cached value(s) identified by given object, anObject.
	Do nothing if there's no cached values stored for given object.
	Answer receiver.

	A surface using identity comparison for object identifiers.
	"
	CairoBackendCache soleInstance removeAt: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>getDataPtr [
	"get a pointer to surface bitmap data"

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #(
		void* cairo_image_surface_get_data ( self ) )


]

{
	#category : #'text support',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>getFreetypeFontRendererFor: aFreetypeFont  [
	"answer the same instance, just reset it's font and advance"
	
	^ ftFontRenderer font: aFreetypeFont; advance: 0@0; yourself
]

{
	#category : #'text support',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>getStrikeFontRendererFor: aStrikeFont  [
	"answer the same instance, just reset it's font and advance"
	
	^ AthensStrikeFontRenderer on: context  forFont: aStrikeFont.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>handle [
	^ handle value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>height [
	
	^self privateHeight - 1

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>initialize [
	"the handle should be set already since we using an NB callout to create an instance"
	handle value = 0 ifTrue: [ 
		self error: 'Error creating new surface' ].
	
	session := Smalltalk session.
	
	id := self class registerSurface: self.
		
	context := self newCanvas.
	builder := AthensCairoPathBuilder new.
	builder context: context.
	ftFontRenderer := CairoFreetypeFontRenderer new
		canvas: context. 
	
	FFIExternalResourceManager addResource: self.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>isSuccess [
	^ self status  =	CAIRO_STATUS_SUCCESS
]

{
	#category : #'rendering dispatch',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>loadSolidColor: aColor [
	currentCanvas setSourceR: aColor red g: aColor green b: aColor blue a: aColor alpha; resetDash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>markDirty [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #( void cairo_surface_mark_dirty (self) )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>newCanvas [
	"Answer a preinitialized instance of AthensCanvas.
	Private to receiver and its subclasses, override seldom"
	
	^ self primCreateCanvas surface: self


]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>primCreateCanvas [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^self nbCall: #( AthensCairoCanvas cairo_create (self) )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>privSetDefaults [
	"reset matrices"
	currentCanvas pathTransform loadIdentity.
	currentCanvas paintTransform loadIdentity.
	currentCanvas paintMode over.
	

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>privateHeight [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #(
		int cairo_image_surface_get_height ( self ) )


]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>resourceData [
	^ { handle value. id. context handle }
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>status [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^ self nbCall: #(int cairo_surface_status (self) )
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>statusToString: aCairoStatusT [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #(String   cairo_status_to_string  (cairo_status_t aCairoStatusT))
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>stride [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #(
		int cairo_image_surface_get_stride ( self ) )


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>width [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #(
		int cairo_image_surface_get_width ( self ) )


]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurface>>writeToPng: aFileName [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	self nbCall: #(void cairo_surface_write_to_png (self, String aFileName) )

]
