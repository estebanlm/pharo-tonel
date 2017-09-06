"
I am a parse tree leaf representing a selector.
"
Class {
	#name : #SelectorNode,
	#superclass : #LeafNode,
	#category : #Compiler-ParseNodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>accept: aVisitor [
	^aVisitor visitSelectorNode: self
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>emitCode: stack args: nArgs encoder: encoder [

	self emitCode: stack
		args: nArgs
		encoder: encoder
		super: false
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>emitCode: stack args: nArgs encoder: encoder super: supered [
	stack pop: nArgs.
	^supered
		ifTrue:
			[encoder genSendSuper: index numArgs: nArgs]
		ifFalse:
			[encoder
				genSend: (code < Send ifTrue: [code negated] ifFalse: [index])
				numArgs: nArgs]
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>emitCodeForEffect: stack encoder: encoder [

	self shouldNotImplement
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>emitCodeForValue: stack encoder: encoder [

	self shouldNotImplement
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>isForFFICall [
	^key includesSubstring: '()/'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>key: aSelector [
	"This is for printing of FFI selectors."
	key := aSelector
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>name: literal key: object index: i type: type [
	"For compatibility with Encoder>>name:key:class:type:set:"
	^self key: object index: i type: type
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>printAsFFICallWithArguments: aSequence on: aStream indent: level [
	aStream nextPutAll: (key copyUpTo: $)).
	aSequence
		do: [:arg| arg printOn: aStream indent: level]
		separatedBy: [aStream nextPutAll: ', '].
	aStream nextPut: $)
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>printOn: aStream indent: level  [
	aStream nextPutAll: (key == nil
							ifTrue: ['<key==nil>']
							ifFalse: [key])
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>reserve: encoder  [
	"If this is a yet unused literal of type -code, reserve it."

	code < 0 ifTrue: [code := self code: (index := encoder sharableLitIndex: key) type: 0 - code]
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>sizeCode: encoder args: nArgs super: supered [
	self reserve: encoder.
	^supered
		ifTrue:
			[code < Send "i.e. its a special selector" ifTrue:
				[code := self code: (index := encoder sharableLitIndex: key) type: 5].
			 encoder sizeSendSuper: index numArgs: nArgs]
		ifFalse:
			[self flag: #yuck. "special selector sends cause this problem"
			 encoder
				sizeSend: (code < Send ifTrue: [code negated] ifFalse: [index])
				numArgs: nArgs]
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>sizeCodeForEffect: encoder [

	self shouldNotImplement
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
SelectorNode>>sizeCodeForValue: encoder [

	self shouldNotImplement
]
