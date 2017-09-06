"
My job is to scan bytecodes for instance variable references.

BlockContext allInstances collect: [ :x |
	{x. x hasInstVarRef}
].
"
Class {
	#name : #InstVarRefLocator,
	#superclass : #InstructionClient,
	#instVars : [
		'bingo'
	],
	#category : #Kernel-Methods,
	#timestamp : 'md 4/8/2003 12:50'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:33'
}
InstVarRefLocator>>interpretNextInstructionUsing: aScanner  [
	
	bingo := false.
	aScanner interpretNextInstructionFor: self.
	^bingo
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstVarRefLocator>>popIntoReceiverVariable: offset  [

	bingo := true
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstVarRefLocator>>pushReceiverVariable: offset [

	bingo := true
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstVarRefLocator>>storeIntoReceiverVariable: offset  [

	bingo := true
]
