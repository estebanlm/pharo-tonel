"
should: will be deprecated sooner or leater. Use assert: instead
"
Class {
	#name : #ShouldTransformedIntoAssert,
	#superclass : #ReNodeRewriteRule,
	#category : #SUnit-Rules,
	#timestamp : 'YuriyTymchuk 3/31/2016 17:05'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ShouldTransformedIntoAssert class>>uniqueIdentifierName [
	
	^'ShouldTransformedIntoAssert'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ShouldTransformedIntoAssert>>group [

	^ 'SUnit'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ShouldTransformedIntoAssert>>initialize [
	super initialize.

	self
		replace: 'self should: [ ``@object1 ]'
		with: 'self assert: ``@object1'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ShouldTransformedIntoAssert>>name [

	^ 'Use assert: instead of should:'
]
