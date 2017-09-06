"
The method of this class in the protocols named examples are supposed to represent all the possible smalltalk semantics in the point of view of the Decompiler
"
Class {
	#name : #FBDExamples,
	#superclass : #Object,
	#instVars : [
		'iVar',
		'collection'
	],
	#classVars : [
		'CVar'
	],
	#category : #Flashback-Decompiler-Tests,
	#timestamp : 'ClementBera 2/6/2015 13:39'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>doubleRemoteAnidatedBlocks [
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
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>example2Loops [
	| t |
	t := 1.
	[ t < 5 ] whileTrue: [ t := t + 1. ].
	[ t > 10 ] whileFalse: [ t := t * 2 ].
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>example2Loops2 [
	| t |
	t := 1.
	[ t < 5 ] whileTrue: [ [ t > 10 ] whileFalse: [ t := t * 2 ]. t := t + 1. ].
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleAnd [
	| tmp1 tmp2 |
	tmp1 := true.
	tmp2 := false.
	tmp1 and: tmp2.
	^ tmp2 and: tmp1
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleAnd2 [
	| tmp1 |
	tmp1 := true.
	tmp1 and: [ tmp1 not ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleAndOr [
	| t1 t2 |
	t1 := true.
	t2 := false.
	t1 and: [ t2. '1' logCr ]. "effect"   
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleAndOr2 [
	| tmp1 tmp2 |
	tmp1 := true.
	tmp2 := false.
	tmp2
		ifTrue: [  ]
		ifFalse: [ '2' logCr ].
	^ self
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleAndOr3 [
	| t1 t2 |
	t1 := true.
	t2 := false.  
	^ t1 and: [ t2 ] "value" 
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleAndOr4 [
	| tmp1 tmp2 |
	tmp1 := true.
	tmp2 := false.
	^ tmp2
		ifTrue: [ true ]
		ifFalse: [ tmp1 ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleAndOr5 [
	| t1 t2 |
	t1 := true.
	t2 := false.  
	^ t2 or: [ t1 and: [ t2 ] ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleAndOr6 [
	| t1 t2 |
	t1 := true.
	t2 := false.  
	^ t1 and: [ t2 or: [ t1 ] ]
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockArgument [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockExternal [
	| t |
	t := 1.
	^[t] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockExternal2 [
	| t1 t2 |
	t1 :=  t2 := 1.
	^[t1 + t2] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockExternalArg [
	| t  |
	t := 1.
	^[:a | t + a] value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockExternalNested [
	| t s |
	t := s := 1.
	^[[s] value +   t   ] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockInternal [
	
	^[ | t | t := 1. t] value
]

{
	#category : #'examples - blocks',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockIntoCascade [
	| t |
	t := {true.
	true.
	false}.
	^ t
		size;
		collect: [ :aBoolean | 
					| tmp2 |
					tmp2 := true.
					aBoolean and: [ tmp2 ] ];
		yourself
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockMethodArgument: arg [
	|  block |
	block := [ :blockarg | blockarg + arg].
	self assert: ((block value: 2) = (arg + 2)).
	^block value: 2
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockNested [
	
	^[ [1] value] value
]

{
	#category : #'examples - blocks',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockNumCopied [
	| t1 |
	t1 := OrderedCollection new.
	iVar := {(1 -> 2.3 -> 4.5 -> 6)}.
	^ iVar keysAndValuesDo: [ :key :value | t1 add: (value -> key) ]
]

{
	#category : #'examples - blocks',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleBlockWithArg [
	^ {1.2.3} collect: [ :aNumber | aNumber + 1 ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascade [
	^ 1 
		+ 2;
		- 4;
		min: 6;
		yourself
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascade2 [
	^ true
		ifTrue: [ 1 + 2 ];
		and: [ false ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascade3 [
	^ true
		asBit;
		xor: false
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascade4 [
	| t1 |
	t1 := true
		asBit;
		xor: false.
	^ t1
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascadeIfFalse [
	| tmp1 |
	tmp1 := true value
		not;
		and: [ false ];
		yourself.
	tmp1
		ifFalse: [ ^ false ]
]

{
	#category : #'examples - cascades',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascadeIfNil [
	^ {true} asOrderedCollection
		size;
		add: (true ifNil: [ false ]);
		yourself
]

{
	#category : #'examples - cascades',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascadeIfTrueIfFalse [
	^ true 
		not;
		ifTrue: [ 'A' ];
		or: [ true ];
		yourself
]

{
	#category : #'examples - cascades',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascadeIfTrueIfFalse2 [
	^ {true} asOrderedCollection
		size;
		add:
				(1=1
						ifTrue: [ 'A' ]
						ifFalse: [ 'B' ])
]

{
	#category : #'examples - cascades',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascadeIntoBlockIntoCascade [
	| t |
	t := {true.
	true.
	false}.
	^ t
		size;
		collect: [ :aBoolean | aBoolean not;value ]
]

{
	#category : #'examples - cascades',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascadeIntoBlockWithTempIfTrueIfFalse [
	| t |
	t := OrderedCollection new.
	t yourself
		add: {1};
		add: {2};
		add: {3};
		collect: [ :anArray | 
					anArray
						collect: [ :aNumber | 
									aNumber isNumber
										ifFalse: [ anArray first ] ];
						collect: [ :aNumber | 
									aNumber isNumber
										ifTrue: [ 
											aNumber even
												ifTrue: [ #('even') ]
												ifFalse: [ #('odd') ] ]
										ifFalse: [ 0 ] ] ]
]

{
	#category : #'examples - cascades',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascadeIntoBlockWithTempIntoCascade [
	| t |
	t := {{true}.
	{true}.
	{false}}.
	^ t
		size;
		collect: [ :aBooleanArray | 
					aBooleanArray
						size;
						collect: [ :aBoolean | 
									| aSecondBoolean aThirdBoolean |
									aSecondBoolean := true.
									aThirdBoolean := false.
									aBoolean
										not;
										or: [ aSecondBoolean ];
										and: [ aThirdBoolean ];
										value ] ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCascadeNested [
	^ 1 
		+ (#(1 2 3) at: 2 put: 5; size);
		- 4;
		min: 6;
		yourself
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOf [
	^ 5
		caseOf:
			{([ 1 ] -> [ #CAIRO_FONT_SLANT_NORMAL ]).
			([ 3 ] -> [ #CAIRO_FONT_SLANT_ITALIC ]).
			([ 5 ] -> [ #CAIRO_FONT_SLANT_OBLIQUE ])}
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOf2 [
	^ 5 caseOf: {([ 5 ] -> [ #CAIRO_FONT_SLANT_OBLIQUE ])}
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOf3 [
	| t1 |
	5
		caseOf:
			{([ 1 ] -> [ t1 := #CAIRO_FONT_SLANT_NORMAL ]).
			([ 3 ] -> [ t1 := #CAIRO_FONT_SLANT_ITALIC ]).
			([ 5 ] -> [ t1 := #CAIRO_FONT_SLANT_OBLIQUE ])}.
	^ t1
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOf4 [
	| t1 |
	5
		caseOf:
			{([ 1 ] -> [ t1 := {#CAIRO_FONT_SLANT_NORMAL} first ]).
			([ 3 ] -> [ t1 := #CAIRO_FONT_SLANT_ITALIC ]).
			([ 5 ] -> [ t1 := #CAIRO_FONT_SLANT_OBLIQUE ])}
		otherwise: [ t1 := #NIL ].
	^ t1
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOf5 [
	| t1 |
	5
		caseOf:
			{([ 1 ] -> [ t1 := #CAIRO_FONT_SLANT_NORMAL ]).
			([ 3 ] -> [ t1 := #CAIRO_FONT_SLANT_ITALIC ]).
			([ 5 ] -> [ t1 := #CAIRO_FONT_SLANT_OBLIQUE ])}
		otherwise: [ ].
	^ t1
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOf6 [
	| t1 |
	5
		caseOf:
			{([ 1 ] -> [ t1 := {#CAIRO_FONT_SLANT_NORMAL} first]).
			([ 3 ] -> [ t1 := #CAIRO_FONT_SLANT_ITALIC ]).
			([ 5 ] -> [ t1 := #CAIRO_FONT_SLANT_OBLIQUE ])}
		otherwise: [ t1 := #NIL ].
	^ t1
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOf7 [
	| t1 |
	5
		caseOf:
			{([ 1 ]
				-> [ 
					t1 := 2.
					t1 := t1 + 1 ]).
			([ 3 ] -> [ t1 := {#CAIRO_FONT_SLANT_ITALIC} first ]).
			([ 5 ] -> [ t1 := #CAIRO_FONT_SLANT_OBLIQUE ])}
		otherwise: [ t1 := #NIL ].
	^ t1
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOf8 [
	9
		caseOf:
			{([ 0 ] -> [ 0 @ 0 ]).
			([ 9 ] -> [ 1 @ 1 ]).
			([ 3 ] -> [ -1 @ 1 ])}.
	^ true
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCaseOfOtherwise [
	^ 5
		caseOf:
			{([ 1 ] -> [ #CAIRO_FONT_SLANT_NORMAL ]).
			([ 3 ] -> [ #CAIRO_FONT_SLANT_ITALIC ]).
			([ 5 ] -> [ #CAIRO_FONT_SLANT_OBLIQUE ])}
		otherwise: [ #NULL ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleClassVar [
	CVar := 1.
	^ CVar
]

{
	#category : #'examples - blocks',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleCopyingBlock [
	| t |
	t := true.
	^ [ t ifTrue: [ 5 + t asBit ]. t ].
]

{
	#category : #examples-pragmas,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleDoublePrimitive [
	<primitive: 1>
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleEffectValues [
	#getMe.
	#( got that ? ).
	Class.
	
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleEmptyMethod [

]

{
	#category : #'examples - blocks',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleFullBlock [
	| t |
	t := true.
	^ [ t := false ].
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIV [
	iVar := 5.
	^ iVar
	
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalse [
	true
		ifTrue: [  ]
		ifFalse: [ ^ 1 ].
	^ 2
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalse2 [
	^ true ifFalse: [ ^ 'result' ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalse3 [
	1 < 2 ifFalse: [ ^ 'result' ].
	1+2.
	^ nil
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalseIfTrue [
	true ifFalse: [^1] ifTrue: [^2].
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalseIfTrue2 [
	| a |
	a := true.
	a ifFalse: [ a := 1 + 2 ] ifTrue: [ a := 2 + 3 ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalseIfTrue3 [
	| a |
	a := true.
	a ifFalse: [ a := false  ] ifTrue: [ ^1 ].
	^ 2
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalseIfTrue4 [
	| a |
	a := true.
	a ifFalse: [ 1 + 2 ] ifTrue: [ ^1 ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalseIfTrue5 [
	| a |
	a := true.
	a ifFalse: [ ^1 ] ifTrue: [ 1 + 2 ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfFalseIfTrue6 [
	| a |
	a := true.
	^ a ifFalse: [ ] ifTrue: [ ^1 ].
	
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNil [
	true ifNil: [ ^ 5 ]. ^ 6 
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNilClosure [
	^ iVar ifNil: [ 1 + ({1.2} at: 2 ifAbsent: [ ^ nil ]) ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNilDup [
	^ true ifNil: [ 1+2. 5 ]   
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNilIfNotNil [
	true ifNil: [ ^ 5 ] ifNotNil: [ ^ 6 ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNilIfNotNil2 [
	^ true ifNil: [  5 ] ifNotNil: [ 6 ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNilIfNotNil3 [
	| tmp1 |
	tmp1:= true.
	^ tmp1 ifNil: [  5 ] ifNotNil: [ 6 ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNilNested [
	^ true ifNil: [ (false ifNil: [ ^ true ]) not ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNotNilArg [
	^1 even ifNotNil: [ :arg | arg not ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNotNilDup [
	^ true ifNotNil: [ 5 ]     
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfNotNilReturnNil [
	^nil ifNotNil: [ :arg | arg not ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrue [
	[ 1 < 2
		ifTrue: [ ^ 'result' ]] value
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrue2 [
	^ 1 < 2 ifTrue: [ ^ 'result' ]
	  
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrue3 [
	1 < 2 ifTrue: [ ^ 'result' ].
	^ nil
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueAssign [
	| a |
	a := 1 <2 ifTrue: [1] ifFalse: [2].
	^a 
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueForEffectNested [
	| tmp1 |
	true
		ifTrue: [ 
			tmp1 := true.
			false
				ifTrue: [ 
					tmp1 := false.
					^ tmp1 ] ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueIfFalse [
	 1 <2 ifTrue: [^'result'] ifFalse: [2].
	
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueIfFalse2 [
	| a |
	a := true.
	a ifTrue: [ a:= 1 + 2 ] ifFalse: [ a := 2 + 3 ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueIfFalse3 [
	| a |
	a := true.
	a ifTrue: [ ^ 1 ] ifFalse: [ a := false ].
	^ 2
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueIfFalseLikeAnd [
		| t1 |
	t1 := true.
	^ t1 ifTrue: [ t1 not ] ifFalse: [ false ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueIfFalseNested [
	^ true ifTrue: [ false ifFalse: [ ^ 4 ] ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueIfFalseNested2 [
	true ifFalse: [ false ifTrue: [ ^ false ]. ^ true ]. ^ nil
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueIfFalseNested3 [
	^ {1.2.3.4}
		collect: [ :aNumber | 
			aNumber isNumber
				ifTrue: [ 
					aNumber even
						ifTrue: [ #('even') ]
						ifFalse: [ #('odd') ] ]
				ifFalse: [ 0 ] ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueNested [
	true ifTrue: [ 
		false ifTrue: [ ^ false ].
		^ true ].
	^ nil
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueWithNilAssertion [
	| tmp1 |
	tmp1 := 1.
	tmp1 > 2
		ifTrue: [ tmp1 := nil ]
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleIfTrueWithOr [
	false | true
		ifTrue: [ ^ true ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleInlineBlockCollectionLR3 [
	| col |
	col := OrderedCollection new.
	1 to: 11 do: [ :each | | i | i := each. col add: [ i ]. i := i + 1 ].
	^ (col collect: [ :each | each value ]) asArray "= (2 to: 12) asArray"

]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleMethodTempInNestedBlock [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleMethodWithOptimizedBlocksA [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleNestedBlockScoping [

	| b c z |
	b := [:a | 
			z := 2.
			z + a].
	c := [:a |
			z + a].
	^ (b value: 2) + (c value: 1)
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleNestedIfNilIfNotNil [
	^ true
		ifNotNil: [ 1 ]
		ifNil: [ false 
			ifNotNil: [ 2 ] 
			ifNil: [ ^ true ] ]
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleNewArray [

	| temp |
	
	temp := Array new: 3.
	^temp
]

{
	#category : #'examples - branches',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleOr [
	| t1 |
	t1 := false.
	^ t1 or: [ t1 not ]
]

{
	#category : #examples-pragmas,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>examplePrimitiveErrorCode [
	
	<primitive: 60 error: code >
	
	^ code


]

{
	#category : #examples-pragmas,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>examplePrimitiveErrorCodeModule [
	"Primitive. Attempt to load a module of the given name.
	Fail if module cannot be found, or cannot be loaded,
	or failed to initialize"

	<primitive: 'primLoadModule'  module: '' error: #errorCode >
	^ self primitiveFailed
]

{
	#category : #'examples - pragmas',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>examplePrimitiveErrorCodeModule2 [
	"Primitive. Attempt to load a module of the given name.
	Fail if module cannot be found, or cannot be loaded,
	or failed to initialize"

	<primitive: 'primLoadModule'  module: '' error: errorCode >
	^ self primitiveFailed
]

{
	#category : #examples-misc,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>examplePushArray [
	| t |

	{1 .t:=1}.
	^t
]

{
	#category : #examples-misc,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>examplePushBigArray [
	"This array should have a size more than 127 elements"
	self flag: 'needs a fix'.
	{ 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 .  255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 . 255 }.
	^ 1
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleRepeatEffect [
	<compilerOptions: #(#+ #optionInlineRepeat)>
	| i |
	i := 1.
	[ 
	i := i + 1.
	i = 10
		ifTrue: [ ^ true ] ] repeat
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleRepeatValue [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleReturn1 [
	^1
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleReturn1plus2 [
	^1+2
]

{
	#category : #examples-simple,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleReturn42 [
	^42
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSelf [
	| t |
	t := self.
	^self.
]

{
	#category : #'examples - simple',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSend [
	self basicSize 
]

{
	#category : #'examples - simple',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSend2Args [
	self instVarAt: 1 put: #banana
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlock [
	^[1].
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockArgument1 [
	^[:a | a ] value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockArgument2 [
	^[:a :b | a + b ] value: 1 value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockArgument3 [
	^[:a :b :c | a + b + c ] value: 1 value: 1 value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockArgument4 [
	^[:a :b :c :d | a + b + c  + d] value: 1 value: 1 value: 1 value: 1. 
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockArgument5 [
	^[:a :b :c :d :e| a + b + c  + d + e] valueWithArguments: #(1 1 1 1 1). 
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockEmpty [
	^[] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockLocal [
	^[ :each | | t |  t:= each. t   ] value: 5.
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockLocalIf [
	^true ifTrue: [ | hallo |  hallo := 1 . hallo].
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockLocalIfNested [
	^true ifTrue: [| hallo |  [  hallo := 1 . hallo] value] .
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockLocalWhile [
	|a|
	a := true.
	^[: b | [a] whileTrue: [ | hallo |  a := false. hallo := 1 . hallo]]value: 1.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockNested [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockReturn [
	[^1] value.
]

{
	#category : #examples-blocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSimpleBlockiVar [
	^[iVar] value.
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleSuper [
	| t |
	t := super.
	^super.
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleThisContext [
	| t |
	t := thisContext.
	^thisContext.
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleTimesRepeatEffect [
	| foo |
	foo := 1.
	5 timesRepeat: [ foo := foo + 3 ] . 
	^ foo
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleTimesRepeatValue [
	^ 5 timesRepeat: [ 1 + 2 ]   
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToByDo [
	| tmp1 |
	tmp1 := {true.	true.	true}.
	1 to: 9 by: 3 do: [ :index | tmp1 at: index / 3  put: false ].
	^ tmp1
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToByDoNegativeLoop [
	| tmp1 |
	tmp1 := {true.	true.	true}.
	tmp1 size to: 10-9 by: -1 do: [ :index | tmp1 at: index put: false ].
	^ tmp1
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDo [
	| tmp1 tmp2 tmp3 |
	tmp1 := {true.
	true.
	true}.
	tmp2 := tmp1 size.
	tmp3 := 1.
	[ tmp3 <= tmp2 ]
		whileTrue: [ 
			tmp1 at: tmp3 put: false.
			tmp3 := tmp3 + 1 ].
	^ 1
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDo2 [
	| t |
	t := {true.true.true}.
	1 to: t size do: [ :index | t at: index put: false ].
	^ t
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDo3 [
	| t |
	t := Array new:3.
	1 to: 3 do: [ :index | t at: index put: false ].
	^ t
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDo4 [
	| tmp1 tmp2 |
	tmp1 := {true . true . true }.
	tmp2 := tmp1 size.
	1 to: tmp2 do: [ :index | tmp1 at: index put: false ].
	1 to: tmp2 do: [ :index | tmp1 at: index put: true ].
	^ tmp1
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDo5 [
	| tmp1 |
	tmp1 := {true.
	true.
	true}.
	[ 1 to: 3 do: [ :index | tmp1 at: index put: false ] ] valueWithin: 50 milliSeconds onTimeout: [  ].
	^ tmp1
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoArgument [
	collection := OrderedCollection new.
	1 to: 5 do: [ :index |
		collection add:  [index]  ].
	 ^collection collect: #value. 
	"#(1 2 3 4 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoArgumentLimitIsExpression [
	| count sum |
	count := 10.
	sum := 0.
	1 to: count - 1 do: [ :each | sum := sum + each].
	^sum
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoArgumentNotInlined [
	| block |
	block := [ :index |
		collection add: [ index ] ].
	1 to: 5 do: block.
	^collection "#(1 2 3 4 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoInsideBlock [
	| tmp1 block |
	tmp1 := {1.2.
	3.4} asOrderedCollection.
	block := [ (tmp1 at: 1) to: (tmp1 at: 4) do: [ :arg1 | Transcript show: arg1 ] ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoInsideTemp [
	1 to: 5 do: [ :index | 
		| temp | 
		temp := index. 
		collection add: [ temp ] ].
	^collection "#(1 2 3 4 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoInsideTempNotInlined [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoOutsideTemp [
	| temp |
	1 to: 5 do: [ :index | 
		temp := index. 
		collection add: [ temp ] ].
	^collection "#(5 5 5 5 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoOutsideTempNotInlined [
	| block temp |
	block := [ :index | 
		temp := index. 
		collection add: [ temp ] ].
	1 to: 5 do: block.
	^collection "#(5 5 5 5 5)"
]

{
	#category : #examples-misc,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoValue [

	^ 1 to: 2 do: [:each | each]
	

]

{
	#category : #examples-misc,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoValueLimitExpression [

	^ 2 to: 3+4 do: [:each | each]
	

]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoWithMessage [
	| t |
	t := {true.true.true}.
	^ 1 yourself to: t size do: [ :index | t at: index put: false ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleToDoWithMessage2 [
	| t t1 t2 |
	t := {true.true.true}.
	t1 := 1.
	t2 := t size.
	t1 to: t2 do: [ :index | t at: index put: false ]
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileFalse [
	| t |
	t := 1.
	[ t > 10 ] whileFalse: [ t := t + 1. 1 + 2 ]
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileFalse2 [
	| t |
	t := 1.
	[ t := t + 1. 1 + 2. t > 10 ] whileFalse
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileModificationAfterNotInlined [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileModificationBefore [
	| index |
	collection := OrderedCollection new.
	index := 0.
	[ index < 5 ] whileTrue: [ 
		index := index + 1.
		collection add: [ index ] ].
	 ^ collection collect: #value.
	"#(5 5 5 5 5)"
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileModificationBeforeNotInlined [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileNoModification [
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
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileTrue [
	| array t |
	array := {true.	true.true}.
	t := 1.
	[ t < 4 ]
		whileTrue: [ 
			array at: t put: false.
			t := t + 1 ]
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileTrue2 [
	| t |
	t := 1.
	[ 
	t := t + 1.
	1 + 2.
	t < 10 ] whileTrue
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileTrue3 [
	| t1 t2 |
	t2 := 5.
	t1 := 1.
	t1 := t1+1.
	[ t1 <= t2 ]
		whileTrue: [ 
			t1 + 2.
			t1 := t1 + 1 ]
]

{
	#category : #'examples - loops',
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileTrue4 [
	| tmp1 tmp2 |
	tmp1 := 1.
	[ tmp1 <= 5 ]
		whileTrue: [ 
			tmp1 + 2.
			tmp1 := tmp1 + 1 ].
	tmp2 := 1.
	[ tmp2 <= 5 ]
		whileTrue: [ 
			tmp1 := tmp2.
			tmp2 := tmp2 + 1 ]
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileTrueSameJumpTarget [
	| tmp1 tmp2 |
	tmp1 := 1.
	tmp2 := 10.
	[ 
	[ 
	tmp1 := tmp1 + 1.
	tmp1 < 10 ] whileTrue.
	tmp2 := tmp2 - 1.
	tmp2 > 0 ] whileTrue
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileTrueSameJumpTarget2 [
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	"need body + triple nested loop with same start"
	tmp1 := 1.
	tmp2 := 10.
	tmp3 := 3.
	tmp4 := 5.
	tmp5 := 7.
	tmp6 := 6.
	[ 
	[ 
	[ 
	[ 
	tmp5 := tmp5 * 2.
	tmp5 < 14 ] whileTrue.
	tmp4 := tmp4 + 1.
	tmp4 < 10 ] whileTrue.
	[ 
	[ 
	tmp1 := tmp1 + 1.
	tmp1 < 10 ] whileTrue.
	tmp6 := tmp6 + 3.
	tmp6 < 20 ] whileTrue.
	tmp2 := tmp2 - 1.
	tmp2 > 0 ] whileTrue.
	tmp3 := tmp1 + 1.
	tmp1 < 10 ] whileTrue
]

{
	#category : #examples-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileWithTemp [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWhileWithTempNotInlined [
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
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWithArgs: arg1 and: arg2 [
	^ arg1
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleWithArgsAndTemps: arg1 and: arg2 [
	| tmp1 tmp2 |
	tmp1 := 1.
	tmp2 := tmp1 + arg1.
	^ { tmp2 . arg2 }
]

{
	#category : #examples-variables,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>exampleiVar [
	iVar := 1.
	^iVar.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>iVar [
	^ iVar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>iVar: anObject [
	iVar := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>initialize [
	collection := OrderedCollection new
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>nestedBlocksRemoteInBlockCase1 [
	| block |
	self flag: 'Not well decompiled'.
	block := [ | a b |
		[ a := b ].
		[ b := a ] ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>nestedBlocksRemoteInBlockCase2 [
	| block |
	self flag: 'Not well decompiled'.
	block := [ 
		[ |a| [ a := 1] ].
		[ |b| [ b := 2] ] ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>nestedBlocksRemoteInBlockCase3 [
	| block |
	self flag: 'Not well decompiled'.
	block := [ 
		[ |a| block := [ a := 1] ].
		[ |b| block := [ b := 2] ] ].
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>noRemoteBlockArgument [
	| block block1 block2 |
	block := [ :arg | | temp | temp := arg. [ temp ] ].
	block1 := block value: 1.
	block2 := block value: 2.


]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>noRemoteBlockTemp [
	| block block1 block2 |
	block := [ :arg | [ arg ] ].
	block1 := block value: 1.
	block2 := block value: 2.



]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>noRemoteReadInBlock [
	| a |
	a := 1.
	[ a ]


]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>noRemoteReadNestedBlocks    [
	 [ |a| a := 1.
       [ a ]]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>optimizedBlockWriteInBlock [
	| t1 |
	[ t1 < 5 ] whileTrue: [ t1 := 1 ].

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>optimizedBlockWriteInNestedBlock [
	| t1 |
	^[ [ t1 < 5 ] whileTrue: [ t1 := 1 ] ]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>optimizedBlockWriteInNestedBlockCase2 [
	| t1 |
	(true) ifTrue: [ [ t1 < 5 ] whileTrue: [ t1 := 1 ] ]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>optimizedBlockWriteInNestedBlockCase3 [
	| t1 |
	[(true) ifTrue: [ [ t1 < 5 ] whileTrue: [ t1 := 1 ] ] ]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>optimizedBlockWriteInNestedBlockCase4 [
	| t1 |
	[(true) whileTrue: [ [ t1 < 5 ] whileTrue: [ t1 := 1 ] ] ]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>optimizedBlockWriteReadInBlock [
	| t1 |
	[ t1 < 5 ] whileTrue: [ t1 := 1. [ t1 ] ].

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>optimizedBlockWrittenAfterClosedOverCase1 [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>optimizedBlockWrittenAfterClosedOverCase2 [
	| index |
	index := 0.
	[ index < 5 ] whileTrue: [
		| temp |
		temp := index := index + 1.
		 [ temp ] ].

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>singleRemoteDifferentBlocksSameArgumentName [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>singleRemoteMethodArgument [
	| temp block |
	temp := 0.
	block := [ [ temp ] ].
	temp := 1.
	block := block value.
	temp := 2.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>singleRemoteReadNestedBlocks    [
	|a| 
	[  a := 1.
       [ a ]]

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>singleRemoteTempVar [
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
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>singleRemoteTempVarWrittenAfterClosedOver [
	| index block |
	index := 0.
	block := [ index ].
	index := index + 1.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDExamples>>writtenAfterClosedOver [
	| a |      
	[ a ].
	a := 1
]
