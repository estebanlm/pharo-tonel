Extension {
	#name : #Interval
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Interval class>>fromSton: stonReader [
	^ self new
		fromSton: stonReader;
		yourself
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Interval>>fromSton: stonReader [
	stonReader parseNamedInstVarsFor: self
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Interval>>stonOn: stonWriter [
	stonWriter writeObject: self
]
