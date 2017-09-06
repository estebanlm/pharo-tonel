Extension {
	#name : #ByteArray
}

{
	#category : #'*Network-Mime',
	#timestamp : ' 8/31/2017 07:16:37'
}
ByteArray>>base64Encoded [
	"Encode the receiver as base64"
	"'Hello World' asByteArray base64Encoded"
	^(Base64MimeConverter mimeEncode: self readStream) contents
]
