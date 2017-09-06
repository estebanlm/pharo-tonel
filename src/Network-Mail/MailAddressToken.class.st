"
a single token from an RFC822 mail address.  Used internally in MailAddressParser
"
Class {
	#name : #MailAddressToken,
	#superclass : #Object,
	#instVars : [
		'type',
		'text'
	],
	#category : #Network-Mail,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
MailAddressToken class>>type: type  text: text [
	^self new type: type text: text
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MailAddressToken>>printOn: aStream [
	aStream nextPut: $[.
	aStream nextPutAll: self type asString.
	aStream nextPut: $|.
	aStream nextPutAll: self text.
	aStream nextPut: $].
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 05:26:23'
}
MailAddressToken>>text [
	^text
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 05:26:23'
}
MailAddressToken>>type [
	^type
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
MailAddressToken>>type: type0  text: text0 [
	type := type0.
	text := text0.
]
