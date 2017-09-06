"
Specific version of compiled code for block's.

CompiledBlock are used only in the recent BlockClosure implementation by Eliot Miranda and Clement Bera, also known as FullBlockClosure. This new representation makes possible heavier runtime optimisations while simplifying a lot of code, both image-side and VM-side.

In addition the execution mechanics, a compiled block have an extra optional literal. The last literal is the compiled code referring to the compiled block. 



"
Class {
	#name : #CompiledBlock,
	#superclass : #CompiledCode,
	#type : #compiledMethod,
	#category : #Kernel-Methods,
	#timestamp : 'ClementBera 5/23/2016 11:08'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>debuggerMap [
	^self compilerClass debuggerMethodMapForMethod: self.
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>hasMethodReturn [
	"Answer whether the receiver has a method-return ('^') in its code."
	^ (InstructionStream on: self) scanFor: [:byte | 
		 self encoderClass methodReturnBytecodes includes: byte]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>hash [
	"CompiledMethod>>#= compares code, i.e. same literals and same bytecode.
	 So we look at the header, methodClass and some bytes between initialPC and endPC,
	 but /not/ the selector because the equal method does not compare selectors.
	 Note that we must override ByteArray>hash which looks at all bytes of the receiver.
	 Using bytes from the pointer part of a COmpiledmethod can lead to a variable hash
	 if and when when the GC moves literals in the receiver."
	| initialPC endPC hash |
	initialPC := self initialPC.
	endPC := self endPC.
	hash := self species hash + self header + initialPC + endPC.
	"sample approximately 20 bytes"
	initialPC to: endPC by: (endPC - initialPC // 20 max: 1) do:
		[:i| hash := hash + (self at: i)].
	^hash

	"(CompiledMethod>>#hash) hash"

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>isTestMethod [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>method [
	"answer the compiled method that I am installed in, or nil if none."
	^self outerCode method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>methodClass [
	"answer the compiled method that I am installed in, or nil if none."
	^self outerCode methodClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>methodNode [
	^ self outerCode methodNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>outerCode [
	"answer the compiled code that I am installed in, or nil if none."
	^self literalAt: self numLiterals
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>outerCode: aCompiledCode [
	^self literalAt: self numLiterals put: aCompiledCode
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>pcInOuter [
	| outer end instructionStream |
	outer := self outerCode.
	instructionStream := InstructionStream on: outer.
	end := outer endPC.
	[instructionStream pc <= end] whileTrue: 
		[ (self encoderClass isCreateFullBlock: self code: outer at: instructionStream pc)
			ifTrue: [ ^ instructionStream pc ].
			instructionStream pc: (instructionStream nextPc: (outer at: instructionStream pc))].
	self error: 'block not installed in outer code'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>penultimateLiteral [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>pragmas [
	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>primitive [
	^ 0
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>printOn: s [
	s << 'compiledBlock'
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>properties [
	^ nil->nil
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>sameLiteralsAs: method [
	"Compare my literals to those of method. This is needed to compare compiled methods."

	| numLits literal1 literal2 |
	(numLits := self numLiterals) ~= method numLiterals
		ifTrue: [ ^ false ].
	"The last literal requires special checking instead of using #literalEqual:"
	1 to: numLits - 1 do: [ :index | 
		literal1 := self literalAt: index.
		literal2 := method literalAt: index.
		(literal1 == literal2 or: [ literal1 literalEqual: literal2 ])
			ifFalse: [ ^ false ] ].
	"we can't do = on outer code or it will recursively call this code"
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>selector [
	^ self outerCode selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CompiledBlock>>sourceCode [
	^ self outerCode sourceCode
]
