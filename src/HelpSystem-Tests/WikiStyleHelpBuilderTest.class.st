"
SUnit tests for class WikiStyleHelpBuilder
"
Class {
	#name : #WikiStyleHelpBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #HelpSystem-Tests-Builders,
	#timestamp : 'TorstenBergmann 2/4/2014 21:19'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
WikiStyleHelpBuilderTest>>defaultTestClass [
	^WikiStyleHelpBuilder
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
WikiStyleHelpBuilderTest>>setUp [
	super setUp.
	builder := self defaultTestClass new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
WikiStyleHelpBuilderTest>>testDefaultSyntaxAlwaysPier [
	self assert: builder defaultSyntax == #pier
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
WikiStyleHelpBuilderTest>>testExtractHelpContentsFromMarkedString [
	|content|
	content := builder extractHelpContentFromString: 'outer<help>inner</help>outer'.
	self assert: content = 'inner'.
	
]
