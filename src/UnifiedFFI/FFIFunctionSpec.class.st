"
I am used to hold a parsed function signature, describing a C function.
Since all C functions having return type, arguments and name (unless it anonymous one), 
same structure can be used to hold an information about it in my instances.
However, what objects used to represent types and arguments is up to code generator.
"
Class {
	#name : #FFIFunctionSpec,
	#superclass : #Object,
	#instVars : [
		'returnType',
		'functionName',
		'arguments'
	],
	#category : #UnifiedFFI,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>addArgument: anArgument [
	^ arguments add: anArgument
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>arguments [
	^ arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>arguments: anObject [
	arguments := anObject
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>asArraySpec [
	^ String streamContents: [ :stream | 
		stream nextPutAll: '#( '.
		self printType: returnType on: stream.
		stream space.
		functionName ifNotNil: [
			stream 
				nextPutAll: functionName; 
				space ].
		stream nextPutAll: '( '.
		arguments 
			do: [ :each | 
				stream nextPutAll: each second. "type name"
				each third 
					timesRepeat: [ stream nextPut: $* ].
				stream 
					space;
					nextPutAll: each first;
					space ] 
			separatedBy: [ stream nextPutAll: ', ' ].
		stream nextPutAll: '))' ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>asArraySpecArrayedArgs [
	^ String streamContents: [ :stream | |index|
		stream nextPutAll: '#( '.
		self printType: returnType on: stream.
		stream space.
		functionName ifNotNil: [
			stream 
				nextPutAll: functionName; 
				space ].
		stream nextPutAll: '( '.
		index := 1.
		arguments 
			do: [ :each | 
				stream nextPutAll: each second. "type name"
				each third 
					timesRepeat: [ stream nextPut: $* ].
				stream 
					space;
					nextPutAll: 'argsArray@', index printString;
					space.
				index := index + 1 ] 
			separatedBy: [ 
				stream nextPutAll: ', ' ].
		stream nextPutAll: '))' ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>asMethodSelectorAndArguments [
	^ String streamContents: [ :stream | 
		stream nextPutAll: functionName.
		arguments ifNotEmpty: [
			arguments size = 1 ifFalse: [
				stream
					nextPut: $_;
					nextPutAll: arguments first first ].
			stream
				nextPut: $:; 
				space;
				nextPutAll: arguments first first.
				
			arguments allButFirst 
				do: [:each | 
					stream 
						space;
						nextPutAll: each first; 
						nextPut: $:;
						space;
						nextPutAll: each first ]]]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>asMethodSelectorAndArrayOfArguments [
	^ String streamContents: [ :stream | 
		stream
			nextPutAll: functionName;
			nextPutAll: ': argsArray';
			cr;
			nextPut: $".
		arguments 
			do: [ :each | stream nextPutAll: each first ] 
			separatedBy: [ stream nextPutAll: ', ' ].
		stream nextPut: $" ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>functionName [
	^ functionName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>functionName: anObject [
	functionName := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>initialize [
	super initialize.
	arguments := OrderedCollection new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>isAnonymous [
	^ self functionName isNil
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>printType: typeAndArity on: stream [
	stream nextPutAll: typeAndArity first.
	typeAndArity second timesRepeat: [ stream nextPut: $* ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>returnType [
	^ returnType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFunctionSpec>>returnType: anObject [
	returnType := anObject
]
