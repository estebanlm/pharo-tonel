"
Trait for testing tutorials
"
Trait {
	#name : #TTutorialTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #ProfStef-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:49'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TTutorialTest>>testEachSelectorExists [
	self testedTutorial tutorial do: [:aSelector|
		self assert: (self tutorial respondsTo: aSelector) 
	]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TTutorialTest>>testEachSelectorReturnsALesson [
	| answer |
	self testedTutorial tutorial do: [:aSelector|
		answer := (self testedTutorial perform: aSelector).
		self assert: (answer isKindOf: Lesson).
	]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TTutorialTest>>testLessonAtReturnsCorrespondingLesson [
	| answer |
	1 to: (self testedTutorial tutorial size) do: [:index|
		answer := self testedTutorial lessonAt: index.
		self assert: (answer isKindOf: Lesson)
	]
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TTutorialTest>>testNotEmpty [
	self assert: self testedTutorial tutorial notEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
TTutorialTest>>testSizeReturnsNumberOfSelectors [
	self assert: (self testedTutorial tutorial size) equals: self testedTutorial size.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:44'
}
TTutorialTest>>testedTutorial [
	"Returns an instance of an AbstractTutorial subclass"
	^ self explicitRequirement
]
