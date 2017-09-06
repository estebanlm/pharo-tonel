"

"
Class {
	#name : #GLMBrickMorphWrapper,
	#superclass : #GLMBrickGeneralWrapper,
	#category : #Glamour-Morphic-Brick-Layouts-Utils,
	#timestamp : ''
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickMorphWrapper>>hState [

	^ GLMBrickLayoutDummState new
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickMorphWrapper>>isBrick [

	^ false
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickMorphWrapper>>subbricks [

	^ self brick submorphs
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickMorphWrapper>>vState [

	^ GLMBrickLayoutDummState new
]
