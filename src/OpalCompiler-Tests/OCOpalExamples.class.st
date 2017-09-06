"
I am the central place for example code used in tests
"
Class {
	#name : #OCOpalExamples,
	#superclass : #Object,
	#instVars : [
		'iVar',
		'collection'
	],
	#category : #OpalCompiler-Tests-AST,
	#timestamp : '<historical>'
}

{
	#category : #compiler,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples class>>compilerClass [
	^OpalCompiler
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>doubleRemoteAnidatedBlocks [
	| val last |	
	val := 0. 
	1 to: 10 do: [ :i |
		[ :continue |
			i = 4 ifTrue: [continue value].
			val := val + 1.
			last := i
		] valueWithExit.
	].
	self assert: val = 9.
	self assert: last = 10.


]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleAndOr [
	| t1 t2 |
	t1 := true.
	t2 := false.
	t1 and: [ t2. '1' logCr ]. "effect"   
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleAndOr2 [
	| t1 t2 |
	t1 := true.
	t2 := false.  
	t2 or: [ t1. '2' logCr ]. "effect" 
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleAndOr3 [
	| t1 t2 |
	t1 := true.
	t2 := false.  
	^ t1 and: [ t2 ] "value" 
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleAndOr4 [
	| t1 t2 |
	t1 := true.
	t2 := false.  
	^ t2 or: [ t1 ] "value"  
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleAndOr5 [
	| t1 t2 |
	t1 := true.
	t2 := false.  
	^ t2 or: [ t1 and: [ t2 ] ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleAndOr6 [
	| t1 t2 |
	t1 := true.
	t2 := false.  
	^ t1 and: [ t2 or: [ t1 ] ]
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleBlockArgument [
	| block block1 block2 |
	block := [ :arg | | temp | temp := arg. [ temp ] ].
	block1 := block value: 1.
	block2 := block value: 2.
	self assert: block1 value = 1.
	self assert: block2 value = 2.
	^block1 value + block2 value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleBlockExternal [
	| t |
	t := 1.
	^[t] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleBlockExternal2 [
	| t1 t2 |
	t1 :=  t2 := 1.
	^[t1 + t2] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleBlockExternalArg [
	| t  |
	t := 1.
	^[:a | t + a] value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleBlockExternalNested [
	| t s |
	t := s := 1.
	^[[s] value +   t   ] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleBlockInternal [
	
	^[ | t | t := 1. t] value
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleBlockMethodArgument: arg [
	|  block |
	block := [ :blockarg | blockarg + arg].
	self assert: ((block value: 2) = (arg + 2)).
	^block value: 2
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleBlockNested [
	
	^[ [1] value] value
]

{
	#category : #examples-pragmas,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleDoublePrimitive [
	<primitive: 1>
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleEffectValues [
	#getMe.
	#( got that ? ).
	Class.
	
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleEmptyMethod [

]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleForBlockArgument [
	|b|
	b:= [ :blockArg | 1 ].
	^ b
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleForInlinedBlockArgument [
	
	1 ifNotNil:[ :value | ^ value ].

]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleIfFalse [
	true ifFalse: [^1].
	^2
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleIfFalseIfTrue [
	true ifFalse: [^1] ifTrue: [^2].
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleIfNotNilArg [
	^1 even ifNotNil: [ :arg | arg not ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleIfNotNilReturnNil [
	^nil ifNotNil: [ :arg | arg not ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleIfTrue [
	 1  < 2 ifTrue: [^'result']. 
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleIfTrueAssign [
	| a |
	a := 1 <2 ifTrue: [1] ifFalse: [2].
	^a 
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleIfTrueIfFalse [
	 1 <2 ifTrue: [^'result'] ifFalse: [2].
	
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleInlineBlockCollectionLR3 [
	| col |
	col := OrderedCollection new.
	1 to: 11 do: [ :each | | i | i := each. col add: [ i ]. i := i + 1 ].
	^ (col collect: [ :each | each value ]) asArray "= (2 to: 12) asArray"

]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleMethodTempInNestedBlock [
	| temp block |
	temp := 0.
	block := [ [ temp ] ].
	temp := 1.
	block := block value.
	temp := 2.
	"self assert: block value = 2."
	^block value.
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleMethodWithOptimizedBlocksA [
	| s c |
	s := self isNil
			ifTrue: [| a | a := 'isNil'. a]
			ifFalse: [| a | a := 'notNil'. a].
	c := String new: s size.
	1 to: s size do:
		[:i| c at: i put: (s at: i)].
	^c. "notNil"
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleNestedBlockScoping [

	| b c z |
	b := [:a | 
			z := 2.
			z + a].
	c := [:a |
			z + a].
	^ (b value: 2) + (c value: 1)
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleNewArray [

	| temp |
	
	temp := Array new: 3.
	^temp
]

{
	#category : #examples-pragmas,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>examplePrimitiveErrorCode [
	
	<primitive: 60 error: code >
	
	^ code


]

{
	#category : #examples-pragmas,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>examplePrimitiveErrorCodeModule [
	"Primitive. Attempt to load a module of the given name.
	Fail if module cannot be found, or cannot be loaded,
	or failed to initialize"

	<primitive: 'primLoadModule'  module: '' error: #errorCode >
	^ self primitiveFailed
]

{
	#category : #examples-pragmas,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>examplePrimitiveErrorModule [
	
	<primitive: 'primFunction' error: errorCode module: 'primModule'>
	^ errorCode
]

{
	#category : #examples-pragmas,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>examplePrimitiveModuleError [
	
	<primitive: 'primFunction'  module: 'primModule' error: errorCode >
	^ errorCode
]

{
	#category : #examples-misc,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>examplePushArray [
	| t |

	{1 .t:=1}.
	^t
]

{
	#category : #examples-misc,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>examplePushBigArray [
	"This array should have a size more than 127 elements"
	{ 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 .  255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 }.
	^ 1
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleRepeatEffect [
	<compilerOptions: #(#+ #optionInlineRepeat)>
	| i |
	i := 1.
	[  
	i := i + 1. 
	i = 10
		ifTrue: [ ^ true ] ] repeat
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleRepeatValue [
	<compilerOptions: #(#+ #optionInlineRepeat)>
	| i |
	i := 1.
	^ [ 
	i := i + 1.
	i = 10
		ifTrue: [ ^ true ] ] repeat 
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleReturn1 [
	^1
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleReturn1plus2 [
	^1+2
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleReturn42 [
	^42
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSelf [
	| t |
	t := self.
	^self.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlock [
	^[1].
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockArgument1 [
	^[:a | a ] value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockArgument2 [
	^[:a :b | a + b ] value: 1 value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockArgument3 [
	^[:a :b :c | a + b + c ] value: 1 value: 1 value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockArgument4 [
	^[:a :b :c :d | a + b + c  + d] value: 1 value: 1 value: 1 value: 1. 
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockArgument5 [
	^[:a :b :c :d :e| a + b + c  + d + e] valueWithArguments: #(1 1 1 1 1). 
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockEmpty [
	^[] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockLocal [
	^[ :each | | t |  t:= each. t   ] value: 5.
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockLocalIf [
	^true ifTrue: [ | hallo |  hallo := 1 . hallo].
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockLocalIfNested [
	^true ifTrue: [| hallo |  [  hallo := 1 . hallo] value] .
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockLocalWhile [
	|a|
	a := true.
	^[: b | [a] whileTrue: [ | hallo |  a := false. hallo := 1 . hallo]]value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockNested [
	| a match dict | 

	a  := #(a b c d).
	dict := Dictionary new.


	a doWithIndex: [:each :index |
		(match := a indexOf: each) > 0 ifTrue:
			[dict at: index put: (a at: match)]].

	^ dict.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockReturn [
	[^1] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSimpleBlockiVar [
	^[iVar] value.
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleSuper [
	| t |
	t := super.
	^super.
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleThisContext [
	| t |
	t := thisContext.
	^thisContext.
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleTimesRepeatEffect [
	| foo |
	foo := 1.
	5 timesRepeat: [ foo := foo + 3 ] . 
	^ foo
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleTimesRepeatValue [
	^ 5 timesRepeat: [ 1 + 2 ]   
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoArgument [
	collection := OrderedCollection new.
	1 to: 5 do: [ :index |
		collection add:  [index]  ].
	 ^collection collect: #value. 
	"#(1 2 3 4 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoArgumentLimitIsExpression [
	| count sum |
	count := 10.
	sum := 0.
	1 to: count - 1 do: [ :each | sum := sum + each].
	^sum
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoArgumentNotInlined [
	| block |
	block := [ :index |
		collection add: [ index ] ].
	1 to: 5 do: block.
	^collection "#(1 2 3 4 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoInsideTemp [
	1 to: 5 do: [ :index | 
		| temp | 
		temp := index. 
		collection add: [ temp ] ].
	^collection "#(1 2 3 4 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoInsideTempNotInlined [
	| block |
	block := [ :index | 
		| temp | 
		temp := index. 
		collection add: [ temp ] ].
	1 to: 5 do: block.
	^collection "#(1 2 3 4 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoOutsideTemp [
	| temp |
	1 to: 5 do: [ :index | 
		temp := index. 
		collection add: [ temp ] ].
	^collection "#(5 5 5 5 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoOutsideTempNotInlined [
	| block temp |
	block := [ :index | 
		temp := index. 
		collection add: [ temp ] ].
	1 to: 5 do: block.
	^collection "#(5 5 5 5 5)"
]

{
	#category : #examples-misc,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoValue [

	^ 1 to: 2 do: [:each | each]
	

]

{
	#category : #examples-misc,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleToDoValueLimitExpression [

	^ 2 to: 3+4 do: [:each | each]
	

]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleWhileModificationAfterNotInlined [
	| index block |
	index := 0.
	block := [ 
		collection add: [ index ].
		index := index + 1 ].
	[ index < 5 ] whileTrue: block.
	^collection "#(5 5 5 5 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleWhileModificationBefore [
	| index |
	collection := OrderedCollection new.
	index := 0.
	[ index < 5 ] whileTrue: [ 
		index := index + 1.
		collection add: [ index ] ].
	 ^collection collect: #value.
	"#(5 5 5 5 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleWhileModificationBeforeNotInlined [
	| index block |
	index := 0.
	block := [ 
		index := index + 1.
		collection add: [ index ] ].
	[ index < 5 ] whileTrue: block.
	^collection.
	"#(5 5 5 5 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleWhileNoModification [
	"tempvars aren't modified in the loop, therefore they don't need to be in a indirection vector.
	  number of temps = declared temps "

	| a b c |
	a := 1.
	b := 2.
	c := 3.
	[ false ]
		whileTrue: [ 
			[ a class.
			  b class.
			  c class ]	"<- block in optimized loop" ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleWhileWithTemp [
	| index |
	index := 0.
	[ index < 5 ] whileTrue: [
		| temp |
		temp := index := index + 1.
		collection add: [ temp ] ].
	^collection "#(1 2 3 4 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleWhileWithTempNotInlined [
	| index block |
	index := 0.
	block := [
		| temp |
		temp := index := index + 1.
		collection add: [ temp ] ].
	[ index < 5 ] whileTrue: block.
	^collection "#(1 2 3 4 5)"
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleWithArgument: anArg [
	^ anArg
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>exampleiVar [
	iVar := 1.
	^iVar.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>initialize [
	collection := OrderedCollection new
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>nestedBlocksRemoteInBlockCase1 [
	| block |
	block := [ | a b |
		[ a := b ].
		[ b := a ] ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>nestedBlocksRemoteInBlockCase2 [
	| block |
	block := [ 
		[ |a| [ a := 1] ].
		[ |b| [ b := 2] ] ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>nestedBlocksRemoteInBlockCase3 [
	| block |
	block := [ 
		[ |a| block := [ a := 1] ].
		[ |b| block := [ b := 2] ] ].
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>noRemoteBlockArgument [
	| block block1 block2 |
	block := [ :arg | | temp | temp := arg. [ temp ] ].
	block1 := block value: 1.
	block2 := block value: 2.


]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>noRemoteBlockReturn [
	(self announcements at: self index ifAbsent: [ ^ self ]) 
		open.


]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>noRemoteBlockTemp [
	| block block1 block2 |
	block := [ :arg | [ arg ] ].
	block1 := block value: 1.
	block2 := block value: 2.



]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>noRemoteMethodTemp [
	| block1 block2 |
	block1 := self methodArgument: 1.
	block2 := self methodArgument: 2.


]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>noRemoteReadInBlock [
	| a |
	a := 1.
	[ a ]


]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>noRemoteReadNestedBlocks    [
	 [ |a| a := 1.
       [ a ]]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockReadInBlock [
	| t1 |
	[ t1 < 5 ] whileTrue: [ [ t1 ] ].

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockWriteInBlock [
	| t1 |
	[ t1 < 5 ] whileTrue: [ t1 := 1 ].

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockWriteInNestedBlock [
	| t1 |
	^[ [ t1 < 5 ] whileTrue: [ t1 := 1 ] ]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockWriteInNestedBlockCase2 [
	| t1 |
	(true) ifTrue: [ [ t1 < 5 ] whileTrue: [ t1 := 1 ] ]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockWriteInNestedBlockCase3 [
	| t1 |
	[(true) ifTrue: [ [ t1 < 5 ] whileTrue: [ t1 := 1 ] ] ]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockWriteInNestedBlockCase4 [
	| t1 |
	[(true) whileTrue: [ [ t1 < 5 ] whileTrue: [ t1 := 1 ] ] ]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockWriteReadInBlock [
	| t1 |
	[ t1 < 5 ] whileTrue: [ t1 := 1. [ t1 ] ].

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockWrittenAfterClosedOverCase1 [
	| index |
	index := 0.
	[ index < 5 ] whileTrue: [
		| temp |
		[ temp ].
		temp := index := index + 1].
	^index

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlockWrittenAfterClosedOverCase2 [
	| index |
	index := 0.
	[ index < 5 ] whileTrue: [
		| temp |
		temp := index := index + 1.
		 [ temp ] ].

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>optimizedBlocksAndSameNameTemps [
	| s c |
	s := self isNil
			ifTrue: [| a | a := 1. a]
			ifFalse: [| a | a := 2. a].
	c := String new: s size.
	1 to: s size do:
		[:i| c at: i put: (s at: i)].
	^c
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>singleRemoteDifferentBlocksSameArgumentName [
	| b c z |
	b := [:a | 
		z := 2.
		z + a].
	c := [:a |
		z + a].
	^ (b value: 2) + (c value: 1)


]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>singleRemoteMethodArgument [
	| temp block |
	temp := 0.
	block := [ [ temp ] ].
	temp := 1.
	block := block value.
	temp := 2.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>singleRemoteReadNestedBlocks    [
	|a| 
	[  a := 1.
       [ a ]]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>singleRemoteTempVar [
	| index block theCollection |
	index := 0.
	block := [ 
		theCollection add: [ index ].
		index := index + 1 ].
	[ index < 5 ] whileTrue: block.
	self assertValues: #(5 5 5 5 5)
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>singleRemoteTempVarWrittenAfterClosedOver [
	| index block |
	index := 0.
	block := [ index ].
	index := index + 1.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCOpalExamples>>writtenAfterClosedOver [
	| a |      
	[ a ].
	a := 1
]
