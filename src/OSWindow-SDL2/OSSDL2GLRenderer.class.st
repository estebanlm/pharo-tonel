"
My instances implement OSWindowGLRenderer interface using SDL2 library
"
Class {
	#name : #OSSDL2GLRenderer,
	#superclass : #OSWindowGLRenderer,
	#instVars : [
		'context'
	],
	#pools : [
		'SDL2Constants'
	],
	#category : #OSWindow-SDL2-OpenGL,
	#timestamp : 'IgorStasenko 7/30/2014 18:22'
}

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GLRenderer>>checkThread [
	OSWindowRenderThread isThisThread ifFalse: [ ^ 'GL Renderer must be used inside the OSWindowRenderThread' ]
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GLRenderer>>createContext [
	self onRenderThreadBlocking: [
		context := SDL2 glCreateContext: window handle.
	]

]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GLRenderer>>destroy [
	self onRenderThreadBlocking: [
		context ifNotNil: [ context delete ].
		context := nil.
	]
	
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GLRenderer>>getProcAddress: procName [
	self checkThread.
	^ SDL2 glGetProcAddress: procName
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GLRenderer>>makeCurrent: aWindow [
	| windowHandle |
	context ifNil: [ ^ false ].
	
	self checkThread.
	windowHandle := aWindow handle.
	windowHandle ifNil: [ ^ false ].
	(SDL2 glMakeCurrent: windowHandle context: context) == 0
		ifTrue:  [ ^ true ]
		ifFalse:  [ ^ false ]
	
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GLRenderer>>swapBuffers: aWindow [
	self checkThread.
	SDL2 glSwapWindow: aWindow handle.
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GLRenderer>>updateAll [
	"Do nothing here"

]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GLRenderer>>updateRectangle: rectangle [
	"Do nothing here"
]
