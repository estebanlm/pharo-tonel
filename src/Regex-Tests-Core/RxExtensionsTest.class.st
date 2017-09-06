"

"
Class {
	#name : #RxExtensionsTest,
	#superclass : #TestCase,
	#category : #Regex-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxExtensionsTest>>testSplitJoinBoundaryCases [
	"Empty splitter, joiner or sequence."
	self assert: ('' join: ('.' asRegex split: '')) equals: ''. "NB: Doesn't work with empty regex"
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxExtensionsTest>>testSplitStringOnRegex [
	self assert: ('foobar' splitOn: '[aeiou]+' asRegex)
		equals: #('f' 'b' 'r') asOrderedCollection
]
