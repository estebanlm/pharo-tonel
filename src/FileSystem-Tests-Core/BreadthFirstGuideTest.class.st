"
SUnit tests for class BreadthFirstGuide
"
Class {
	#name : #BreadthFirstGuideTest,
	#superclass : #GuideTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:43'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
BreadthFirstGuideTest>>testAll [
	guide := BreadthFirstGuide for: self.
	guide show: (filesystem / 'alpha').
	self assertVisitedIs: #(
			'alpha'
			'beta'
			'epsilon'
			'delta'
			'gamma'
			'zeta'
		)
]
