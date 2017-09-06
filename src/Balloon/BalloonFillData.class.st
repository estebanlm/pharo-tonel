"
This class is a simulation of the code that's run by the Balloon engine. For debugging purposes only.
"
Class {
	#name : #BalloonFillData,
	#superclass : #Object,
	#instVars : [
		'index',
		'minX',
		'maxX',
		'yValue',
		'source',
		'destForm'
	],
	#category : #Balloon-Simulation,
	#timestamp : '<historical>'
}

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>computeFill [
	(destForm isNil or:[destForm width < self width]) ifTrue:[
		destForm := Form extent: (self width + 10) @ 1 depth: 32.
	].
	source computeFillFrom: minX to: maxX at: yValue in: destForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>destForm [
	^destForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>destForm: aForm [
	destForm := aForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>index [
	^index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>index: anInteger [
	index := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>maxX [
	^maxX
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>maxX: anInteger [
	maxX := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>minX [
	^minX
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>minX: anInteger [
	minX := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>source [
	^source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>source: anObject [
	source := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>width [
	^maxX - minX
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>yValue [
	^yValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonFillData>>yValue: anInteger [
	yValue := anInteger
]
