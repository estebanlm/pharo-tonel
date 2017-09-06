"
I am a special upward popup layout.
I make sure that content is above the trigger brick
"
Class {
	#name : #GLMPopupBrickUpwardLayout,
	#superclass : #GLMPopupBrickLayout,
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 3/8/2017 12:14'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickUpwardLayout>>build: aPopup trigger: aTriggerBrick content: aContentBrick [

	aPopup removeAllBricks.
	aPopup contentBrick: aContentBrick.
	aPopup triggerBrick: aTriggerBrick
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickUpwardLayout>>open: aPopupBrick with: aRectangle [
	"In case of downward direction we want popup's content to be below trigger brick"

	^ aPopupBrick openAbove: aRectangle
]
