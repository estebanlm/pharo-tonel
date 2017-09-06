"
I am a popup closer responsible for closing a popup if any of my predicates are activated as the result of an event
"
Class {
	#name : #GLMPopupBrickCloser,
	#superclass : #GLMPopupBrickListener,
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 3/4/2017 23:47'
}

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickCloser>>act [
	self popup close
]
