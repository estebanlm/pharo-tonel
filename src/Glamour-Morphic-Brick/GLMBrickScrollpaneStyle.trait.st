"
I'm a style module related to a scrollpane and its component. 
"
Trait {
	#name : #GLMBrickScrollpaneStyle,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Glamour-Morphic-Brick-Theme,
	#timestamp : 'AliakseiSyrel 1/30/2015 11:04'
}

{
	#category : #brick-scrollbar,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickScrollpaneStyle>>scrollbarColor [

	^ Color lightGray alpha: 0.5
]

{
	#category : #brick-scrollbar,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickScrollpaneStyle>>scrollbarCornerRadius [

	^ 0
]

{
	#category : #brick-scrollbar,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickScrollpaneStyle>>scrollbarOffset [

	^ 1
]

{
	#category : #brick-scrollbar,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickScrollpaneStyle>>scrollbarPosition [

	^ #right
]

{
	#category : #brick-scrollbar,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickScrollpaneStyle>>scrollbarWidth [

	^ 3
]

{
	#category : #brick-scrollpane,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickScrollpaneStyle>>scrollpaneBackgroundColor [

	^ self contentBackgroundColor
]
