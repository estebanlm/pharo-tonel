"
I'm the declaration of a style stuff into a file.  I'm not really used, but I'm here to make parsing an homogeneous process and backwards compatibility.

Sending me the #import message does nothing :).
"
Class {
	#name : #StyleChunk,
	#superclass : #CodeChunk,
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
StyleChunk>>accept: aVisitor [

	^ aVisitor visitStyleChunk: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
StyleChunk>>description [

	^ 'Style'
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:32'
}
StyleChunk>>importFor: aRequestor logSource: logSource [
	"Nothing to do with style declarations"
]
