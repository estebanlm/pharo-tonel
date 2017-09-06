"
I am root of filter classes which are used by FTFilterFunction

My subclasses shoud implement method #matches: to filter given strings.

Public API and Key Messages

- matches: aString   
 
Internal Representation and Key Implementation Points.

    Instance Variables
	pattern:		<String>
"
Class {
	#name : #FTFilter,
	#superclass : #Object,
	#instVars : [
		'pattern'
	],
	#category : #Morphic-Widgets-FastTable-Functions,
	#timestamp : 'DenisKudryashov 6/24/2016 16:08'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFilter class>>pattern: aString [
	^self new 
		pattern: aString
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFilter>>matches: aString [

	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFilter>>pattern [
	^ pattern
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFilter>>pattern: anObject [
	pattern := anObject
]
