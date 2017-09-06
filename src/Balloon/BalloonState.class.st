"
This class is a repository for data which needs to be preserved during certain operations of BalloonCanvas.
"
Class {
	#name : #BalloonState,
	#superclass : #Object,
	#instVars : [
		'transform',
		'colorTransform',
		'aaLevel'
	],
	#category : #Balloon-Engine,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonState>>aaLevel [
	^aaLevel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonState>>aaLevel: aNumber [
	aaLevel := aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonState>>colorTransform [
	^colorTransform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonState>>colorTransform: aColorTransform [
	colorTransform := aColorTransform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonState>>transform [
	^transform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonState>>transform: aMatrixTransform [
	transform := aMatrixTransform
]
