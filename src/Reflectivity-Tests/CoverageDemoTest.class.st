"

"
Class {
	#name : #CoverageDemoTest,
	#superclass : #TestCase,
	#instVars : [
		'link',
		'selector'
	],
	#category : #Reflectivity-Tests,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
CoverageDemoTest>>tearDown [
	link ifNotNil: [link uninstall].
	ReflectivityExamples recompile: selector.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
CoverageDemoTest>>testCoverageAST [
	selector := #exampleMethod.
	
	link := MetaLink new
		metaObject: #node;
		selector: #tagExecuted.

	(ReflectivityExamples>>#exampleMethod) ast nodesDo: [:node | node link: link].

	self deny: (ReflectivityExamples>>#exampleMethod) ast hasBeenExecuted.
	self assert: ReflectivityExamples new exampleMethod = 5.
	self assert: (ReflectivityExamples>>#exampleMethod) ast hasBeenExecuted.
	self assert: (ReflectivityExamples>>#exampleMethod) sendNodes first hasBeenExecuted.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
CoverageDemoTest>>testCoverageControlFlow [
	selector := #exampleIfTrueIfFalse.

	link := MetaLink new
		metaObject: #node;
		selector: #tagExecuted.
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast nodesDo: [ :node | node link: link ].
	self assert: ReflectivityExamples new exampleIfTrueIfFalse = 5.
	self deny: ((ReflectivityExamples >> #exampleIfTrueIfFalse) ast sendNodes select: [ :each | each selector = 'bar' ]) first hasBeenExecuted.
	
	self deny:  (ReflectivityExamples >> #exampleIfTrueIfFalse) blockNodes first hasBeenExecuted. self flag: #TBD. "should be true. need to implement links on optimized block bodies"
	self deny:  (ReflectivityExamples >> #exampleIfTrueIfFalse) blockNodes first body hasBeenExecuted.
	
	self assert: (ReflectivityExamples >> #exampleIfTrueIfFalse) blockNodes second hasBeenExecuted.
	self assert: (ReflectivityExamples >> #exampleIfTrueIfFalse) blockNodes second body hasBeenExecuted.
	self assert: (ReflectivityExamples >> #exampleIfTrueIfFalse) ast hasBeenExecuted.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
CoverageDemoTest>>testCoverageMethod [
	selector := #exampleMethod.
	link := MetaLink new
		metaObject: #node;
		selector: #tagExecuted.

	(ReflectivityExamples>>#exampleMethod) ast link: link.

	self deny: (ReflectivityExamples>>#exampleMethod) ast hasBeenExecuted.
	self assert: ReflectivityExamples new exampleMethod = 5.
	self assert: (ReflectivityExamples>>#exampleMethod) ast hasBeenExecuted.
]
