"
I filter given strings by checking substrings inclusion
"
Class {
	#name : #FTSubstringFilter,
	#superclass : #FTFilter,
	#category : #Morphic-Widgets-FastTable-Functions,
	#timestamp : 'DenisKudryashov 6/24/2016 16:10'
}

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTSubstringFilter>>matches: aString [
	^aString includesSubstring: pattern caseSensitive: false
]
