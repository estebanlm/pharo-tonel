Extension {
	#name : #Date
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
Date>>epiceaBrowsersAsString [

	| numberOfDaysAgo |
	numberOfDaysAgo := self class today subtractDate: self.

	numberOfDaysAgo < 2 ifTrue: [
		^ String streamContents: [:stream | 
			stream nextPutAll: (numberOfDaysAgo = 0 
				ifTrue: [ 'Today' ]
				ifFalse: [ 'Yesterday'] ) ]].

	(numberOfDaysAgo between: 2 and: 7) ifTrue: [ 
		^ numberOfDaysAgo asString, ' days ago' ].

	^ self asDate asString

]
