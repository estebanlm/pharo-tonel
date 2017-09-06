Extension {
	#name : #String
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
String>>encodedCharSetAt: index [
	"return the character encoding in place at index; the actual EncodedCharSet, not just a number. A bad index is an Error"
	^EncodedCharSet charsetAt: (self at: index) leadingChar
]
