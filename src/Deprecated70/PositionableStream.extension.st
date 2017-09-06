Extension {
	#name : #PositionableStream
}

{
	#category : #'*Deprecated70',
	#timestamp : ' 8/31/2017 07:16:22'
}
PositionableStream>>asBinaryOrTextStream [
	"Convert to a stream that can switch between bytes and characters"

	^ (RWBinaryOrTextStream with: self contentsOfEntireFile) reset
]
