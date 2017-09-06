Extension {
	#name : #Collection
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Collection class>>fromSton: stonReader [
	| collection |
	collection := self new.
	stonReader parseListDo: [ :each |
		collection add: each ].
	^ collection
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Collection>>stonOn: stonWriter [
	stonWriter writeObject: self do: [
		stonWriter encodeList: self ]

]
