"
I am a Function that do nothing to use a Null Object Pattern.
	
Example (Should only be create by a FTTableMorph)
-------------------------------------------------

FTNilFunction table: (FTTableMorph with: (1 to: 200))

"
Class {
	#name : #FTNilFunction,
	#superclass : #FTFunction,
	#category : #Morphic-Widgets-FastTable-Functions,
	#timestamp : 'CyrilFerlicot 10/27/2015 14:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTNilFunction>>beExplicite [
	"Do nothing"
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTNilFunction>>disable [
	"Do nothing"

	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTNilFunction>>isExplicite [
	^ false
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTNilFunction>>keyStroke: anEvent [
	"Do nothing"
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTNilFunction>>reset [

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTNilFunction>>resizeContainerFrom: topLefPoint to: bottomRightPoint [
	"I do not change the size of the container."

	^ topLefPoint corner: bottomRightPoint
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTNilFunction>>resizeWidget [
	"Do nothing"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTNilFunction>>showWidget [
	"Do nothing"
]
