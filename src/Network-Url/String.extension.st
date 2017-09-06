Extension {
	#name : #String
}

{
	#category : #'*network-url',
	#timestamp : ' 8/31/2017 07:16:35'
}
String>>asUrl [
	^ self asZnUrl
]
