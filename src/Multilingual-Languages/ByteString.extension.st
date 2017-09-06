Extension {
	#name : #ByteString
}

{
	#category : #'*Multilingual-Languages',
	#timestamp : ' 8/31/2017 07:16:12'
}
ByteString>>convertFromSystemString [

	| readStream |
	readStream := self readStream.
	^ self class new: self size streamContents: [ :writeStream |
		| converter |
		converter := LanguageEnvironment defaultSystemConverter.
		[readStream atEnd] whileFalse: [
			writeStream nextPut: (converter nextFromStream: readStream)]].

]
