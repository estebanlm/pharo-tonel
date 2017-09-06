Extension {
	#name : #LogicalFont
}

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
LogicalFont>>asFreetypeFont [
	^ self realFont asFreetypeFont
]

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
LogicalFont>>getGlyphWidth: aCharacter  [
	^ self realFont getGlyphWidth: aCharacter
]

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
LogicalFont>>getPreciseAscent [
	^ self realFont getPreciseAscent
]

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
LogicalFont>>getPreciseDescent [
	^ self realFont getPreciseDescent
]

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
LogicalFont>>getPreciseHeight [
	^ self realFont getPreciseHeight
]

{
	#category : #'*Athens-Text',
	#timestamp : ' 8/31/2017 05:26:39'
}
LogicalFont>>glyphRendererOn: anAthensBalloonSurface  [
	^ self realFont glyphRendererOn: anAthensBalloonSurface
]
