"

"
Class {
	#name : #GLMBrickDarkThemer,
	#superclass : #GLMBrickThemer,
	#category : #Glamour-Morphic-Brick-Theme,
	#timestamp : ''
}

{
	#category : #theme-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>actionThemer [

	^ GLMActionBrickDarkThemer new
]

{
	#category : #brick-button,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>buttonBackgroundColor [

	^ Color veryDarkGray lighter
]

{
	#category : #brick-button,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>buttonPressedColor [

	^ self backgroundColor whiter
]

{
	#category : #brick-button,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>buttonSelectedColor [

	^ Color veryDarkGray lighter slightlyDarker
]

{
	#category : #brick-checkbox,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>checkboxBorderColor [

	^ Color lightGray
]

{
	#category : #brick,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>contentBackgroundColor [

	^ Color darkGray darker
]

{
	#category : #brick-scrollbar,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>scrollbarColor [

	^ Color black alpha: 0.5
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>tabLabelThemer [

	^ self
		registerModule: GLMBrickTabLabelDarkThemer new
]

{
	#category : #brick,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>textColor [

	^ self color whiten
]

{
	#category : #brick,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>textSecondaryColor [

	^ Color white
]
