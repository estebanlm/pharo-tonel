Extension {
	#name : #TextModel
}

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
TextModel>>pendingText [
	"<api: #inspect>"
	"Return the current pending text"

	^ self 
		detectMorphicAdapterDo: [ :w | w pendingText ]
		ifNone: [ self getText ]
]

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
TextModel>>pendingText: aText [
	"<api: #string getter: #pendingText>"
	"Set the pending text. Do no accept it"

	self 
		detectMorphicAdapterDo: [ :w | w pendingText: aText ]
		ifNone: [ self text: aText ]
]
