"
SUnit tests for PharoSyntaxTutorial
"
Class {
	#name : #PharoSyntaxTutorialTest,
	#superclass : #TestCase,
	#traits : 'TTutorialTest',
	#classTraits : 'TTutorialTest classTrait',
	#category : #ProfStef-Tests,
	#timestamp : 'CamilloBruni 2/22/2014 18:58'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoSyntaxTutorialTest>>testDivideTwoByZeroSignalsZeroDivide [
	[self testedTutorial divideTwoByZero.
	self fail] 
	on: ZeroDivide 
	do: []
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoSyntaxTutorialTest>>testEachSelectorExists [
	self testedTutorial tutorial do: [:aSelector|
		self assert: (self testedTutorial respondsTo: aSelector) 
	]
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoSyntaxTutorialTest>>testedTutorial [
	"Returns an instance of an AbstractTutorial subclass"
	^ PharoSyntaxTutorial new
]
