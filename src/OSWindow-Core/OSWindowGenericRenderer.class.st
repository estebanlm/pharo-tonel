"
I am an abstract renderer that provides a generic API for native window rendering.
"
Class {
	#name : #OSWindowGenericRenderer,
	#superclass : #OSWindowRenderer,
	#category : #OSWindow-Core,
	#timestamp : 'RonieSalgado 4/10/2016 02:05'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGenericRenderer>>clear [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGenericRenderer>>color: aColor [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGenericRenderer>>drawLine: startPoint end: endPoint [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGenericRenderer>>drawPoint: aPoint [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGenericRenderer>>drawRectangle: aRectangle [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGenericRenderer>>fillRectangle: aRectangle [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGenericRenderer>>present [
	"This should present the content of an internal draw buffer"
	self subclassResponsibility
]
