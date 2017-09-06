"

"
Class {
	#name : #EpFilterTest,
	#superclass : #TestCase,
	#category : #EpiceaBrowsersTests-Filters,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>assert: aFilter accepts: anEvent rejects: anotherEvent [
	self assert: (aFilter accepts: anEvent).
	self deny: (aFilter accepts: anotherEvent).
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>classAddition [
	^ self entryWith: (EpClassAddition class: Object)
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>diverseEvents [
	^ {
		self classAddition.
		self expressionEvaluation.
		self methodAddition.
		self redo.
		self refactoring.
		}
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>entryWith: anEvent [
	^ OmEntry content: anEvent
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>expressionEvaluation [
	^ self entryWith: (EpExpressionEvaluation expression: '42')
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>methodAddition [
	^ self entryWith: (EpMethodAddition method: Object >> #printOn:)
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>redo [
	^ self entryWith: (EpRedo forAll: #())
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>refactoring [
	^ self entryWith: (EpRenameClassRefactoring rename: Object to: #Object42)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>testAnd [
	| aFilter |
	aFilter := EpAndFilter withAll: { 
		EpPluggableFilter codeChangeFilter. 
		EpPluggableFilter methodFilter }.
	
	self 
		assert: aFilter
		accepts: self methodAddition
		rejects: self classAddition
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>testEquality [
	self 
		assert: EpPluggableFilter methodFilter
		equals: EpPluggableFilter methodFilter.
	
	self 
		assert: (EpOrFilter withAll: EpPluggableFilter allFilters)
		equals: (EpOrFilter withAll: EpPluggableFilter allFilters).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>testLogBrowserOperation [
	self
		assert: EpPluggableFilter logBrowserOperationFilter
		accepts: self redo
		rejects: self methodAddition
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>testMethod	 [
	self 
		assert: EpPluggableFilter methodFilter
		accepts: self methodAddition
		rejects: self classAddition
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpFilterTest>>testNoTrigger [
	| expressionEvaluationWithTrigger |
	expressionEvaluationWithTrigger := self classAddition.
	expressionEvaluationWithTrigger tags 
		at: EpLog triggererReferenceKey 
		put: (OmReference globalName: 'test' localName: '1').
				
	self
		assert: EpPluggableFilter noTriggerFilter
		accepts: self classAddition
		rejects: expressionEvaluationWithTrigger
]
