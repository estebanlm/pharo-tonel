Extension {
	#name : #Object
}

{
	#category : #'*Morphic-Core',
	#timestamp : ' 8/31/2017 05:26:11'
}
Object>>currentWorld [
	"Answer a morphic world that is the current UI focus."
	^UIManager default currentWorld
]
