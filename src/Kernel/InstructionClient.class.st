"
My job is to make it easier to implement clients for InstructionStream. See InstVarRefLocator
as an example. 
"
Class {
	#name : #InstructionClient,
	#superclass : #Object,
	#category : #Kernel-Methods,
	#timestamp : 'md 4/8/2003 12:50'
}

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>blockReturnConstant: value [
	"Return Constant From Block bytecode."
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>blockReturnTop [
	"Return Top Of Stack bytecode."


]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>callPrimitive: pimIndex [
	"V3PlusClosures:	139 10001011	iiiiiiii   jjjjjjjj  Call Primitive #iiiiiiii + (jjjjjjjj * 256)
	 NewsqueakV4:		249 11111001	iiiiiiii   jjjjjjjj  Call Primitive #iiiiiiii + (jjjjjjjj * 256)
	 SistaV1:			248 11111000 iiiiiiii mjjjjjjj  Call Primitive #iiiiiiii + ( jjjjjjj * 256)
							m=1 means inlined primitive, no hard return after execution."
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>directedSuperSend: selector numArgs: numArgs [
	"Send Message Above Specific Class With Selector, selector, bytecode.
	 Start the lookup above the class that is the value of the association on
	 top of stack. The arguments  of the message are found in the top numArgs
	 stack locations beneath the association, and the receiver just below them."
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>doDup [
	"Duplicate Top Of Stack bytecode."


]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>doNop [

	"do nothing"
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>doPop [
	"Remove Top Of Stack bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>jump: offset [
	"Unconditional Jump bytecode."


]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>jump: offset if: condition [
	"Conditional Jump bytecode."


]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>methodReturnConstant: value [
	"Return Constant bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>methodReturnReceiver [
	"Return Self bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>methodReturnTop [
	"Return Top Of Stack bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>popIntoLiteralVariable: anAssociation [
	"Remove Top Of Stack And Store Into Literal Variable bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>popIntoReceiverVariable: offset [
	"Remove Top Of Stack And Store Into Instance Variable bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	"Remove Top Of Stack And Store Into Offset of Temp Vector bytecode."
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>popIntoTemporaryVariable: offset [
	"Remove Top Of Stack And Store Into Temporary Variable bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushActiveContext [
	"Push Active Context On Top Of Its Own Stack bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushActiveProcess [
	"Push Active Process On Top Of Its Own Stack bytecode."
	
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize [
	"Push Closure bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushClosureTemps: numTemps [
	"push on stack nil numTemps times for the closure temps"
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushConsArrayWithElements: numElements [
	"Push Cons Array of size numElements popping numElements items from the stack into the array bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushConstant: value [
	"Push Constant, value, on Top Of Stack bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushFullClosure: aCollection numCopied: anInteger receiverOnStack: aFalse ignoreOuterContext: aFalse4 [
	"Push Full Closure bytecode."
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushLiteralVariable: anAssociation [
	"Push Contents Of anAssociation On Top Of Stack bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushNewArrayOfSize: numElements [
	"Push New Array of size numElements bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushReceiver [
	"Push Active Context's Receiver on Top Of Stack bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushReceiverVariable: offset [
	"Push Contents Of the Receiver's Instance Variable Whose Index 
	is the argument, offset, On Top Of Stack bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	"Push Contents at Offset in Temp Vector bytecode."
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>pushTemporaryVariable: offset [
	"Push Contents Of Temporary Variable Whose Index Is the 
	argument, offset, On Top Of Stack bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>send: selector super: supered numArgs: numberArguments [
	"Send Message With Selector, selector, bytecode. The argument, 
	supered, indicates whether the receiver of the message is specified with 
	'super' in the source method. The arguments of the message are found in 
	the top numArguments locations on the stack and the receiver just 
	below them."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>storeIntoLiteralVariable: anAssociation [
	"Store Top Of Stack Into Literal Variable Of Method bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>storeIntoReceiverVariable: offset [
	"Store Top Of Stack Into Instance Variable Of Method bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>storeIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	"Store Top Of Stack And Store Into Offset of Temp Vector bytecode."
]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>storeIntoTemporaryVariable: offset [
	"Store Top Of Stack Into Temporary Variable Of Method bytecode."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>trap [
	"send the class trap message to the current context."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>trapIfNotInstanceOf: behaviorOrArrayOfBehavior [
	"If the top of stack is not an instance of either the argument, or, if the
	argument is an Array,
	any of the elements of the argument, send the class trap message
	to the current context."

]

{
	#category : #'instruction decoding',
	#timestamp : ' 8/31/2017 07:16:33'
}
InstructionClient>>unusedBytecode [
		"an unused bytecode is encountered"
]
