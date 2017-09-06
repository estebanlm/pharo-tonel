"
CompilerTest is a holder for SUnit test of Compiler
"
Class {
	#name : #OCCompilerTest,
	#superclass : #TestCase,
	#instVars : [
		'errorMessage',
		'errorLocation',
		'errorSource',
		'interactive',
		'text'
	],
	#category : #OpalCompiler-Tests-FromOld,
	#timestamp : 'nice 12/3/2007 22:15'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>compile [
	^ self compileWithFailBlock: [^ nil]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>compileWithFailBlock: aBlock [
	^ OpalCompiler new 
		source: text;
		class: MockForCompilation;
		requestor: self;
		failBlock: aBlock;
		translate.

]

{
	#category : #mocking,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>initializeErrorMessage [
	errorMessage := nil.
	errorLocation := nil.
	errorSource := nil
]

{
	#category : #mocking,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>interactive [
	^interactive
]

{
	#category : #mocking,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>notify: aString at: aSmallInteger in: aReadStream  [
	errorMessage := aString.
	errorLocation := aSmallInteger.
	errorSource := aReadStream.
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>runCase [
	SystemAnnouncer uniqueInstance suspendAllWhile: [ super runCase ]

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>setUp [
	Smalltalk globals at: #OCCompilerTestTestVar put: MockForCompilation.
	
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>tearDown [
	Smalltalk globals removeKey: #OCCompilerTestTestVar
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>tempTraitShadowingString [

	^ 'testReplaceFromToWithStartingAt
	| result  repStart collection replacementCollection firstIndex secondIndex |
		replacementCollection := 1.'
]

{
	#category : #'test readonly vars',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testAssignmentOfClassNameBinding [
	interactive := true.
	self initializeErrorMessage.
	text := 'temp | | MockForCompilation := nil'.

	self
		compileWithFailBlock: [ self assert: errorMessage = 'Cannot store into ->'.
			self assert: errorLocation = 10.
			self assert: errorSource contents = 'temp | | MockForCompilation := nil'.
			^ nil ].
	self fail
]

{
	#category : #'test readonly vars',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testAssignmentOfGlobalVarBinding [
	interactive := true.
	self initializeErrorMessage.
	text := 'temp | | OCCompilerTestTestVar := 2'.
	self initializeErrorMessage.
	OpalCompiler new
		source: text;
		class: MockForCompilation;
		requestor: self;
		failBlock: [ self fail.
			^ nil ];
		translate
]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testEmptyCharacterFail [

]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testInBlockArgumentInstanceVariableShadowing [
	interactive := true.
	self initializeErrorMessage.
	text := 'temp [:var1 | ]'.
	
	self compile.
	
	self flag: 'display menu instead of going into failblock'.
	
	self assert: (errorMessage = 'Name already defined ->').
				self assert: (errorLocation = 8).
				self assert: (errorSource contents = 'temp [:var1 | ]').
				

]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testInBlockTempArgumentShadowing [
	interactive := true.
	self initializeErrorMessage.
	text := 'temp [:temp | |temp|]'.

	self compileWithFailBlock: [
				self assert: (errorMessage = 'Name already defined ->').
				self assert: (errorLocation = 16).
				self assert: (errorSource contents = 'temp [:temp | |temp|]').
						^nil].
	self fail.

]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testInBlockTempInstanceVariableShadowing [
	interactive := true.
	self initializeErrorMessage.
	text := 'temp [:temp | |var1|]'.

	self compileWithFailBlock: [
				self assert: (errorMessage = 'Name already defined ->').
				self assert: (errorLocation = 16).
				self assert: (errorSource contents = 'temp [:temp | |var1|]').
				^nil].
	self fail.
]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testInBlockTempShadowing [

	interactive := true.
	self initializeErrorMessage.
	text := 'temp |var2| [:temp| |var2|]'.

	self compileWithFailBlock: [
				self assert: (errorMessage = 'Name already defined ->').
				self assert: (errorLocation = 22).
				self assert: (errorSource contents = 'temp |var2| [:temp| |var2|]').
				^nil].
	self fail.



]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testInstanceVariableShadowing [

	interactive := true.
	self initializeErrorMessage.
	text := 'var1 |var1|'.

	self compileWithFailBlock: [
					self assert: (errorMessage = 'Name already defined ->').
					self assert: (errorLocation = 7).
					self assert: (errorSource contents = 'var1 |var1|').
					^nil].
	self fail.


]

{
	#category : #literals,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNegativeZero [
	self assert: (OpalCompiler evaluate: '-0.0') hex = Float negativeZero hex.
]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNoShadowing [
	interactive := true.
	self initializeErrorMessage.
	text := 'temp |var2|  var2:=1'.

	self compileWithFailBlock: [
		self fail.
		^nil ].
	


]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNotInteractiveInBlockArgumentInstanceVariableShadowing [

	interactive := false.
	self initializeErrorMessage.

	self 
		should: [ 
			OpalCompiler new 
				source: 'temp [:var1 | ]';
				class: MockForCompilation;
				translate.
		] 
		raise: OCShadowVariableWarning 
		withExceptionDo: [ :ex |
			self 
				assert: ex warningMessage 
				equals: 'MockForCompilation>>temp(var1 is shadowed)'
		].

]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNotInteractiveInBlockTempArgumentShadowing [
	
	interactive := false.
	self initializeErrorMessage.
	self 
		should: [ 
			OpalCompiler new
				source: 'temp [:temp | |temp|]';
				class: MockForCompilation;
				requestor: self;
				translate.
		] 
		raise: OCShadowVariableWarning 
		withExceptionDo: [ :ex |
			self 
				assert: ex warningMessage 
				equals: 'MockForCompilation>>temp(temp is shadowed)'
		].
]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNotInteractiveInBlockTempInstanceVariableShadowing [
	
	interactive := false.
	self initializeErrorMessage.
	self 
		should: [ 
			OpalCompiler new
				source: 'temp [:temp | |var1|]';
				class: MockForCompilation;
				requestor: self;
				failBlock: [self fail. ^ nil];
				translate.
		] 
		raise: OCShadowVariableWarning 
		withExceptionDo: [ :ex |
			self 
				assert: ex warningMessage 
				equals: 'MockForCompilation>>temp(var1 is shadowed)'
		].
	
]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNotInteractiveInBlockTempShadowing [
	
	interactive := false.
	self initializeErrorMessage.
	self 
		should: [ 
			OpalCompiler new
				source: 'temp |var2| [:temp| |var2|]';
				class: MockForCompilation;
				requestor: self;
				failBlock: [self fail];
				translate.
		] 
		raise: OCShadowVariableWarning 
		withExceptionDo: [ :ex |
			self 
				assert: ex warningMessage 
				equals: 'MockForCompilation>>temp(var2 is shadowed)'
		].


]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNotInteractiveNoShadowing [

	interactive := false.
	self initializeErrorMessage.

	self shouldnt: [ 
		OpalCompiler new
			source: 'temp |var2|';
			class: MockForCompilation;
			requestor: self;
			failBlock: [self fail. ^ nil ];
			translate.
	] raise: OCShadowVariableWarning.
	



]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNotInteractiveShadowingOfTemp [

	interactive := false.
	self initializeErrorMessage.
	self 
		should: [ 
			OpalCompiler new
				source: 'temp |temp1 temp1| ';
				class: MockForCompilation;
				requestor: self;
				translate.
		] 
		raise: OCShadowVariableWarning 
		withExceptionDo: [ :ex |
			self 
				assert: ex warningMessage 
				equals: 'MockForCompilation>>temp(temp1 is shadowed)'
		].
	
]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNotInteractiveSiblingBlocksInstanceVariableShadowing [

	interactive := false.
	self initializeErrorMessage.
	self 
		should: [ 
			OpalCompiler new
				source: 'temp [:temp | ].[:temp | |var1|]';
				class:  MockForCompilation;
				requestor: self; 
				failBlock: [self fail. ^ nil ];
				translate.
		] 
		raise: OCShadowVariableWarning 
		withExceptionDo: [ :ex |
			self 
				assert: ex warningMessage 
				equals: 'MockForCompilation>>temp(var1 is shadowed)'
		].


	
]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testNotInteractiveSiblingBlocksTempShadowing [

	interactive := false.
	self initializeErrorMessage.

	self shouldnt: [ 
		OpalCompiler new
			source: 'temp [:temp | ]. [:temp | ]';
			class: MockForCompilation;
			requestor: self;
			failBlock: [self fail. ^nil];
			translate
	] raise: OCShadowVariableWarning.




	
					


]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testReservedNameAsBlockArgumentShadowing [
	
	interactive := true.
	#( 'self' 'super' 'thisContext' 'true' 'false' 'nil' ) do: [ :each |
		self initializeErrorMessage.
		[ :exit | 
			OpalCompiler new 
				source: 'temp ^ [ :' , each , ' | ^ ' , each , ' ]';
				class: MockForCompilation;
				requestor: self;
				failBlock: [ exit value ];
				translate.
			self fail ] valueWithExit.
		self assert: ((errorMessage = 'Variable name expected ->' )or: [ errorMessage =  'Name already defined ->' ]).
		self assert: errorLocation = 11 ]
]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testReservedNameAsMethodArgumentShadowing [

	interactive := true.
	#( 'self' 'super' 'thisContext' 'true' 'false' 'nil' ) do: [ :each |
		self initializeErrorMessage.
		[ :exit | 
			OpalCompiler new 
				source: 'temp: ' , each , ' ^ ' , each;
				class:  MockForCompilation;
				requestor: self;
				failBlock: [ exit value ];
				translate.
			self fail ] valueWithExit.
		self assert: ((errorMessage = 'Variable name expected ->' )or: [ errorMessage =  'Name already defined ->' ]).
		self assert: errorLocation = 7 ]
]

{
	#category : #literals,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testScaledDecimalLiterals [
	"Equal ScaledDecimal with different scales should use different slots
	This is related to http://bugs.squeak.org/view.php?id=6797"
	
	"This correctly works when evaluated separately"
	self deny: (Smalltalk compiler evaluate: '0.5s1') scale = (Smalltalk compiler evaluate: '0.5s2') scale.
	
	"But not when evaluated together if literal reduction is too agressive"
	self deny: (Smalltalk compiler evaluate: '0.5s1 scale =  0.5s2 scale').
]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testSiblingBlocksInstanceVariableShadowing [

	interactive := true.
	self initializeErrorMessage.
	
	OpalCompiler new
		source: 'temp [:temp | ].[:temp | |var1|]';
		class: MockForCompilation;
		requestor: self;
		failBlock: [
				self assert: (errorMessage = 'Name already defined ->').
				self assert: (errorLocation = 27).
				^nil];
		translate.
	self fail.


	
]

{
	#category : #'test shadowing',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testSiblingBlocksTempShadowing [

	interactive := true.
	self initializeErrorMessage.

	OpalCompiler new
		source: 'temp [:temp | ]. [:temp | ]';
		class: MockForCompilation;
		failBlock: [self fail. ^ nil ];
		translate.
				



	
					


]

{
	#category : #'test shadowing2',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>testTraitTempShadowing [
	
	| warningCount |
	
	warningCount := 0.
	
	self initializeErrorMessage.
	
	[ 
			OpalCompiler new 
				source: self tempTraitShadowingString;
				class: ArrayTest;
				failBlock: [self fail.];
				translate.
	] 
	on: OCShadowVariableWarning 
	do: [ :ex | 
		warningCount := warningCount + 1.
		self 
			assert: ex warningMessage 
			equals: (self traitTempShadowingWarnings at: warningCount).
		
		ex resume
	].

	self assert: warningCount equals: 3
]

{
	#category : #mocking,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>text [
	^ text
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerTest>>traitTempShadowingWarnings [

	^ #(	
		'ArrayTest>>testReplaceFromToWithStartingAt(replacementCollection is shadowed)'
		'ArrayTest>>testReplaceFromToWithStartingAt(firstIndex is shadowed)'
		'ArrayTest>>testReplaceFromToWithStartingAt(secondIndex is shadowed)'
	)
]
