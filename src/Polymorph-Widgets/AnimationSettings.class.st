"
Animation settings
"
Class {
	#name : #AnimationSettings,
	#superclass : #Model,
	#instVars : [
		'useAnimation',
		'animateClosing',
		'delay',
		'numberOfSteps'
	],
	#category : #Polymorph-Widgets-Themes,
	#timestamp : 'TorstenBergmann 2/5/2014 10:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AnimationSettings>>animateClosing [
	^ animateClosing ifNil: [animateClosing := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AnimationSettings>>animateClosing: aBoolean [
	animateClosing := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AnimationSettings>>delay [
	^ delay ifNil: [delay := 8]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AnimationSettings>>delay: anInteger [
	delay := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AnimationSettings>>numberOfSteps [
	^ numberOfSteps ifNil: [numberOfSteps := 20]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AnimationSettings>>numberOfSteps: anInteger [
	numberOfSteps := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AnimationSettings>>useAnimation [
	^ useAnimation ifNil: [useAnimation := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AnimationSettings>>useAnimation: aBoolean [
	useAnimation := aBoolean
]
