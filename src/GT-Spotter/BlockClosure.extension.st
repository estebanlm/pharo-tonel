Extension {
	#name : #BlockClosure
}

{
	#category : #'*GT-Spotter',
	#timestamp : ' 8/31/2017 05:26:36'
}
BlockClosure>>gtFilter [
	^ self 
]

{
	#category : #'*GT-Spotter',
	#timestamp : ' 8/31/2017 05:26:36'
}
BlockClosure>>gtIterator [
	" 1:filter 2:context[optional] "
	self assert: (self numArgs between: 1 and: 2). 
	
	^ GTSpotterBlockIterator new 
		onDo: self;
		yourself
]

{
	#category : #'*GT-Spotter',
	#timestamp : ' 8/31/2017 05:26:36'
}
BlockClosure>>hasDynamicItems [
	^ self numArgs ~= 0
]
