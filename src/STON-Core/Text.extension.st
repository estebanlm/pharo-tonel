Extension {
	#name : #Text
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Text class>>fromSton: stonReader [
	^ self new
		fromSton: stonReader;
		yourself
]
