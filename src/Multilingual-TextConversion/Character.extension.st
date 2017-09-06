Extension {
	#name : #Character
}

{
	#category : #'*Multilingual-TextConversion',
	#timestamp : ' 8/31/2017 07:16:13'
}
Character>>macRomanToUnicode [
	"Convert the receiver from MacRoman Unicode."

	^MacRomanTextConverter new unicodeToByte: self
]

{
	#category : #'*Multilingual-TextConversion',
	#timestamp : ' 8/31/2017 07:16:13'
}
Character>>unicodeToMacRoman [
	"Convert the receiver from Unicode to MacRoman encoding."

	^MacRomanTextConverter new byteToUnicode: self
]
