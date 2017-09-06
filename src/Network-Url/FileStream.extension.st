Extension {
	#name : #FileStream
}

{
	#category : #'*Network-Url',
	#timestamp : ' 8/31/2017 07:16:35'
}
FileStream>>asUrl [
	^ self asZnUrl 
]

{
	#category : #'*Network-Url',
	#timestamp : ' 8/31/2017 07:16:35'
}
FileStream>>url [
	"Convert my path into a file:// type url String."
	
	^self asUrl asString
]
