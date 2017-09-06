"
SUnit tests for class PreorderGuide
"
Class {
	#name : #PreorderGuideTest,
	#superclass : #GuideTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:44'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PreorderGuideTest>>testAll [
	guide := PreorderGuide for: self.
	guide show: (filesystem / 'alpha').
	self assertVisitedIs: #(
			'alpha'
			'beta'
			'delta'
			'gamma'
			'epsilon'
			'zeta'
		)
]
