"

"
Class {
	#name : #GLMBrickGeneralWrapper,
	#superclass : #Object,
	#instVars : [
		'brick'
	],
	#category : #Glamour-Morphic-Brick-Layouts-Utils,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper class>>on: aBrick [

	^ self new brick: aBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>brick [

	^ brick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>brick: aBrick [

	brick := aBrick
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>changed [

	^ self brick changed
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>hState [

	^ self layout hState
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>isBrick [

	^ self brick isBrick
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>layout [

	^ self brick layoutProperties
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>layoutPolicy [

	^ self brick layoutPolicy
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>owner [

	^ self brick owner ifNotNil: #brickApi
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>subbricks [

	^ self brick subbricks collect:  #brickApi
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickGeneralWrapper>>vState [

	^ self layout vState
]
