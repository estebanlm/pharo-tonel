"
I associate a type with a range of characters in a String
I have these instance variables...
	start - the one based index of the first character of the range within the String.
	end - the one based index of the last character  of the range within the String.
	type - a Symbol describing the type of the range
	
A sequence of instances of me are created by an instance of SHParserST80 which can then used by an instance of  SHTextStyler to style Text. 
"
Class {
	#name : #SHRange,
	#superclass : #Object,
	#instVars : [
		'start',
		'end',
		'type'
	],
	#category : #Shout-Parsing,
	#timestamp : 'StephaneDucasse 11/29/2011 22:28'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange class>>start: s end: e type: aSymbol  [
	^ self new
		start: s
		end: e
		type: aSymbol;
		 yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>asType [

	type == #symbol ifTrue: [ ^Symbol ].
	type == #character ifTrue: [ ^Character ].
	type == #string ifTrue: [ ^String ].
	type == #number ifTrue: [ ^Number ].
	type == #true ifTrue: [ ^True ].
	type == #false ifTrue: [ ^False ].
	type == #arrayEnd ifTrue: [ ^Array ].
	type == #byteArrayEnd ifTrue: [ ^ByteArray ].
	self isBlockEnd ifTrue: [ ^BlockClosure ].
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>end [
	^ end
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>end: anInteger  [
	end := anInteger
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>includesPosition: anInteger [
	^ anInteger between: start and: end
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isArgument [

	^type == #methodArg
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isAssignment [

	^type == #assignment or: [ type == #ansiAssignment ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isBinary [
	^type == #binary
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isBlockEnd [
	^ type beginsWith: 'blockEnd'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isBlockStart [
	^type beginsWith: 'blockStart'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isBlockTemporary [
	
	^type == #blockPatternTempVar or: [ type == #blockPatternArg ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isClassVariable [

	^type == #classVar
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isComment [
	^ type == #comment
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isConstant [
	
	^self asType notNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isGlobal [

	^type == #globalVar
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isInstanceVariable [
	
	^type == #instVar
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isKeyword [
	^ type == #keyword or:[type == #undefinedKeyword]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isOpening [
	
	^(type beginsWith: 'blockStart') or: [
		type beginsWith: 'leftParenthesis' ]
		
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isSelf [
	
	^type == #self
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isSeparator [
	
	^#(#methodTempBar #statementSeparator #patternUnary #patternArg #blockPatternArg #blockArgsBar #return #primitiveOrExternalCallEnd) identityIncludes: type
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isSuper [
	
	^type == #super
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isTemporaryVariable [
	
	^#(#tempVar #blockTempVar workspaceVar ) identityIncludes: type
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isUnfinished [
	
	^#(#unfinishedString #unfinishedComment ) identityIncludes: type
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isVariable [
	^ self isTemporaryVariable
		or: [self isInstanceVariable
				or: [self isSelf or:[self isSuper]]]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>isVariablesOnly [
	^ self isAssignment
		or: [self isVariable
				or: [self isConstant
						or: [self isSeparator or:[self isBinary]]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>length [
	^ end - start + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>start [
	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>start: anInteger  [
	start := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>start: startInteger end: endInteger type: typeSymbol  [
	start := startInteger.
	end := endInteger.
	type := typeSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>stringIn: aText [
	^ (self textIn: aText) asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>textIn: aText [
	^ aText copyFrom: self start to: self end
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>type [
	^ type
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHRange>>type: aSymbol  [
	type := aSymbol
]
