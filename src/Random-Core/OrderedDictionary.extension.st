Extension {
	#name : #OrderedDictionary
}

{
	#category : #'*Random-Core',
	#timestamp : ' 8/31/2017 07:16:42'
}
OrderedDictionary>>atRandom: aGenerator [
	| rand |
	self emptyCheck.
	rand := aGenerator nextInt: self size.
	^ self at: (self orderedKeys at: rand) 
]
