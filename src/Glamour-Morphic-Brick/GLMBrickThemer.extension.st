Extension {
	#name : #GLMBrickThemer
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickThemer>>color [

	^ self
		registerModule: GLMBrickColorThemer new
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickThemer>>popupEditorBorderThemer [

	^ self
		registerModule: GLMBrickPopupEditBorderThemer new
		to: self
		named: #popupThemer
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickThemer>>popupEditorShadowThemer [

	^ self
		registerModule: [ GLMBrickPopupEditShadowThemer new ]
		to: self
		named: #popupThemer
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickThemer>>popupErrorThemer [

	^ self
		registerModule: GLMBrickPopupErrorThemer new
		to: self
		named: #popupThemer
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickThemer>>popupHelpThemer [

	^ self
		registerModule: GLMBrickPopupHelpThemer new
		to: self
		named: #popupThemer
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickThemer>>popupSuccessThemer [

	^ self
		registerModule: GLMBrickPopupSuccessThemer new
		to: self
		named: #popupThemer
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickThemer>>popupThemer [

	^ self
		registerModule: GLMBrickPopupThemer new
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickThemer>>tabLabelThemer [

	^ self
		registerModule: GLMBrickTabLabelThemer new
]
