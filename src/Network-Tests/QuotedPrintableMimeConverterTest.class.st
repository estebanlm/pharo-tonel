"
SUnit tests for QuotedPrintableMimeConverter
"
Class {
	#name : #QuotedPrintableMimeConverterTest,
	#superclass : #TestCase,
	#instVars : [
		'coder'
	],
	#category : #Network-Tests-MIME,
	#timestamp : 'TorstenBergmann 2/5/2014 10:12'
}

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>decode: string [
	^ coder mimeDecode: string as: String
]

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>encode: string [
	^ coder mimeEncode: string
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>setUp [
	coder := QuotedPrintableMimeConverter
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testDecodeCRLF [

	self 
		assert: (self decode: 'This is the first line=0D=0A and this is the second')
		equals: 'This is the first line
 and this is the second'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testDecodeCustomNewline [
	| decoder output |
	decoder := coder new.
	output := String new writeStream.
	decoder 
		newline: String lf;
		mimeStream: 'foo=0D=0Abar' readStream;
		dataStream: output;
		mimeDecode.
	self 
		assert: output contents
		equals: 'foo', String lf, 'bar'
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testDecodeDecodedStrings [

	self 
		assert: (self decode: 'Hätten Hüte ein ß im Namen, wären sie möglicherweise keine Hüte mehr')
		equals: 'Hätten Hüte ein ß im Namen, wären sie möglicherweise keine Hüte mehr'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testDecodeSimpleStrings [

	self 
		assert: (self decode: 'Z=FCrich') 
		equals: 'Zürich'.
	self 
		assert: (self decode: 'H=E4tten H=FCte ein =DF im Namen, w=E4ren sie m=F6glicherweise keine H=FCte mehr') 
		equals: 'Hätten Hüte ein ß im Namen, wären sie möglicherweise keine Hüte mehr'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testDecodeSoftLinebreak [

	self 
		assert: (self decode: 'This is text may not be=
 decoded as two lines')
		equals: 'This is text may not be decoded as two lines'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testDecodeSoftLinebreakCR [

	self 
		assert: (self decode: 'This is text may not be=', String cr, ' decoded as two lines')
		equals: 'This is text may not be decoded as two lines'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testDecodeSoftLinebreakCRLF [

	self 
		assert: (self decode: 'This is text may not be=', String crlf, ' decoded as two lines')
		equals: 'This is text may not be decoded as two lines'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testDecodeSoftLinebreakLF [

	self 
		assert: (self decode: 'This is text may not be=', String lf, ' decoded as two lines')
		equals: 'This is text may not be decoded as two lines'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testEncodeCR [

	self 
		assert: (self encode: 'This is the first line', String cr, 'and this is the second')
		equals: 'This is the first line=0D=0Aand this is the second'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testEncodeCRLF [

	self 
		assert: (self encode: 'This is the first line', String crlf, 'and this is the second')
		equals: 'This is the first line=0D=0Aand this is the second'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testEncodeEncodedStrings [

	"An = becomes =3D and is then not decodable any more (only if you know you have to do it twice ;-) )"
	self
		assert: (self encode: 'Z=FCrich')
		equals: 'Z=3DFCrich'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testEncodeLF [

	self 
		assert: (self encode: 'This is the first line', String lf, 'and this is the second')
		equals: 'This is the first line=0D=0Aand this is the second'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testEncodeLongLine [
	| input output |
	
	input := (String new: 74 withAll: $A), (String new: 47 withAll: $B).
	
	output := (String new: 74 withAll: $A), '=
', (String new: 47 withAll: $B).
	
	self 
		assert: (self encode: input)
		equals: output
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testEncodeSimpleStrings [

	self 
		assert: (self encode: 'Zürich')
		equals: 'Z=FCrich'.
	self 
		assert: (self encode: 'Über die Fährverbindungen nach Föhr wüßte ich nicht viel')
		equals: '=DCber die F=E4hrverbindungen nach F=F6hr w=FC=DFte ich nicht viel'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testEncodeSoftLinebreak [

	| original encoded |

	original :=
		'Cowards die many times before their deaths; The valiant never taste of death but once.
Of all the wonders that I yet have heard, it seems to me most strange that men should fear;
Seeing that death, a necessary end, will come when it will come'.

	encoded :=
		'Cowards die many times before their deaths; The valiant never taste of dea=
th but once.=0D=0AOf all the wonders that I yet have heard, it seems to me=
 most strange that men should fear;=0D=0ASeeing that death, a necessary en=
d, will come when it will come'.

	"When encoding soft line breaks the encoded breaks must be taken into
	account when calculating the maximum line length."
	self assert: (original lines anySatisfy: [ :line | line size > 76 ]).
	self deny: (encoded lines anySatisfy: [ :line | line size > 76 ]).
	
	self assert: (self encode: original) equals: encoded.
	self assert: (self decode: encoded) equals: original
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
QuotedPrintableMimeConverterTest>>testLongLine [
	| input output |
	
	input := (String new: 74 withAll: $A), (String new: 47 withAll: $B).
	
	output := (String new: 74 withAll: $A), '=
', (String new: 47 withAll: $B).
	
	self 
		assert: (self encode: input)
		equals: output
]
