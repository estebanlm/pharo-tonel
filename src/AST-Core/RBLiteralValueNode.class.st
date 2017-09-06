"
RBLiteralNode is an AST node that represents literal values (e.g., #foo, true, 1, etc.), but not literal arrays.

The sourceText field is needed for the formatter for the correct printing of strings vs. symbols. If we just call
value asString, both a string and a symbol print itself as a string.

Instance Variables
	value	<Numeric | Symbol | String  | Character>	the literal value I represent
	sourceText <String> the original source text of this literal
"
Class {
	#name : #RBLiteralValueNode,
	#superclass : #RBLiteralNode,
	#instVars : [
		'value',
		'sourceText'
	],
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 14:11'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode class>>value: aValue [
	^ self value: aValue start: 0 stop: -1
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode class>>value: aValue start: aPosition stop: anotherPosition  [
 	^ self new
		value: aValue start: aPosition stop: anotherPosition;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode class>>value: aValue start: aPosition stop: anotherPosition  source: aString  [
 	^ self new
		value: aValue start: aPosition stop: anotherPosition source: aString;
		yourself.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode>>= anObject  [
	^ super = anObject 
		and: [ self value = anObject value 
		and: [ self value species = anObject value species ] ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitLiteralNode: self
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode>>copyInContext: aDictionary [
	^ self class value: self value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode>>isFaulty [
	^false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode>>sourceText [
	^ sourceText ifNil: [
		String streamContents: [:aStream|			
			value isSymbol
				ifTrue: [
					aStream nextPut: $#.
					((RBScanner isSelector: value) and: [value ~~ #'||']) 
						ifTrue: [aStream nextPutAll: value]
						ifFalse: [value asString printOn: aStream]]
				ifFalse: [ 
					value class == Character 
						ifTrue: 
							[aStream nextPut: $$;	nextPut: value]
						ifFalse: [ value storeOn: aStream ]]] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode>>value [
	^ value
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode>>value: aValue start: aPosition stop: anotherPosition [

	value := aValue.
	start := aPosition. 
	stop := anotherPosition.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralValueNode>>value: aValue start: aPosition stop: anotherPosition source: aString  [

	self value: aValue start: aPosition stop: anotherPosition.
	sourceText := aString.
]
