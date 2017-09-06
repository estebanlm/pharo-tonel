"
Same as search string source anchor but uses specific heuristics for finding a better string based on the fact that we are looking in a class definition
"
Class {
	#name : #ReVarSearchSourceAnchor,
	#superclass : #ReSearchStringSourceAnchor,
	#category : #Renraku-SourceAnchors,
	#timestamp : 'YuriyTymchuk 9/7/2016 00:09'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReVarSearchSourceAnchor>>interval [
	^ super interval allButLast 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReVarSearchSourceAnchor>>modify: aString for: aStringCollection [

	aStringCollection size = 1 ifTrue: [ 
		^ aString surroundedBySingleQuotes ].
	aStringCollection first = aString ifTrue: [ 
		^ '''', aString, String space ].
	aStringCollection last = aString ifTrue: [ 
		^ String space, aString, '''' ].
	^ aString surroundedBy: String space.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReVarSearchSourceAnchor>>searchString [
	| origString |
	
	origString := super searchString.
	(sourceEntity instVarNames includes: origString) ifTrue: [ 
		^ self modify: origString for: sourceEntity instVarNames ].
	(sourceEntity classVarNames includes: origString) ifTrue: [ 
		^ self modify: origString for: sourceEntity classVarNames ].

	^ origString
]
