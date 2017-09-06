"

"
Class {
	#name : #GLMBrickPopupEditBorderThemer,
	#superclass : #GLMBrickPopupEditThemer,
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup-Themer,
	#timestamp : ''
}

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupEditBorderThemer>>backgroundColor [
	^ self borderColor muchLighter darker
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupEditBorderThemer>>contentBackgroundColor [
	^ Smalltalk ui theme backgroundColor "delegate to current Pharo theme"
]

{
	#category : #brick-popup,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPopupEditBorderThemer>>contentPadding [
	^ 5
]
