"
My instances are container objects used by TextDiffBuilder for comparison. They hold a string and the precomputed hash of the string to speed up #=. They may reference another DiffElement object which is their pair in the diff.

Instance Variables
	hash:		<Integer>
	match:		<DiffElement>
	string:		<String>

hash
	- the hash of string, stored for fast access

match
	- another DiffElement object which has the same string and turned out to be my pair in the longest common subsequence found by a TextDiffBuilder, or nil if I don't a matching DiffElement

string
	- a part of a longer text, typically a line

"
Class {
	#name : #DiffElement,
	#superclass : #Object,
	#instVars : [
		'string',
		'hash',
		'match'
	],
	#category : #Text-Diff,
	#timestamp : 'HenrikSperreJohansen 5/21/2010 01:41'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement class>>string: aString [

	^self new
		string: aString;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>= anObject [

	^anObject class == self class and: [
		anObject hash = hash and: [
			anObject string = string ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>hasMatch [

	^match notNil
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>hash [

	^hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>match [

	^match
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>match: aDiffMatch [

	match := aDiffMatch
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>matches: aDiffMatch [

	match := aDiffMatch.
	aDiffMatch match: self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		print: hash;
		nextPutAll: ', ';
		print: string;
		nextPutAll: ', ';
		print: (match class == self class);
		nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>string [

	^string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
DiffElement>>string: aString [

	string := aString.
	string isOctetString ifTrue: [ "Make sure that #hash will return the same value if the strings are equal."
		string := string asOctetString ].
	hash := string hash
]
