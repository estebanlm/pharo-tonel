"
I am filter implemented by regex expressions

Internal Representation and Key Implementation Points.

    Instance Variables
	regex:		<RxMatcher>
"
Class {
	#name : #FTRegexFilter,
	#superclass : #FTFilter,
	#instVars : [
		'regex'
	],
	#category : #Morphic-Widgets-FastTable-Functions,
	#timestamp : 'DenisKudryashov 6/24/2016 16:09'
}

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRegexFilter>>matches: aString [
	^(regex matchesIn: aString) notEmpty 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRegexFilter>>pattern: aString [
	super pattern: aString.
	
	regex := aString asRegexIgnoringCase
]
