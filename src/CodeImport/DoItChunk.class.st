"
I represent the declaration of some code to evaluate.  My contents are the code to evaluate.

Sending me the message #import makes me evaluate the code and return the result of the computation.

Be careful, my #import method also handles ChangeSet interaction so far, handling Changeset preambles and Postscripts.
"
Class {
	#name : #DoItChunk,
	#superclass : #CodeChunk,
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
DoItChunk>>accept: aVisitor [

	^ aVisitor visitDoItChunk: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
DoItChunk>>description [

	^ 'DoIt (', (contents first: (40 min: contents size)), ')'
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:32'
}
DoItChunk>>importFor: requestor logSource: logSource [
	
	(contents beginsWith: '----') ifTrue: [ ^self ].
	
	self flag: #fixme. "Ugly hack to parse preamble and postcript as a do it."
	((contents beginsWith: '"Change Set:') and: [ ChangeSet current preambleString isNil ])
		ifTrue: [ ChangeSet current preambleString: contents ].
	((contents beginsWith: '"Postscript:') and: [ ChangeSet current postscriptString isNil ])
		ifTrue: [ ChangeSet current postscriptString: contents ].

	^Smalltalk compiler class new
		source: contents;
		requestor: requestor;
		logged: logSource;
		evaluate.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
DoItChunk>>isDoItDeclaration [

	^ true
]
