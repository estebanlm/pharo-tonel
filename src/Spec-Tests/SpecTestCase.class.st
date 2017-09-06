"
I am an abstract test for Spec widgets.

I use classToTest to initialize an instance. And I can keep the created windows in a variable that I clean after tests.

I provide openInstance and openInstance: to open it. These methods make me keep the created window in the variable.

- testOpenWithSpec tests a call at openWhitSpec, it test the minimal use but can fail in some widgets needing to be initialized.
- testExample tests the class side method example if exist, example should be a representative use.
"
Class {
	#name : #SpecTestCase,
	#superclass : #TestCase,
	#instVars : [
		'window',
		'testedInstance'
	],
	#category : #Spec-Tests-Utils,
	#timestamp : 'Spirita 7/28/2016 11:10'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase class>>isAbstract [
	^ self name = #SpecTestCase
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase class>>shouldInheritSelectors [
	^ true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase>>classToTest [
	self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase>>initializeTestedInstance [

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase>>openInstance [
	window := testedInstance openWithSpec
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase>>openInstance: aLayoutSelector [
	window := testedInstance openWithSpec: aLayoutSelector
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase>>setUp [
	testedInstance := self classToTest new.
	self initializeTestedInstance
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase>>tearDown [
	super tearDown.
	window ifNotNil: [ window delete ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase>>testExample [
	[window := self classToTest example] on: MessageNotUnderstood do: [  ] 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecTestCase>>testOpenWithSpec [
	self openInstance
]
