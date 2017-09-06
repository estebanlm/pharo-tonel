"
A TextFontReference encodes a font change applicable over a given range of text.  The font reference is absolute:  unlike a TextFontChange, it is independent of the textStyle governing display of this text.
"
Class {
	#name : #TextFontReference,
	#superclass : #TextFontChange,
	#instVars : [
		'font'
	],
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextFontReference class>>toFont: aFont [
	^ self new toFont: aFont
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextFontReference>>= other  [
	^ (other class == self class) 
		and: [other font = font]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextFontReference>>font [

	^ font
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextFontReference>>forFontInStyle: aTextStyle do: aBlock [
	aBlock value: font
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextFontReference>>hash [
	"#hash is re-implemented because #= is re-implemented"
	^font hash
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextFontReference>>printOn: aStream [
	aStream nextPutAll: 'a TextFontReference(';
		print: font;
		nextPut: $)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextFontReference>>toFont: aFont [

	font := aFont
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextFontReference>>writeScanOn: strm [

	strm nextPut: $F.
	strm nextPutAll: font familyName; nextPut: $#.
	font height printOn: strm.
]
