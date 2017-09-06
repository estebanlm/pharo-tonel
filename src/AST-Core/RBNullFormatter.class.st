"
A simple null formatter that just delegates  to source code and is not good when nodes are reflectively built.

Will be replaced by RBSimpleFormatter
"
Class {
	#name : #RBNullFormatter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'codeStream'
	],
	#classVars : [
		'FormatAsYouReadPolicy'
	],
	#category : #AST-Core-Formatter,
	#timestamp : 'StephaneDucasse 8/6/2015 19:10'
}

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBNullFormatter class>>formatAsYouReadPolicy [
	"Return whether the formatter is continously formatting"

	^ FormatAsYouReadPolicy ifNil: [ FormatAsYouReadPolicy := false ]

]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBNullFormatter class>>formatAsYouReadPolicy: aBoolean [
	"Return whether the formatter is continously formatting"

	FormatAsYouReadPolicy := aBoolean
]

{
	#category : #'public interface',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBNullFormatter>>containerWidth: anInteger [
	"doing nothing on purpose"
]

{
	#category : #'public interface',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBNullFormatter>>format: aParseTree  [
	^ aParseTree source
		ifNil: [	self visitNode: aParseTree.
					codeStream contents ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBNullFormatter>>initialize [
	super initialize.
	codeStream := (String new: 256) writeStream.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBNullFormatter>>visitMethodNode: aMethodNode [
	codeStream 
		nextPutAll: aMethodNode selector;
		cr;
		nextPutAll: '	''no source and no formatter available!'''
]
