"
SUnit tests for class PostorderGuide
"
Class {
	#name : #PostorderGuideTest,
	#superclass : #GuideTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:43'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PostorderGuideTest>>testAll [
	guide := PostorderGuide for: self.
	guide show: (filesystem / 'alpha').
	self assertVisitedIs: #(
			'delta'
			'gamma'
			'beta'
			'zeta'
			'epsilon'
			'alpha'
		)
]
