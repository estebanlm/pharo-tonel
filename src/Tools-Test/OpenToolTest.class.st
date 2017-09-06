"
SUnit tests for opening of tools
"
Class {
	#name : #OpenToolTest,
	#superclass : #UITestCase,
	#category : #Tools-Test-Base,
	#timestamp : 'TorstenBergmann 2/4/2014 20:46'
}

{
	#category : #'test inspect',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testInspectArray [
	| inspector |
	inspector := (1 to: 1000) asArray inspector.
	inspector changed.
	inspector close.
]

{
	#category : #'test inspect',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testInspectClass [
	| inspector |
	inspector := Object inspector.
	inspector changed.
	inspector close.
]

{
	#category : #'test inspect',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testInspectDictionary [
	| inspector |
	inspector := (Dictionary new) inspector.
	inspector changed.
	inspector close.
]

{
	#category : #'test inspect',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testInspectInteger [
	| inspector |
	inspector := 1 inspector.
	inspector changed.
	inspector close.
]

{
	#category : #'test inspect',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testInspectTraitClass [
	| inspector |
	inspector := TBehavior inspector.
	inspector changed.
	inspector close.
]

{
	#category : #'test browse',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testOpenBrowseOnClass [
	| browser |
	browser := Object browse.
	browser changed.
	browser close.
]

{
	#category : #'test browse',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testOpenBrowseOnInstalledTraitMethod [
	| browser |
	browser := (Class>>#hasClassSide) browse.
	browser changed.
	browser close.
]

{
	#category : #'test browse',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testOpenBrowseOnMethod [
	| browser |
	browser := (Object>>#yourself) browse.
	browser changed.
	browser close.
]

{
	#category : #'test browse',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testOpenBrowseOnTraitMethod [
	| browser |
	browser := (TBehavior>>#name) browse.
	browser changed.
	browser close.
]

{
	#category : #'test senders',
	#timestamp : ' 8/31/2017 05:26:47'
}
OpenToolTest>>testSendersOfAt [
	| senders |
	senders := SystemNavigation default browseAllSendersOf: #name.
	senders changed.
	senders close.
]
