"
I represent a primitive.  I am more than just a number if I am a named primitive.

Structure:

 num	<Integer>	Primitive number.
 spec	<Object>		Stored in first literal when num is 117 or 120.

"
Class {
	#name : #IRPrimitive,
	#superclass : #Object,
	#instVars : [
		'primitiveNum',
		'spec'
	],
	#category : #OpalCompiler-Core-Bytecode,
	#timestamp : 'ajh 3/24/2003 21:35'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive class>>from: aPragmaNode [

	^ self new initializeFrom: aPragmaNode
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive class>>null [

	^ self new num: 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive>>initializeFrom: aPragmaNode [

	primitiveNum := 0.
	spec := Array 
		with: (aPragmaNode arguments second) name
		with: (aPragmaNode arguments first) name
		with: 0 with: 0.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive>>num [

	^ primitiveNum
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive>>num: n [

	primitiveNum := n
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive>>printOn: aStream [

	aStream nextPutAll: 'primitive '; print: primitiveNum
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive>>printPrimitiveOn: aStream [
	"Print the primitive on aStream"

	| primIndex primDecl |
	primIndex := primitiveNum.
	primIndex = 0
		ifTrue: [ ^ self ].
	primIndex = 120
		ifTrue: [ 
			"External call spec"
			^ aStream print: spec ].
	aStream nextPutAll: '<primitive: '.
	primIndex = 117
		ifTrue: [ 
			primDecl := spec.
			aStream
				nextPut: $';
				nextPutAll: primDecl second;
				nextPut: $'.
			primDecl first
				ifNotNil: [ 
					aStream
						nextPutAll: ' module: ';
						nextPut: $';
						nextPutAll: primDecl first;
						nextPut: $' ] ]
		ifFalse: [ aStream print: primIndex ].
	aStream nextPut: $>.
	(primIndex ~= 117 and: [ primIndex ~= 120 ])
		ifTrue: [ 
			Smalltalk
				at: #Interpreter
				ifPresent: [ :cls | 
					aStream
						nextPutAll: ' "';
						nextPutAll: ((cls classPool at: #PrimitiveTable) at: primIndex + 1);
						nextPutAll: '" ' ] ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive>>sourceText [

	^ String streamContents: [:stream |
		self printPrimitiveOn: stream]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive>>spec [

	^ spec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPrimitive>>spec: literal [

	spec := literal
]
