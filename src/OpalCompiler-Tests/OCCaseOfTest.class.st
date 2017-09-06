"

"
Class {
	#name : #OCCaseOfTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-FromOld,
	#timestamp : ''
}

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCaseOfTest>>compile: source [
	^OpalCompiler new 
		class: self class; 
		source: source; 
		compile
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCaseOfTest>>testCaseOfEffect [
	| temp |
	
	#case1 caseOf: {
		[#case1]->[ temp := 1 ].
 		[#case2]->[ temp := 2 ] }.
	self assert: temp equals: 1.
	
	#case2 caseOf: {
		[#case1]->[ temp := 1 ].
 		[#case2]->[ temp := 2 ] }.
	self assert: temp equals: 2.
	
	self should: [ 
		#case3 caseOf: {
			[#case1]->[ 1 ].
 			[#case2]->[ 2 ] }
		] raise: Error
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCaseOfTest>>testCaseOfOtherwiseEffect [
	| temp |
	
	#case1 
		caseOf: {
			[#case1]->[ temp := 1 ].
 			[#case2]->[ temp := 2 ] }
		otherwise: [ temp := 3 ].
	self assert: temp equals: 1.
	
	#case2
		caseOf: {
			[#case1]->[ temp := 1 ].
 			[#case2]->[ temp := 2 ] }
		otherwise: [ temp := 3 ].
	self assert: temp equals: 2.
	
	#case3 
		caseOf: {
			[#case1]->[ temp := 1 ].
 			[#case2]->[ temp := 2 ] }
		otherwise: [ temp := 3 ].
	self assert: temp equals: 3
	
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCaseOfTest>>testCaseOfOtherwiseValue [
	| temp |
	
	temp := #case1 
		caseOf: {
			[#case1]->[ 1 ].
 			[#case2]->[ 2 ] }
		otherwise: [ 3 ].
	self assert: temp equals: 1.
	
	temp := #case2
		caseOf: {
			[#case1]->[ 1 ].
 			[#case2]->[ 2 ] }
		otherwise: [ 3 ].
	self assert: temp equals: 2.
	
	temp := #case3 
		caseOf: {
			[#case1]->[ 1 ].
 			[#case2]->[ 2 ] }
		otherwise: [ 3 ].
	self assert: temp equals: 3
	
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCaseOfTest>>testCaseOfValue [
	| temp |
	
	temp := #case1 caseOf: {
		[#case1]->[ 1 ].
 		[#case2]->[ 2 ] }.
	self assert: temp equals: 1.
	
	temp := #case2 caseOf: {
		[#case1]->[ 1 ].
 		[#case2]->[ 2 ] }.
	self assert: temp equals: 2.
	
	self should: [ 
		temp := #case3 caseOf: {
			[#case1]->[ 1 ].
 			[#case2]->[ 2 ] }
		] raise: Error

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCaseOfTest>>testCompilationError [
	self should: [ self compile: 'methodPattern 1 caseOf: { }' ] raise: SyntaxErrorNotification.
	self should: [ self compile: 'methodPattern 1 caseOf: { } otherwise: [ 42 ]' ] raise: SyntaxErrorNotification.
]
