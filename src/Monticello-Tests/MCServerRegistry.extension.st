Extension {
	#name : #MCServerRegistry
}

{
	#category : #'*Monticello-Tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCServerRegistry>>removeCredentialsFor: aString  [

	registry removeKey: aString.
]
