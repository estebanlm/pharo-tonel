"
Locates the start of a block
"
Class {
	#name : #BlockStartLocator,
	#superclass : #InstructionClient,
	#instVars : [
		'nextJumpIsAroundBlock'
	],
	#category : #Compiler-Support,
	#timestamp : 'TorstenBergmann 1/31/2014 11:21'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
BlockStartLocator>>initialize [
	super initialize.
	nextJumpIsAroundBlock := false
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:32'
}
BlockStartLocator>>jump: offset [
	"If this jump is around a block answer the size of that block."

	nextJumpIsAroundBlock ifTrue:
		[nextJumpIsAroundBlock := false.
		 ^offset]
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:32'
}
BlockStartLocator>>pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize [
	"Answer the size of the block"
	^blockSize
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:32'
}
BlockStartLocator>>send: selector super: supered numArgs: numberArguments [
	nextJumpIsAroundBlock := #closureCopy:copiedValues: == selector
	"Don't use
		nextJumpIsAroundBlock := #(blockCopy: closureCopy:copiedValues:) includes: selector
	 since BlueBook BlockContexts do not have their own temps."
]
