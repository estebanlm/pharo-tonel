Extension {
	#name : #Collection
}

{
	#category : #'*Morphic-Base-Basic',
	#timestamp : ' 8/31/2017 05:26:13'
}
Collection>>asDraggableMorph [
	^ (String streamContents: [ :s| 
		self 
			do: [ :each | s print: each ]
			separatedBy: [ s space ]]) asStringMorph
]
