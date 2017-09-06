"
ZipEncoderNode represents a node in a huffman tree for encoding ZipStreams.

Instance variables:
	value 		<Integer>	- Encoded value
	frequency	<Integer>	- Number of occurences of the encoded value
	height 		<Integer>	- Height of the node in the tree
	bitLength 	<Integer>	- bit length of the code
	code		<Integer>	- Assigned code for this node
	parent		<ZipEncoderNode>		- Parent of this node
	left			<ZipEncoderNode>		- First child of this node
	right		<ZipEncoderNode>		- Second child of this node

"
Class {
	#name : #ZipEncoderNode,
	#superclass : #Object,
	#instVars : [
		'value',
		'frequency',
		'height',
		'bitLength',
		'code',
		'parent',
		'left',
		'right'
	],
	#category : #Compression-Streams,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode class>>value: v frequency: f height: h [
	^self new setValue: v frequency: f height: h
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>bitLength [
	^bitLength ifNil:[0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>code [
	^code ifNil:[0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>code: aCode [
	[aCode >= 0 and:[(1 bitShift: bitLength) > aCode]] assert.
	code := aCode.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>computeHeight [
	^self isLeaf
		ifTrue:[height := 0]
		ifFalse:[height := (left computeHeight max: right computeHeight) + 1].
]

{
	#category : #encoding,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>encodeBitLength: blCounts from: aTree [
	| index |
	"Note: If bitLength is not nil then the tree must be broken"
	bitLength isNil ifFalse:[self error:'Huffman tree is broken'].
	parent  
		ifNil: [bitLength := 0]
		ifNotNil:[bitLength := parent bitLength + 1].
	self isLeaf ifTrue:[
		index := bitLength + 1.
		blCounts at: index put: (blCounts at: index) + 1.
	] ifFalse:[
		left encodeBitLength: blCounts from: aTree.
		right encodeBitLength: blCounts from: aTree.
	].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>frequency [
	^frequency
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>frequency: aNumber [
	frequency := aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>height [
	^height
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>isLeaf [
	^left isNil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>leafNodes [
	self isLeaf
		ifTrue:[^Array with: self]
		ifFalse:[^left leafNodes, right leafNodes]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>left [
	^left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>left: aNode [
	aNode parent: self.
	left := aNode.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>parent [
	^parent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>parent: aNode [
	parent := aNode
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut:$(;
		nextPutAll:'value = '; print: value;
		nextPutAll:', freq = '; print: frequency;
		nextPutAll:', bitLength = '; print: bitLength;
		nextPutAll:', code = '; print: code;
		nextPutAll:', height = '; print: height; 
	nextPut:$).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>right [
	^right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>right: aNode [
	aNode parent: self.
	right := aNode.
]

{
	#category : #encoding,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>rotateToHeight: maxHeight [
	"Rotate the tree to achieve maxHeight depth"
	| newParent |
	height < 4 ifTrue:[^self].
	self left: (left rotateToHeight: maxHeight-1).
	self right: (right rotateToHeight: maxHeight-1).
	height := (left height max: right height) + 1.
	height <= maxHeight ifTrue:[^self].
	(left height - right height) abs <= 2 ifTrue:[^self].
	left height < right height ifTrue:[
		right right height >= right left height ifTrue:[
			newParent := right.
			self right: newParent left.
			newParent left: self.
		] ifFalse:[
			newParent := right left.
			right left: newParent right.
			newParent right: right.
			self right: newParent left.
			newParent left: self.
		].
	] ifFalse:[
		left left height >= left right height ifTrue:[
			newParent := left.
			self left: newParent right.
			newParent right: self.
		] ifFalse:[
			newParent := left right.
			left right: newParent left.
			newParent left: left.
			self left: newParent right.
			newParent right: self.
		].
	].
	parent computeHeight.
	^parent
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>setBitLengthTo: bl [
	bitLength := bl
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>setValue: v frequency: f height: h [
	value := v.
	frequency := f.
	height := h.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipEncoderNode>>value [
	^value
]
