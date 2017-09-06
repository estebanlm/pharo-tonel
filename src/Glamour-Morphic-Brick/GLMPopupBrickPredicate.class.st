"
I am a predicate that defines a boolean function used to decide whether an opener or closer should perform their actions
"
Class {
	#name : #GLMPopupBrickPredicate,
	#superclass : #Object,
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 2/28/2017 09:30'
}

{
	#category : #predicate,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickPredicate>>popup: aPopupBrick event: anEvent [
	"Return true if predicate is activated based on a given popup and event"
	<return: #Boolean>

	self subclassResponsibility
]
