"

"
Class {
	#name : #ReflectivityTest,
	#superclass : #TestCase,
	#instVars : [
		'count',
		'tag',
		'link',
		'link2'
	],
	#category : #Reflectivity-Tests,
	#timestamp : ''
}

{
	#category : #tagging,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityTest>>increase [
	count ifNil: [ count := 0 ].
	count := count + 1.
]

{
	#category : #tagging,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityTest>>tagExec [
	tag := #yes
]

{
	#category : #tagging,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityTest>>tagExec: aTag [
	tag := aTag
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityTest>>tearDown [
	link ifNotNil: [link uninstall].
	link2 ifNotNil: [link2 uninstall].
	tag := nil.
	count := 0.
	(ReflectivityExamples>>#exampleWithArg:)  recompile
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityTest>>testTwoLinksUnstallOne [
	| node instance |
	node := (ReflectivityExamples>>#exampleWithArg:) ast.
	link := MetaLink new 
		metaObject: self; 
		selector: #increase.
		
	link2 := MetaLink new 
		metaObject: self; 
		selector: #increase.
		
	node link: link.
	node link: link2.
	self assert: (ReflectivityExamples>>#exampleWithArg:) class = ReflectiveMethod.
	instance := ReflectivityExamples new.
	self assert: ((instance exampleWithArg: 3) = 5).
	self assert: (count = 2 ).
	
	node removeLink: link2.
	self assert: ((instance exampleWithArg: 3) = 5).
	self assert: (count = 3).
]
