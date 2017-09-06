"
I am an optimized stream for writing and reading *indexes*, i.e. positive integers with a known upper bound. 
"
Class {
	#name : #FLIndexStream,
	#superclass : #Object,
	#instVars : [
		'stream',
		'digits'
	],
	#category : #Fuel-Streams,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIndexStream class>>on: aStream digits: aNumberOfDigits [

	^ self basicNew 
		initializeOn: aStream 
		digits: aNumberOfDigits;
		yourself.

	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIndexStream>>initializeOn: aStream digits: aNumberOfDigits [

	self initialize.
	stream := aStream.
	digits := aNumberOfDigits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIndexStream>>nextIndex [
	
	| s |
	s := 0.
	1 to: digits do: 
		[:i | s := (s bitShift: 8) bitOr: stream next].
	^ s
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIndexStream>>nextIndexPut: v [

	1 to: digits do: [:i | stream nextPut: (v digitAt: digits + 1 - i)]

]
