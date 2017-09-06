"
SUnit tests for tutorial player
"
Class {
	#name : #TutorialPlayerTestTutorialAccessor,
	#superclass : #TestCase,
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:53'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TutorialPlayerTestTutorialAccessor>>testDefaultsToSmalltalkSyntaxTutorial [
	| player |
	player := TutorialPlayer new.
	self assert: (player tutorial isKindOf: PharoSyntaxTutorial).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TutorialPlayerTestTutorialAccessor>>testWithMockTutorial [
	| mockTutorial player |
	mockTutorial := MockTutorial new.
	player := TutorialPlayer new tutorial: mockTutorial; yourself.
	self assert: player tutorial equals: mockTutorial.
]
