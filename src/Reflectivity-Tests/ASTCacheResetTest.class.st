"

"
Class {
	#name : #ASTCacheResetTest,
	#superclass : #TestCase,
	#instVars : [
		'cache',
		'counter',
		'link',
		'node'
	],
	#category : #Reflectivity-Tests,
	#timestamp : ''
}

{
	#category : #'test material',
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTCacheResetTest>>annotatedMethod [
	^ 42
]

{
	#category : #'test material',
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTCacheResetTest>>increment [
	counter := counter + 1
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTCacheResetTest>>setUp [
	cache := ASTCache default copy.
	counter := 0.
	link := MetaLink new
		metaObject: self;
		selector: #increment.
	node := (self class >> #annotatedMethod) ast statements last value.
	node link: link
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTCacheResetTest>>tearDown [
	ASTCache default: cache.
	node removeLink: link
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTCacheResetTest>>testCacheResetPreserveLinks [
	self annotatedMethod.
	self assert: counter equals: 1.
	ASTCache reset.
	self assert: (self class >> #annotatedMethod) ast statements last value links anyOne == link.
	self annotatedMethod.
	self assert: counter equals: 2
]
