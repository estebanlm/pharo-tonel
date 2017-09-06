"

"
Class {
	#name : #NewValueHolderTest,
	#superclass : #TestCase,
	#category : #NewValueHolder-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolderTest>>testChange [
	| valueHolder fired |
	valueHolder := 'word' asValueHolder.
	self assert: valueHolder value equals: 'word'.
	fired := false.
	valueHolder whenChangedDo: [ fired := true ].
	valueHolder value: 'new'.
	self assert: fired.
	self assert: valueHolder value equals: 'new'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:15'
}
NewValueHolderTest>>testValuesInBlock [
	| valueHolder old new ann |
	valueHolder := 'old' asValueHolder.
	valueHolder
		whenChangedDo: [ :newValue :oldValue :a | 
			new := newValue.
			old := oldValue.
			ann := a ].
	valueHolder value: 'new'.
	self assert: old equals: 'old'.
	self assert: new equals: 'new'.
	self assert: (ann isMemberOf: ValueChanged)
]
