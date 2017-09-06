"

"
Class {
	#name : #GLMPagerMorphTest,
	#superclass : #TestCase,
	#instVars : [
		'pagerModel',
		'pagerMorph',
		'window'
	],
	#category : #Glamour-Tests-Morphic,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerMorphTest>>buttonsMorphs [

	^ pagerMorph subbricks second subbricks second subbricks
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerMorphTest>>createSimplePaneMorph [

	^ Morph new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerMorphTest>>openInWindow [

	window := pagerMorph asBrickedMorph openInWindow 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerMorphTest>>panesMorphs [

	^ pagerMorph subbricks first subbricks first subbricks
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerMorphTest>>setUp [

	pagerModel := GLMPagerModel new.
	pagerMorph := GLMPagerBrick new
		pagerModel: pagerModel
		yourself.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerMorphTest>>tearDown [

	window ifNotNil: [ window delete ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerMorphTest>>testPushPanesAfterOpen [

	pagerModel pushPane: self createSimplePaneMorph smooth: false.
	self openInWindow.
	pagerModel pushPane: self createSimplePaneMorph smooth: false.
	pagerModel pushPane: self createSimplePaneMorph smooth: false.
	
	self assert: pagerModel size equals: 3.
	self assert: self panesMorphs size equals: 3.
	self assert: self buttonsMorphs size equals: 3.
	
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerMorphTest>>testPushPanesBeforeOpen [

	pagerModel pushPane: self createSimplePaneMorph smooth: false.
	pagerModel pushPane: self createSimplePaneMorph smooth: false.
	pagerModel pushPane: self createSimplePaneMorph smooth: false.

	self openInWindow.
	
	self assert: pagerModel size equals: 3.
	self assert: self panesMorphs size equals: 3.
	self assert: self buttonsMorphs size equals: 3.
	
	

]
