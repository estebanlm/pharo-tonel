Extension {
	#name : #String
}

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
String>>asUTF8Bytes [
	^ ZnUTF8Encoder new encodeString: self
]
