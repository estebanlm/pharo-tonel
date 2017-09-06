Extension {
	#name : #Collection
}

{
	#category : #'*Network-Mail',
	#timestamp : ' 8/31/2017 05:26:23'
}
Collection>>asEmailHeaderString [

	^ String streamContents: [ :str | 
			self
				do: [ :e | str nextPutAll: e asEmailHeaderString ]
				separatedBy: [ str nextPutAll: ', ' ] ]
]
