Extension {
	#name : #ChangeRecord
}

{
	#category : #'*Text-Core',
	#timestamp : ' 8/31/2017 07:16:16'
}
ChangeRecord>>text [
	| text |
	^ file ifNil: ['']
		ifNotNil: [
			file openReadOnly.
			file position: position.
			text := file nextChunkText.
			file close.
			text]
]
