"

"
Class {
	#name : #DADependencyCheckerTest,
	#superclass : #TestCase,
	#instVars : [
		'checker'
	],
	#category : #Tool-DependencyAnalyser-Test,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
DADependencyCheckerTest>>setUp [
	checker := DADependencyChecker new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DADependencyCheckerTest>>testShouldGetDirectDependencies [
	self 	
		assert: (checker dependenciesOf: 'Tool-DependencyAnalyser-Test-Data')
		equals: #(#Kernel)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DADependencyCheckerTest>>testShouldGetUnresolvedDependencies [
	| result |
	
	result := (checker unresolvedDependenciesOf: 'Tool-DependencyAnalyser-Test-Data').
	
	self 	
		assert: result size
		equals: 1.
		
	self assert: ((result at: #collect:as:) includesAll: #(#'GT-Spotter' #'Collections-Abstract')).
	
]
