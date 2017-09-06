Extension {
	#name : #Character
}

{
	#category : #'*multilingual-encodings',
	#timestamp : ' 8/31/2017 07:16:56'
}
Character>>asUnicodeChar [
	"Answer a copy of the receiver with Unicode as the leadingChar"
	^ Unicode charFromUnicode: self asUnicode
]

{
	#category : #'*Multilingual-Encodings',
	#timestamp : ' 8/31/2017 07:16:56'
}
Character class>>euro [
	"The Euro currency sign, that E with two dashes. The code point is a official unicode ISO/IEC-10646-1"

	^ Unicode value: 16r20AC
]
