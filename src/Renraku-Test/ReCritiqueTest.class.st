"

"
Class {
	#name : #ReCritiqueTest,
	#superclass : #ReCodeBasedTestCase,
	#category : #Renraku-Test,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReCritiqueTest>>testBan [
	| criticToSkip |
		
	criticToSkip := testClass critiques detect: [ :critic |
		critic rule class = ScreamerRule ].
	
	criticToSkip ban.
	
	self assert: (testClass critiques noneSatisfy: [ :critic |
		critic rule class = ScreamerRule ]).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReCritiqueTest>>testBan1 [
	| criticToSkip |
	
		
	criticToSkip := testMethod critiques detect: [ :critic |
		critic rule class = ScreamerRule ].
	
	criticToSkip ban.
	
	self assert: (testMethod critiques noneSatisfy: [ :critic |
		critic rule class = ScreamerRule ]).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReCritiqueTest>>testDescription [
	| rule critic |
	
	rule := (RBLintRule allSubclasses select: #isVisible)	 anyOne new.
	critic := ReAbstractCritique for: thisContext method by: rule.
	
	self assert: critic description equals: rule rationale
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReCritiqueTest>>testRule [
	| rule critic |
	
	rule := (RBLintRule allSubclasses select: #isVisible)	 anyOne new.
	critic := ReAbstractCritique for: thisContext method by: rule.
	
	self assert: critic rule equals: rule
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReCritiqueTest>>testTarget [
	| rule critic |
	
	rule := (RBLintRule allSubclasses select: #isVisible)	 anyOne new.
	critic := ReAbstractCritique for: thisContext method by: rule.
	
	self assert: critic sourceAnchor entity equals: thisContext method
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReCritiqueTest>>testTitle [
	| rule critic |
	
	rule := (RBLintRule allSubclasses select: #isVisible)	 anyOne new.
	critic := ReAbstractCritique for: thisContext method by: rule.
	
	self assert: critic title equals: rule name
]
