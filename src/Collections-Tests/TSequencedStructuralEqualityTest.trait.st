"
A trait for test purposes
"
Trait {
	#name : #TSequencedStructuralEqualityTest,
	#traits : 'TStructuralEqualityTest',
	#classTraits : 'TStructuralEqualityTest classTrait',
	#category : #Collections-Tests-Abstract
}

{ #category : #'test - equality' }
TSequencedStructuralEqualityTest >> empty [
	
	^ self explicitRequirement
]

{ #category : #'test - equality' }
TSequencedStructuralEqualityTest >> nonEmpty [
	
	^ self explicitRequirement
]

{ #category : #'tests - fixture' }
TSequencedStructuralEqualityTest >> test0TSequencedStructuralEqualityTest [
	self nonEmpty at: 1	"Ensures #nonEmpty is sequenceable"
]

{ #category : #'tests - fixture' }
TSequencedStructuralEqualityTest >> test0TStructuralEqualityTest [
	self empty.
	self nonEmpty.
	self assert: self empty isEmpty.
	self deny: self nonEmpty isEmpty
]

{ #category : #'test - equality' }
TSequencedStructuralEqualityTest >> testEqualSign [
	"self debug: #testEqualSign"

	self deny: (self empty = self nonEmpty).
]

{ #category : #'tests - equality' }
TSequencedStructuralEqualityTest >> testEqualSignForSequenceableCollections [
	"self debug: #testEqualSign"

	self deny: (self nonEmpty = self nonEmpty asSet). 
	self deny: (self nonEmpty reversed = self nonEmpty).
	self deny: (self nonEmpty = self nonEmpty reversed).
]

{ #category : #'test - equality' }
TSequencedStructuralEqualityTest >> testEqualSignIsTrueForEmptyButNonIdenticalCollections [
	"self debug: #testEqualSignIsTrueForNonIdenticalButEqualCollections"
		
	self assert: (self empty = self empty copy). 
	self assert: (self empty copy = self empty).
	self assert: (self empty copy = self empty copy).
		

]

{ #category : #'test - equality' }
TSequencedStructuralEqualityTest >> testEqualSignIsTrueForNonIdenticalButEqualCollections [
	"self debug: #testEqualSignIsTrueForNonIdenticalButEqualCollections"
		
	self assert: (self empty = self empty copy). 
	self assert: (self empty copy = self empty).
	self assert: (self empty copy = self empty copy).
		
	self assert: (self nonEmpty = self nonEmpty copy). 
	self assert: (self nonEmpty copy = self nonEmpty).
	self assert: (self nonEmpty copy = self nonEmpty copy).
]

{ #category : #'test - equality' }
TSequencedStructuralEqualityTest >> testEqualSignOfIdenticalCollectionObjects [
	"self debug: #testEqualSignOfIdenticalCollectionObjects"
	
	self assert: (self empty = self empty). 
	self assert: (self nonEmpty = self nonEmpty). 
	
]

{ #category : #'tests - equality' }
TSequencedStructuralEqualityTest >> testHasEqualElements [
	"self debug: #testHasEqualElements"

	self deny: (self empty hasEqualElements: self nonEmpty).
	self deny: (self nonEmpty hasEqualElements: self nonEmpty asSet). 
	self deny: (self nonEmpty reversed hasEqualElements: self nonEmpty).
	self deny: (self nonEmpty hasEqualElements: self nonEmpty reversed).
]

{ #category : #'tests - equality' }
TSequencedStructuralEqualityTest >> testHasEqualElementsIsTrueForNonIdenticalButEqualCollections [
	"self debug: #testHasEqualElementsIsTrueForNonIdenticalButEqualCollections"
		
	self assert: (self empty hasEqualElements: self empty copy). 
	self assert: (self empty copy hasEqualElements: self empty).
	self assert: (self empty copy hasEqualElements: self empty copy).
		
	self assert: (self nonEmpty hasEqualElements: self nonEmpty copy). 
	self assert: (self nonEmpty copy hasEqualElements: self nonEmpty).
	self assert: (self nonEmpty copy hasEqualElements: self nonEmpty copy).
]

{ #category : #'tests - equality' }
TSequencedStructuralEqualityTest >> testHasEqualElementsOfIdenticalCollectionObjects [
	"self debug: #testHasEqualElementsOfIdenticalCollectionObjects"
	
	self assert: (self empty hasEqualElements: self empty). 
	self assert: (self nonEmpty hasEqualElements: self nonEmpty). 
	
]
