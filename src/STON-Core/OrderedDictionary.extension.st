Extension {
	#name : #OrderedDictionary
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
OrderedDictionary class>>fromSton: stonReader [
	"My instances are stored as maps."
	
	| dictionary |
	dictionary := self new.
	stonReader parseMapDo: [ :key :value |
		dictionary at: key put: value ].
	^ dictionary
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
OrderedDictionary>>stonOn: stonWriter [
	"I store my instances as maps"
	
	stonWriter 
		writeObject: self 
		do: [ stonWriter encodeMap: self ]
]
