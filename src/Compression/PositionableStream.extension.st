Extension {
	#name : #PositionableStream
}

{
	#category : #'*Compression',
	#timestamp : ' 8/31/2017 07:17:01'
}
PositionableStream>>asZLibReadStream [
	^ZLibReadStream on: collection from: position+1 to: readLimit
]
