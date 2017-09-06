"
I am activated when user presses `Escape` key
"
Class {
	#name : #GLMPopupBrickEscPredicate,
	#superclass : #GLMPopupBrickPredicate,
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 3/1/2017 13:57'
}

{
	#category : #predicate,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickEscPredicate>>popup: aPopupBrick event: anEvent [
	"Return true when user presses escape key, false otherwise"
	<return: #Boolean>

	^ (anEvent type == #keystroke) and: [ 
			anEvent keyCharacter = Character escape ]
]
