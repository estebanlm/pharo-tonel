"

"
Class {
	#name : #KMKeymapTest,
	#superclass : #AbstractKeymappingTest,
	#category : #Keymapping-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMKeymapTest>>keymapContainer [
	^ KMRepository default
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMKeymapTest>>testExecute [
	| bm km flag category |
	category := KMCategory named: #TestFoo.
	KMRepository default addCategory: category.
	bm := Morph new.
	bm attachKeymapCategory: #TestFoo.
	flag := false.
	category
		addKeymapEntry:
			(KMKeymap named: #Foo shortcut: $a asKeyCombination , $b asKeyCombination , $c asKeyCombination action: [ flag := true ]).
	category addKeymapEntry: (KMKeymap named: #Bar shortcut: $p asKeyCombination , $p asKeyCombination action: [  ]).
	{(self eventKey: $a).
	(self eventKey: $b).
	(self eventKey: $c)} do: [ :e | bm dispatchKeystrokeForEvent: e ].
	self assert: flag
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMKeymapTest>>testMatching [
	| category blockAction a b c p|
	
	a := self eventKey: $a.
	b := self eventKey: $b.
	c := self eventKey: $c.
	p := self eventKey: $p.
	
	blockAction := [self error: 'error'].
	
	category := KMCategory named: #testCategory.
	category addKeymapEntry:  (KMKeymap named: #Foo shortcut: $a asKeyCombination, $b asKeyCombination, $c asKeyCombination action: blockAction).
	category addKeymapEntry:  (KMKeymap named: #Fum shortcut: $p asKeyCombination, $p asKeyCombination action: blockAction).

	self assert: (category matches: {a}).
	self deny: (category matches: {b}).
	self assert: (category matches: {a. b}).
	self assert: (category matchesCompletely: {a. b. c}).
	self assert: (category matches: {p}).
	self assert: (category matchesCompletely: {p. p.}).
	self deny: (category matches: {a. p. p}).
	self deny: (category matches: {self eventKey: $l. self eventKey: $m. self eventKey: $n. self eventKey: $o}).
]
