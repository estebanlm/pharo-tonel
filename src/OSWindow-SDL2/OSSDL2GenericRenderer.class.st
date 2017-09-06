"
My instances implement OSWindowGenericRenderer interface by wrapping a SDL2 renderer.
"
Class {
	#name : #OSSDL2GenericRenderer,
	#superclass : #OSWindowGenericRenderer,
	#instVars : [
		'renderer'
	],
	#pools : [
		'SDL2Constants'
	],
	#category : #OSWindow-SDL2,
	#timestamp : 'RonieSalgado 4/10/2016 02:42'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>clear [
	renderer clear
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>color: aColor [
	| red green blue alpha |
	red := self mapColorChannel: aColor red.
	green := self mapColorChannel: aColor green.
	blue := self mapColorChannel: aColor blue.
	alpha := self mapColorChannel: aColor alpha.
	renderer drawColorR: red g: green b: blue a: alpha
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>createSDL2Renderer [
	renderer := window handle createDefaultRenderer.
]

{
	#category : #deleting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>destroy [
	renderer destroy
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>drawLine: startPoint end: endPoint [
	renderer drawLineX1: startPoint x asInteger y1: startPoint y asInteger x2: endPoint x asInteger y2: endPoint y asInteger
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>drawPoint: aPoint [
	renderer drawPointX: aPoint x asInteger y: aPoint y asInteger
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>drawRectangle: aRectangle [
	renderer drawRect: aRectangle asSDLRect
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>fillRectangle: aRectangle [
	renderer fillRect: aRectangle asSDLRect
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>mapColorChannel: colorChannel [
	^ colorChannel * 255 asInteger min: 255 max: 0
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2GenericRenderer>>present [
	renderer present
]
