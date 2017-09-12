Class {
	#name : #HistoryNodeTest,
	#superclass : #TestCase,
	#category : #System-History-Tests
}

{ #category : #'as yet unclassified' }
HistoryNodeTest >> testClose [
	| h i |
	h := HistoryNode new.
	h close.
	h addItem: (i := HistoryLeaf new).
	h open.
 	h addItem: i.
	self assert: h current = i
]

{ #category : #'as yet unclassified' }
HistoryNodeTest >> testEmptyHistory [
	| h |
	h := HistoryNode new.
	self assert: h size = 0.
	self assert: h current isNil
]

{ #category : #'as yet unclassified' }
HistoryNodeTest >> testGroup [
	| h i |
	h := HistoryNode new.
	h addItem: (i := HistoryLeaf new).
	self assert: h size = 1.
	self assert: (h at: 1) = i.
	h openGroup.
	self assert: h size = 2.
	self assert: (h at: 1) = i.
	self assert: (h at: 2) isComposite.

]

{ #category : #'as yet unclassified' }
HistoryNodeTest >> testOneGroup [
	| h i c i2 i3 i4 | 
	h := HistoryNode new.
	h addItem: (i := HistoryLeaf new).
	self assert: h size = 1.
	self assert: (h at: 1) = i.
	h openGroup.
	self assert: h size = 2.
	self assert: (h at: 1) = i.
	self assert: (c := h at: 2) isComposite.
	self assert: c isEmpty.
	h addItem: (i2 := HistoryLeaf new).
	self assert: h size = 2.
	self assert: c size = 1.
	self assert: c current = i2.
	h closeGroup.
	h addItem: (i3 := HistoryLeaf new).
	self assert: h size = 3.
	self assert: (h at: 3) = i3.
	h closeGroup.
	h addItem: (i4 := HistoryLeaf new).
	self assert: h size = 3.
	

	
	

]

{ #category : #'as yet unclassified' }
HistoryNodeTest >> testOneItem [
	| h i |
	h := HistoryNode new.
	h addItem: (i := HistoryLeaf new).
	self assert: h size = 1.
	self assert: h current = i
]

{ #category : #'as yet unclassified' }
HistoryNodeTest >> testReset [
	| h i |
	h := HistoryNode new.
	h addItem: (i := HistoryLeaf new).
	self assert: h current = i.
	self assert: h size = 1.
	h reset.
	self assert: h size = 0.
]

{ #category : #'as yet unclassified' }
HistoryNodeTest >> testTwoConsecutiveCloseGroup [
	| h i grp1 grp2  i2 i3 i4 | 
	h := HistoryNode new.
	h addItem: (i := HistoryLeaf new).
	self assert: h size = 1.
	self assert: (h at: 1) = i.
	h openGroup.
	self assert: h size = 2.
	grp1 := h at: 2.
	h openGroup.
	self assert: h size = 2.
	self assert: grp1 size = 1.
	grp2 := grp1 at: 1.
	self assert: grp2 size = 0.
	h closeGroup.
	h closeGroup.
	h addItem: (i3 := HistoryLeaf new).
	self assert: h size = 3.
	self assert: h current = i3.
	

	
	

]

{ #category : #'as yet unclassified' }
HistoryNodeTest >> testTwoGroups [
	| h i grp1 grp2  i2 i3 i4 | 
	h := HistoryNode new.
	h addItem: (i := HistoryLeaf new).
	self assert: h size = 1.
	self assert: (h at: 1) = i.
	h openGroup.
	self assert: h size = 2.
	grp1 := h at: 2.
	h openGroup.
	self assert: h size = 2.
	self assert: grp1 size = 1.
	grp2 := grp1 at: 1.
	self assert: grp2 size = 0.
	h addItem: (i2 := HistoryLeaf new).
	self assert: grp2 size = 1.
	h closeGroup.
	h addItem: (i2 := HistoryLeaf new).
	self assert: grp2 size = 1.
	self assert: grp1 size = 2.
	self assert: grp1 current = i2.
	h closeGroup.
	h addItem: (i3 := HistoryLeaf new).
	self assert: grp2 size = 1.
	self assert: grp1 size = 2.
	self assert: h size = 3.
	self assert: h current = i3.
	

	
	

]
