Extension {
	#name : #Form
}

{
	#category : #'*Morphic-Core',
	#timestamp : ' 8/31/2017 05:26:11'
}
Form>>defaultCanvasClass [

	"Return the default canvas used for drawing onto the receiver"
	^ FormCanvas
]

{
	#category : #'*Morphic-Core',
	#timestamp : ' 8/31/2017 05:26:11'
}
Form>>getCanvas [
	"Return a Canvas that can be used to draw onto the receiver"
	^self defaultCanvasClass on: self
]
