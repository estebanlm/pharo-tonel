"
I'm a style module related to popup
"
Class {
	#name : #GLMBrickPopupThemer,
	#superclass : #GLMBrickThemerModule,
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup-Themer,
	#timestamp : 'AliakseiSyrel 3/21/2015 19:45'
}

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>backgroundColor [
	"Return a background color of a default popup"
	<return: #Color>

	^ Smalltalk ui theme backgroundColor "delegate to current Pharo theme"
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>borderColor [
	"Return a border color of a default popup"
	<return: #Color>

	^ Smalltalk ui theme borderColor "delegate to current Pharo theme"
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>borderWidth [
	"Return a border width of a default popup"
	<return: #Number>

	^ Smalltalk ui theme borderWidth "delegate to current Pharo theme"
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>contentBackgroundColor [
	"Return a background color of a content brick"
	<return: #Color>

	^ Color transparent
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>contentPadding [
	"Return padding of popup's content brick"
	<return: #Number>

	^ 0
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>inset [
	"Return by how much the whole popup's content (including trigger and content) should be inset.
	Basically, it works similar to padding"
	<return: #Number>
	
	^ self borderWidth
]

{
	#category : #brick-popup-shadow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>shadowColor [
	"Return a color of a shadow around a popup"
	<return: #Color>
	
	^ Color black alpha: 0.5
]

{
	#category : #brick-popup-shadow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>shadowInset [
	"Return an inset of a shadow around a popup"
	<return: #Number>

	^ 0
]

{
	#category : #brick-popup-shadow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>shadowOffset [
	"Return an offset of a shadow around popup"
	<return: #Point>
	
	^ 0@0
]

{
	#category : #brick-popup-shadow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>shadowWidth [
	"Return a width of a shadow around a popup"
	<return: #Number>
	
	^ 0
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>spacing [
	"Return how much free space there should be between trigger and content bricks"
	<return: #Number>

	^ 0
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupThemer>>textColor [

	^ Smalltalk ui theme textColor "delegate to current Pharo theme"
]
