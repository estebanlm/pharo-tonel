Extension {
	#name : #RBSequenceNode
}

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBSequenceNode>>transformLastToReturn [
	| last |
	statements ifEmpty: [ ^self].
	last := statements last.
	last isReturn ifFalse: [self replaceNode: last withNode: (RBReturnNode return: last start value: last )]
]
