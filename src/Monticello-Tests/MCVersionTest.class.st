"

"
Class {
	#name : #MCVersionTest,
	#superclass : #MCTestCase,
	#instVars : [
		'version',
		'visited'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>assert: aSelector orders: sexpr as: array [
	| expected |
	expected := OrderedCollection new.
	version := self versionFromTree: sexpr.
	version perform: aSelector with: [:ea | expected add: ea info name].
	self assert: expected asArray = array
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>assert: aSelector orders: sexpr as: expected unresolved: unresolved [
	| missing |
	missing := OrderedCollection new.
	version := self versionFromTree: sexpr.
	version 
		perform: aSelector 
		with: [:ea | visited add: ea info name]
		with: [:ea | missing add: ea name].
	self assert: visited asArray = expected.
	self assert: missing asArray = unresolved.
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>dependencyFromTree: sexpr [
	^ MCMockDependency fromTree: sexpr
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>setUp [
	visited := OrderedCollection new.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>testAllAvailablePostOrder [
	self 
		assert: #allAvailableDependenciesDo: 
		orders: #(a ((b (d e)) c)) 
		as: #(d e b c)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>testAllMissing [
	self 
		assert: #allDependenciesDo: 
		orders: #(a ((b (d e)) (c missing))) 
		as: #(d e b)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>testAllUnresolved [
	self 
		assert: #allDependenciesDo:ifUnresolved: 
		orders: #(a ((b (d e)) (c missing)))
		as: #(d e b)
		unresolved: #(c)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>testDependencyOrder [
	self 
		assert: #allDependenciesDo: 
		orders: #(a (b c)) 
		as: #(b c)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>testPostOrder [
	self 
		assert: #allDependenciesDo: 
		orders: #(a ((b (d e)) c)) 
		as: #(d e b c)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>testWithAll [
	self 
		assert: #withAllDependenciesDo: 
		orders: #(a ((b (d e)) c)) 
		as: #(d e b c a)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>testWithAllMissing [
	self 
		assert: #withAllDependenciesDo: 
		orders: #(a ((b (d e)) (c missing))) 
		as: #(d e b a)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>testWithAllUnresolved [
	self 
		assert: #withAllDependenciesDo:ifUnresolved: 
		orders: #(a ((b (d e)) (c missing)))
		as: #(d e b a)
		unresolved: #(c)
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCVersionTest>>versionFromTree: sexpr [
	^ (self dependencyFromTree: sexpr) resolve
]
