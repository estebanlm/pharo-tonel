Extension {
	#name : #Collection
}

{
	#category : #'*GT-Spotter',
	#timestamp : ' 8/31/2017 05:26:36'
}
Collection>>gtIterator [
	^ [ :filter | self do: filter ] gtIterator
]
