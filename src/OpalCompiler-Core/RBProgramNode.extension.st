Extension {
	#name : #RBProgramNode
}

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBProgramNode>>doSemanticAnalysis [
	self methodNode ifNil: [ ^self ].
	^ self methodNode doSemanticAnalysis.
	
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBProgramNode>>enclosingMethodOrBlockNode [
	^ self methodOrBlockNode 
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBProgramNode>>irInstruction [
	^ self methodOrBlockNode ir firstInstructionMatching: [:instr | instr sourceNode == self ]
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBProgramNode>>isClean [
	^ self children allSatisfy: [ :child | child isClean ]
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBProgramNode>>methodOrBlockNode [
	^ parent ifNotNil: [ parent methodOrBlockNode ]
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBProgramNode>>owningScope [

	^ parent owningScope 
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBProgramNode>>printAsIfCompiledOn: aStream  [
	aStream nextPutAll: self formattedCode
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBProgramNode>>scope [
	^ self methodOrBlockNode scope
]
