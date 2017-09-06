Extension {
	#name : #SequenceableCollection
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
SequenceableCollection class>>fromSton: stonReader [
	^ self streamContents: [ :stream |
		stonReader parseListDo: [ :each |
			stream nextPut: each ] ]
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
SequenceableCollection>>stonOn: stonWriter [
	self class == STON listClass
		ifTrue: [ stonWriter writeList: self ]
		ifFalse: [ super stonOn: stonWriter ]
]
