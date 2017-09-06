"

"
Class {
	#name : #ZnLineReaderTests,
	#superclass : #TestCase,
	#category : #Zinc-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnLineReaderTests>>testBinary [
	| input reader |
	input := ('Foo', String crlf, 'Bar', String crlf) asByteArray.
	reader := ZnLineReader on: input readStream.
	self assert: reader nextLine = 'Foo'.
	self assert: reader nextLine = 'Bar'.
	self assert: reader nextLine isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnLineReaderTests>>testLineTooLong [
	| input reader |
	input := (String new: 128) atAllPut: $X.
	reader := (ZnLineReader on: input readStream) limit: 64.
	self should: [ reader nextLine ] raise: ZnLineTooLong  
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnLineReaderTests>>testLineTooLongDefault [
	| input reader |
	input := (String new: ZnConstants maximumLineLength + 1) atAllPut: $X.
	reader := ZnLineReader on: input readStream.
	self should: [ reader nextLine ] raise: ZnLineTooLong  
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnLineReaderTests>>testSimple [
	| input reader |
	input := 'Foo', String crlf, 'Bar', String crlf.
	reader := ZnLineReader on: input readStream.
	self assert: reader nextLine = 'Foo'.
	self assert: reader nextLine = 'Bar'.
	self assert: reader nextLine isEmpty
]
