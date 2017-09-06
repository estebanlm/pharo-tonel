"
A GLMScrollListBrickTest is a test class for testing the behavior of GLMScrollListBrick
"
Class {
	#name : #GLMScrollListBrickTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #Glamour-Morphic-Brick-Tests,
	#timestamp : '<historical>'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
GLMScrollListBrickTest>>tearDown [
	window ifNotNil: [ :aWindow | aWindow delete ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
GLMScrollListBrickTest>>testDifferentHeights [
	window := GLMScrollListBrick exampleDifferentHeights.
	self assert: window isSystemWindow
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
GLMScrollListBrickTest>>testEmptyList [
	window := GLMScrollListBrick exampleEmptyCollection.
	self assert: window isSystemWindow
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
GLMScrollListBrickTest>>testExample [
	window := GLMScrollListBrick example.
	self assert: window isSystemWindow
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
GLMScrollListBrickTest>>testInfinity [
	window := GLMScrollListBrick exampleInfinity.
	self assert: window isSystemWindow
]
