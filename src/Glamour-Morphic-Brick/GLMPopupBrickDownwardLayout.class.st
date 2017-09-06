"
I am a special downward popup layout.
I make sure that content is below the trigger brick
"
Class {
	#name : #GLMPopupBrickDownwardLayout,
	#superclass : #GLMPopupBrickLayout,
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 3/8/2017 12:14'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickDownwardLayout>>build: aPopup trigger: aTriggerBrick content: aContentBrick [

	aPopup removeAllBricks.
	aPopup triggerBrick: aTriggerBrick.
	aPopup contentBrick: aContentBrick
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickDownwardLayout>>open: aPopupBrick with: aRectangle [
	"In case of downward direction we want popup's content to be below trigger brick"

	^ aPopupBrick openBelow: aRectangle
]
