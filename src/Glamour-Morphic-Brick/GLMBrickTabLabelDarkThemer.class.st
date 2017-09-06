"
I'm a style module related to tab label modified for Dark Theme
"
Class {
	#name : #GLMBrickTabLabelDarkThemer,
	#superclass : #GLMBrickTabLabelThemer,
	#category : #Glamour-Morphic-Brick-Theme,
	#timestamp : 'AliakseiSyrel 3/21/2015 19:44'
}

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelDarkThemer>>normalBorderStyleFor: aBrick [

	^ BorderStyle simple
			width: 1;
			baseColor: Color transparent
]

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelDarkThemer>>normalStyleFor: aBrick [

	super normalStyleFor: aBrick.
	aBrick padding: #(0 1).
]

{
	#category : #brick-tab-label,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickTabLabelDarkThemer>>selectedBorderStyleFor: aBrick [

	^ self normalBorderStyleFor: aBrick
]
