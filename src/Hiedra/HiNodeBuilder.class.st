"
I know how to build ruler nodes.
"
Class {
	#name : #HiNodeBuilder,
	#superclass : #HiBuilder,
	#instVars : [
		'color',
		'width'
	],
	#category : #Hiedra-Builders,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodeBuilder>>color [
	
	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodeBuilder>>color: anObject [
	
	color := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodeBuilder>>initialize [

	super initialize.

	width := 4.7.
	color := Smalltalk ui theme textColor.

]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodeBuilder>>renderer [
	^ HiNodeRenderer new
		nodeBuilder: self;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodeBuilder>>width [
	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodeBuilder>>width: anObject [
	
	width := anObject
]
