"
I'm a style module related to tab label
"
Class {
	#name : #GLMBrickTabLabelThemer,
	#superclass : #GLMBrickThemerModule,
	#category : #Glamour-Morphic-Brick-Theme,
	#timestamp : 'AliakseiSyrel 3/21/2015 19:44'
}

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelThemer>>normalBackgroundStyleFor: aBrick [

	^ Smalltalk ui theme tabLabelNormalFillStyleFor: aBrick
]

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelThemer>>normalBorderStyleFor: aBrick [

	^ Smalltalk ui theme tabLabelNormalBorderStyleFor: aBrick
]

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelThemer>>normalStyleFor: aBrick [

	aBrick fillStyle: (self normalBackgroundStyleFor: aBrick).
	aBrick borderStyle: (self normalBorderStyleFor: aBrick)
]

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelThemer>>selectedBackgroundStyleFor: aBrick [

	^ Smalltalk ui theme tabLabelSelectedFillStyleFor: aBrick
]

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelThemer>>selectedBorderStyleFor: aBrick [

	^ Smalltalk ui theme tabLabelSelectedBorderStyleFor: aBrick
]

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelThemer>>selectedStyleFor: aBrick [

	aBrick fillStyle: (self selectedBackgroundStyleFor: aBrick).
	aBrick borderStyle: (self selectedBorderStyleFor: aBrick)
]
