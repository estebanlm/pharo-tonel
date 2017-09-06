"
A ChangesBrowserTest is a test class for testing the behavior of ChangesBrowser
"
Class {
	#name : #ChangesBrowserTest,
	#superclass : #TestCase,
	#instVars : [
		'browser'
	],
	#category : #NautilusRefactoring-Tests,
	#timestamp : '<historical>'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowserTest>>setUp [
	browser := ChangesBrowser new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowserTest>>testBuildDiffFor [
	self assert: (browser buildDiffFor: nil) equals: ''
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowserTest>>testChanges [
	| aCollection |
	aCollection := {RBRefactoryChange new}.
	browser changes: aCollection.
	self assert: browser changes equals: aCollection
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowserTest>>testInitializeWidgets [
	self assert: browser changesTree isNotNil.
	self assert: browser textArea isNotNil.
	self
		assertCollection: browser focusOrder
		equals:
			{browser changesTree.
			browser textArea} asOrderedCollection
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowserTest>>testPickedChanges [
	self assert: browser pickedChanges isEmpty
]
