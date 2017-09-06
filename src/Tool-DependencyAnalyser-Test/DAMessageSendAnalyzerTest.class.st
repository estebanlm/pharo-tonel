"

"
Class {
	#name : #DAMessageSendAnalyzerTest,
	#superclass : #TestCase,
	#instVars : [
		'analyzer'
	],
	#category : #Tool-DependencyAnalyser-Test,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAMessageSendAnalyzerTest>>setUp [
	analyzer := DAMessageSendAnalyzer on: 'Tool-DependencyAnalyser-Test-Data'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAMessageSendAnalyzerTest>>testShouldFindDependencyWhenUnimplementedCalls [
	self 
		assert: analyzer missingMethods size 
		equals: 2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAMessageSendAnalyzerTest>>testShouldGetPotentialMatchForUnimplementedCalls [
	self 
		assert: (analyzer missingMethodsWithPotentialMatch values collect: #size)
		equals: #(0 2).
	self 
		assert: (analyzer missingMethodsWithPotentialMatchAfterManuallyResolvedDependenciesAddition values collect: #size)
		equals: #(0 2)
]
