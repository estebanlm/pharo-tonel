Extension {
	#name : #RunArray
}

{
	#category : #'*STON-Text support',
	#timestamp : ' 8/31/2017 05:26:41'
}
RunArray>>fromSton: stonReader [
	stonReader parseNamedInstVarsFor: self
]

{
	#category : #'*STON-Text support',
	#timestamp : ' 8/31/2017 05:26:41'
}
RunArray>>stonOn: stonWriter [
	stonWriter writeObject: self
]
