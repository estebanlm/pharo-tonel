"

"
Class {
	#name : #RBVariableNodeTest,
	#superclass : #TestCase,
	#category : #AST-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBVariableNodeTest>>testStartForReplacement [

	| source tree dTemporary |
	source := 'foo
	|a b c de d|
	de := 4'.
	tree := RBParser parseMethod: source.
	dTemporary := tree body temporaries last.
	self assert: dTemporary name equals: #d.
	self assert: (source copyFrom: dTemporary start to: dTemporary stop) equals: 'd'.
	self assert: (source copyFrom: dTemporary startForReplacement to: dTemporary stop) equals: ' d'.
	self assert: (dTemporary start - dTemporary startForReplacement) equals: 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBVariableNodeTest>>testStartForReplacement02 [

	| source tree dTemporary |
	source := 'foo
	|a b c de 
	
d|
	de := 4'.
	tree := RBParser parseMethod: source.
	dTemporary := tree body temporaries last.
	self assert: dTemporary name equals: #d.
	self assert: (source copyFrom: dTemporary start to: dTemporary stop) equals: 'd'.
	self assert: (source copyFrom: dTemporary startForReplacement to: dTemporary stop) equals: ' 
	
d'.
	self assert: (dTemporary start - dTemporary startForReplacement) equals: 4
]
