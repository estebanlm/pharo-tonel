"
I am a private class, used to represent a 'cairo_font_face_t *' data structure 
of Cairo library.

I am not useful for direct use nor providing any functionality. My only purpose is to keep a strong reference to original FT2Face object
(so it won't be freed before a corresponding instance of mine will release it).


"
Class {
	#name : #CairoFontFace,
	#superclass : #FFIExternalObject,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#instVars : [
		'ftFace'
	],
	#pools : [
		'AthensCairoDefs',
		'FT2Constants'
	],
	#category : #Athens-Cairo-Text
}

{ #category : #finalizing }
CairoFontFace class >> finalizeResourceData: handle [

"
void                cairo_font_face_destroy             (cairo_font_face_t *font_face);
"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #( void cairo_font_face_destroy (size_t handle)) 
]

{ #category : #'instance creation' }
CairoFontFace class >> fromFreetypeFace: aFace [
	| handle cairoFace |
	
	handle := aFace handle pointerAt: 1.
 	cairoFace := self primFtFace: handle loadFlags: ( LoadNoHinting | LoadTargetLCD | LoadNoAutohint | LoadNoBitmap). 
	
	^ cairoFace initializeWithFreetypeFace: aFace
]

{ #category : #'instance creation' }
CairoFontFace class >> primFtFace: aFace loadFlags: flags [

"
cairo_font_face_t * cairo_ft_font_face_create_for_ft_face
                                                        (FT_Face face,
                                                         int load_flags);
"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #( CairoFontFace cairo_ft_font_face_create_for_ft_face(void * aFace , int flags )) 
]

{ #category : #initialize-release }
CairoFontFace >> initialize [ 
	self autoRelease 
]

{ #category : #initialize-release }
CairoFontFace >> initializeWithFreetypeFace: aFace [
	ftFace := aFace.
	
	self autoRelease.
]

{ #category : #private }
CairoFontFace >> primSetSynthesizeEmphasis: flags [
"
void
cairo_ft_font_face_set_synthesize (cairo_font_face_t *font_face,
                                   int synth_flags);
"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #( void cairo_ft_font_face_set_synthesize(self, int flags )) 
]

{ #category : #'external resource management' }
CairoFontFace >> resourceData [ 
	^ handle value
]

{ #category : #accessing }
CairoFontFace >> status [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(int cairo_font_face_status (self))
		
]

{ #category : #accessing }
CairoFontFace >> synthesizeBold [
	self primSetSynthesizeEmphasis: 1
]

{ #category : #accessing }
CairoFontFace >> synthesizeBoldAndOblique [
	self primSetSynthesizeEmphasis: 3
]

{ #category : #accessing }
CairoFontFace >> synthesizeEmphasis: emphasisCode [
	emphasisCode = (TextEmphasis bold emphasisCode | TextEmphasis italic emphasisCode)
		ifTrue: [ ^ self synthesizeBoldAndOblique ].
	emphasisCode = TextEmphasis bold emphasisCode
		ifTrue: [ ^ self synthesizeBold ].
	emphasisCode = TextEmphasis italic emphasisCode
		ifTrue: [ ^ self synthesizeOblique ]
]

{ #category : #accessing }
CairoFontFace >> synthesizeOblique [
	self primSetSynthesizeEmphasis: 2
]
