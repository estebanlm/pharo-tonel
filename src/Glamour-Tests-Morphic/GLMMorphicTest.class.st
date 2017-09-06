"

"
Class {
	#name : #GLMMorphicTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #Glamour-Tests-Morphic,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>find: aClass in: aMorph [
	"Explores aMorph hierarchy of sub morphs to find a morph whose class inherits from aClass"
	^ self findSatisfying: [:morph | morph isKindOf: aClass ] in: aMorph  
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>findLast: aClass in: aMorph [
	"Explores aMorph hierarchy of sub morphs to find the last morph whose class inherits from aClass"
	^ self findLastSatisfying: [:morph | morph isKindOf: aClass ] in: aMorph  
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>findLastSatisfying: aBlock in: aMorph [
	"Explores aMorph hierarchy of sub morphs to find the last morph who satisfies aBlock"
	| lastMatch |
	lastMatch := nil. 
	aMorph allMorphsDo: [:each | (aBlock value: each) ifTrue: [lastMatch := each]].
	^ lastMatch ifNil: [self fail]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>findSatisfying: aBlock in: aMorph [
	"Explores aMorph hierarchy of sub morphs to find a morph who satisfies aBlock"
	aMorph allMorphsDo: [:each | (aBlock value: each) ifTrue: [^ each]].
	self fail.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>findWherePresentationIs: aPresentation in: aMorph [
	"Explores aMorph hierarchy of sub morphs to find a morph whose model is exactly aModel"
	^ self findSatisfying: 
				[:morph | morph model notNil 
					and: [(morph model respondsTo: #glamourPresentation) 
					and: [morph model glamourPresentation == aPresentation]] ]
			in: aMorph  
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>repeatAssert: aBlock equals: aResult [

	self assert: (self wait: 0.5 until: aBlock evaluatesTo: aResult)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>send: treeMorph doubleClickWithShift: aBoolean onItem: treeNodeMorph [
	| event |
	event:= MouseButtonEvent basicNew 
		setType: #mouseDown
		position: (treeNodeMorph bounds origin + (1@1))
		which: 4
		buttons: (aBoolean ifTrue: [8] ifFalse: [0])
		hand: (HandMorph new mouseFocus: treeNodeMorph; yourself)
		stamp: nil.
	treeMorph doubleClick: event
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>send: treeMorph mouseDownWithShift: aBoolean onItem: treeNodeMorph [
	| mouseUp |
	mouseUp := MouseButtonEvent basicNew 
		setType: #mouseDown
		position: (treeNodeMorph bounds origin + (1@1))
		which: 4
		buttons: (aBoolean ifTrue: [8] ifFalse: [0])
		hand: (HandMorph new mouseFocus: treeNodeMorph; yourself)
		stamp: nil.
	treeMorph mouseUp: mouseUp onMorph: treeNodeMorph.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>send: treeMorph mouseUpOnItem: treeNodeMorph [
	^ self send: treeMorph mouseUpWithShift: false onItem: treeNodeMorph
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>send: treeMorph mouseUpWithShift: aBoolean onItem: treeNodeMorph [
	| mouseUp |
	mouseUp := MouseButtonEvent basicNew 
		setType: #mouseUp
		position: (treeNodeMorph bounds origin + (1@1))
		which: 4
		buttons: (aBoolean ifTrue: [8] ifFalse: [0])
		hand: (HandMorph new mouseFocus: treeNodeMorph; yourself)
		stamp: nil.
	treeMorph listManager mouseUp: mouseUp on: treeNodeMorph.
]

{
	#category : #'setup - tear down',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>tearDown [
	window ifNotNil: [window delete]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTest>>wait: maxWaitSeconds until: validateBlock evaluatesTo: expectedResult [
	"Evaluate validateBlock until it returns expectedResult or 
maxWaitSeconds have passed,
	 pausing between evaluations.  Return the last result of validateBlock 
value"

	| startTime result |
	startTime := Time millisecondClockValue // 1000.
	[result := validateBlock value = expectedResult] whileFalse:
			[Time secondClock - startTime > maxWaitSeconds ifTrue: [^result].
			(Delay forMilliseconds: 50) wait].
	^ result

]
