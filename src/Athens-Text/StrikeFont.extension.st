Extension {
	#name : #StrikeFont
}

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
StrikeFont>>asAthensFontDescription [
	^ AthensFontDescription new family: self familyName; fontSize: self pointSize.

]

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
StrikeFont>>asFreetypeFont [

		self error: 'not supported yet. and ever'
]

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
StrikeFont>>getPreciseAscent [
	^ self ascent
]

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
StrikeFont>>glyphRendererOn: anAthensSurface [

	^ anAthensSurface getStrikeFontRendererFor: self

]
