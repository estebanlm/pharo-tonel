Extension {
	#name : #Text
}

{
	#category : #'*STON-Text support',
	#timestamp : ' 8/31/2017 05:26:41'
}
Text>>fromSton: stonReader [
	stonReader parseNamedInstVarsFor: self
]

{
	#category : #'*STON-Text support',
	#timestamp : ' 8/31/2017 05:26:41'
}
Text>>stonOn: stonWriter [
	stonWriter writeObject: self
]
