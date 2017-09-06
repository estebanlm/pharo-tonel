"
i am abstract OpenGL renderer facade. 
"
Class {
	#name : #OSWindowGLRenderer,
	#superclass : #OSWindowRenderer,
	#category : #OSWindow-Core-OpenGL,
	#timestamp : 'IgorStasenko 7/30/2014 17:48'
}

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLRenderer>>getProcAddress: procName [
	"Gets an OpenGL procedure address."
	self subclassResponsibility
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLRenderer>>makeCurrent [
	^ self makeCurrent: window
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLRenderer>>makeCurrent: aWindow [
	self subclassResponsibility
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLRenderer>>swapBuffers [
	^ self swapBuffers: window
]

{
	#category : #misc,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGLRenderer>>swapBuffers: aWindow [
	self subclassResponsibility
]
