"

"
Class {
	#name : #KMDispatchChainTest,
	#superclass : #AbstractKeymappingTest,
	#category : #Keymapping-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMDispatchChainTest>>testGlobalIsFirst [
	| chain first |
	first := nil.
	chain := KMDispatchChain from: (KmGlobalDispatcher new) andDispatcher: (KMDispatcher new).
	chain do: [ :target | first ifNil: [ first := target ] ].
	self assert: first isGlobalDispatcher.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMDispatchChainTest>>testPassesOnTheTarget [
	| chain dispatcher passed |
	dispatcher := KMDispatcher target: Morph new.
	passed := false.
	chain := KMDispatchChain from: (KmGlobalDispatcher new) andDispatcher: dispatcher.
	chain do: [ :t | t == dispatcher target ifTrue: [ passed := true ] ].
	self assert: passed
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMDispatchChainTest>>testTargetDoesNotIterateTheNil [
	| chain |
	chain := KMDispatchChain from: (KmGlobalDispatcher new) andDispatcher: (KMDispatcher new).
	chain do: [ :target | self assert: target notNil ].
]
