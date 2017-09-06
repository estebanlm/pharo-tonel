Extension {
	#name : #CompiledMethod
}

{
	#category : #'*System-Sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethod>>putSource: sourceStr class: class category: catName withStamp: changeStamp priorMethod: priorMethod [
	^ self
		putSource: sourceStr
		withPreamble: [ :file | 
			class
				printCategoryChunk: catName
				on: file
				withStamp: changeStamp
				priorMethod: priorMethod.
			file cr ]
]

{
	#category : #'*System-Sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethod>>putSource: source withPreamble: preambleBlock [
	"Store the source code for the receiver on an external file."

	SourceFiles 
		writeSource: source 
		preamble: (String streamContents: preambleBlock)
		onSuccess: [ :newSourcePointer | 
			"Method chunk needs a final ! !"
			SourceFiles changesWriteStreamDo: [ :file | file nextChunkPut: ' ' ].
			"Update with new source pointer"
			self setSourcePointer: newSourcePointer ]
		onFail: [ 
			self becomeForward: (self copyWithSource: source) ]

]
