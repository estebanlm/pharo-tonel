"
SUnit tests for opening of tools
"
Class {
	#name : #OpenToolTest,
	#superclass : #UITestCase,
	#category : #Tools-Test-Base
}

{ #category : #'test inspect' }
OpenToolTest >> testInspectArray [
	| inspector |
	inspector := (1 to: 1000) asArray inspector.
	inspector changed.
	inspector close.
]

{ #category : #'test inspect' }
OpenToolTest >> testInspectClass [
	| inspector |
	inspector := Object inspector.
	inspector changed.
	inspector close.
]

{ #category : #'test inspect' }
OpenToolTest >> testInspectDictionary [
	| inspector |
	inspector := (Dictionary new) inspector.
	inspector changed.
	inspector close.
]

{ #category : #'test inspect' }
OpenToolTest >> testInspectInteger [
	| inspector |
	inspector := 1 inspector.
	inspector changed.
	inspector close.
]

{ #category : #'test inspect' }
OpenToolTest >> testInspectTraitClass [
	| inspector |
	inspector := TBehavior inspector.
	inspector changed.
	inspector close.
]

{ #category : #'test browse' }
OpenToolTest >> testOpenBrowseOnClass [
	| browser |
	browser := Object browse.
	browser changed.
	browser close.
]

{ #category : #'test browse' }
OpenToolTest >> testOpenBrowseOnInstalledTraitMethod [
	| browser |
	browser := (Class>>#hasClassSide) browse.
	browser changed.
	browser close.
]

{ #category : #'test browse' }
OpenToolTest >> testOpenBrowseOnMethod [
	| browser |
	browser := (Object>>#yourself) browse.
	browser changed.
	browser close.
]

{ #category : #'test browse' }
OpenToolTest >> testOpenBrowseOnTraitMethod [
	| browser |
	browser := (TBehavior>>#name) browse.
	browser changed.
	browser close.
]

{ #category : #'test senders' }
OpenToolTest >> testSendersOfAt [
	| senders |
	senders := SystemNavigation default browseAllSendersOf: #name.
	senders changed.
	senders close.
]
