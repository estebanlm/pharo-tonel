"
I am an implementation of the generic API for native window rendering that does nothing.
"
Class {
	#name : #OSWindowNullGenericRenderer,
	#superclass : #OSWindowGenericRenderer,
	#category : #OSWindow-Core,
	#timestamp : 'RonieSalgado 4/10/2016 02:07'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>clear [
	"Do nothing"
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>color: aColor [
	"Do nothing"
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>drawLine: startPoint end: endPoint [
	"Do nothing"
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>drawPoint: aPoint [
	"Do nothing"
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>drawRectangle: aRectangle [
	"Do nothing"
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>fillRectangle: aRectangle [
	"Do nothing"
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>present [
	"Do nothing"
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>updateAll [
	"Do nothing"
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowNullGenericRenderer>>updateRectangle: rectangle [
	"Do nothing"
]
