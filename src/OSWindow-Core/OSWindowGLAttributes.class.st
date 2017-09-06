"
I holding a set of OpenGL attributes, used to initialize an opengl rendering context for a window.
"
Class {
	#name : #OSWindowGLAttributes,
	#superclass : #Object,
	#instVars : [
		'redSize',
		'blueSize',
		'greenSize',
		'alphaSize',
		'depthSize',
		'doubleBuffer',
		'swapControl',
		'stencilSize',
		'minorVersion',
		'majorVersion',
		'profileType'
	],
	#classVars : [
		'DefaultAlphaSize',
		'DefaultBlueSize',
		'DefaultDepthSize',
		'DefaultDoubleBuffer',
		'DefaultGreenSize',
		'DefaultMajorVersion',
		'DefaultMinorVersion',
		'DefaultProfileType',
		'DefaultRedSize',
		'DefaultStencilSize',
		'DefaultSwapControl'
	],
	#category : #OSWindow-Core-OpenGL,
	#timestamp : 'IgorStasenko 7/30/2014 16:38'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>defaultAlphaSize [
	^ DefaultAlphaSize
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>defaultBlueSize [
	^ DefaultBlueSize
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>defaultDepthSize [
	^ DefaultDepthSize
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>defaultDoubleBuffer [
	^ DefaultDoubleBuffer
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>defaultGreenSize [
	^ DefaultGreenSize
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>defaultRedSize [
	^ DefaultRedSize
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>defaultStencilSize [
	^ DefaultStencilSize
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>defaultSwapControl [
	^ DefaultSwapControl
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes class>>initialize [
	"
	self initialize
	"
	super initialize.
	
	DefaultRedSize := 5.
	DefaultGreenSize := 5.
	DefaultBlueSize := 5.
	DefaultAlphaSize := 5.
	DefaultDepthSize := 16.
	DefaultDoubleBuffer := 1.
	DefaultStencilSize := 0.
	DefaultSwapControl := 0.
	DefaultMajorVersion := 3.
	DefaultMinorVersion := 2.
	DefaultProfileType := 1.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>alphaSize [
	
	^ alphaSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>alphaSize: anObject [
	
	alphaSize := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>blueSize [
	
	^ blueSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>blueSize: anObject [
	
	blueSize := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>depthSize [
	
	^ depthSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>depthSize: anObject [
	
	depthSize := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>doubleBuffer [
	
	^ doubleBuffer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>doubleBuffer: anObject [
	
	doubleBuffer := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>greenSize [
	
	^ greenSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>greenSize: anObject [
	
	greenSize := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>initialize [
	redSize := DefaultRedSize.
	greenSize := DefaultGreenSize.
	blueSize := DefaultBlueSize.
	alphaSize := DefaultAlphaSize.
	depthSize := DefaultDepthSize.
	stencilSize := DefaultStencilSize.
	doubleBuffer := DefaultDoubleBuffer.
	swapControl := DefaultSwapControl.
	minorVersion := DefaultMinorVersion.
	majorVersion := DefaultMajorVersion.
	profileType := DefaultProfileType.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>majorVersion [
	^ majorVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>majorVersion: anObject [
	majorVersion := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>minorVersion [
	^ minorVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>minorVersion: anObject [
	minorVersion := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>profileType [
	^ profileType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>profileType: anObject [
	profileType := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>redSize [
	
	^ redSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>redSize: anObject [
	
	redSize := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>stencilSize [
	^ stencilSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>stencilSize: aStencilSize [
	stencilSize := aStencilSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>swapControl [
	
	^ swapControl
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLAttributes>>swapControl: anObject [
	
	swapControl := anObject
]
