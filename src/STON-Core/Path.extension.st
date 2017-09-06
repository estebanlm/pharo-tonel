Extension {
	#name : #Path
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Path class>>fromSton: stonReader [
	| elements |
	elements := Array streamContents: [ :out |
		stonReader parseListDo: [ :each | out nextPut: each ] ].
	^ self withAll: elements
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Path>>stonOn: stonWriter [
	stonWriter 
		writeObject: self 
		streamShortList: [ :listWriter | 
			self do: [ :each | listWriter add: each ] ]
]
