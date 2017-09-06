"
I am activated when user clicks outside of a popup
"
Class {
	#name : #GLMPopupBrickOutisideClickPredicate,
	#superclass : #GLMPopupBrickPredicate,
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 2/28/2017 09:40'
}

{
	#category : #predicate,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickOutisideClickPredicate>>popup: aPopupBrick event: anEvent [
	"Return true when user clicks outside of a popup brick, false otherwise"
	<return: #Boolean>

	^ (anEvent type = #mouseDown) and: [
		(aPopupBrick isInsideOfPopupBrick: anEvent) not ]
]
