"
I am a parse tree leaf representing a literal string or number.
"
Class {
	#name : #LiteralNode,
	#superclass : #LeafNode,
	#category : #Compiler-ParseNodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>accept: aVisitor [
	^aVisitor visitLiteralNode: self
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>emitCodeForValue: stack encoder: encoder [
	stack push: 1.
	(encoder
		if: code
		isSpecialLiteralForPush:
			[:specialLiteral|
			 encoder genPushSpecialLiteral: specialLiteral])
		ifFalse:
			[encoder genPushLiteral: index]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>isConstantNumber [
	^ key isNumber
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>isLiteralNode [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>isSpecialConstant [
	^ code between: LdTrue and: LdMinus1+3
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>literalValue [

	^key
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>name: literal key: object index: i type: type [
	"For compatibility with Encoder>>name:key:class:type:set:"
	^self key: object index: i type: type
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>printOn: aStream indent: level [

	key isVariableBinding
		ifTrue:
			[key key 
				ifNil:
					[aStream nextPutAll: '###'; nextPutAll: key value soleInstance name]
				ifNotNil:
					[aStream nextPutAll: '##'; nextPutAll: key key]]
		ifFalse:
			[key storeOn: aStream]
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralNode>>sizeCodeForValue: encoder [
	self reserve: encoder.
	(encoder
		if: code
		isSpecialLiteralForPush:
			[:specialLiteral|
			 ^encoder sizePushSpecialLiteral: specialLiteral])
		ifFalse:
			[^encoder sizePushLiteral: index]
]
