"
I'm a style module related to a string brick
"
Trait {
	#name : #GLMBrickTextStyle,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Glamour-Morphic-Brick-Theme,
	#timestamp : 'AliakseiSyrel 3/17/2015 22:47'
}

{
	#category : #brick-text,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTextStyle>>textFamilyName [

	^ Smalltalk ui theme labelFont familyName
]

{
	#category : #brick-text,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTextStyle>>textFontSize [

	^ Smalltalk ui theme labelFont pointSize
]
