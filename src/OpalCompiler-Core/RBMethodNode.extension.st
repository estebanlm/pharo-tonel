Extension {
	#name : #RBMethodNode
}

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>compiledMethod [
	^ self ir compiledMethod
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>decompileString  [

	^ self formattedCode 

]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>doSemanticAnalysis [

	self compilationContext ifNil: [ self methodClass: nil class ].

	self
		compilationContext semanticAnalyzerClass new
		compilationContext: self compilationContext;
		analyze: self
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>doSemanticAnalysisIn: behavior [
	self methodClass: behavior.
	self doSemanticAnalysis
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>doSemanticAnalysisInContext: aCompilationContext [
	self compilationContext: aCompilationContext.
	self doSemanticAnalysis.
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode class>>errorMethodNode: selector errorMessage: messageText	 [
	| message |
	message := RBMessageNode 
		receiver: (RBSelfNode named: 'self')
		selector: #error: 
		arguments: {RBLiteralNode value: messageText}.
	^ self 
		selector: selector 
		arguments: ((1 to: selector numArgs) collect: [ :i | RBArgumentNode named: 't' , i asString ]) 
		body: (RBSequenceNode statements: {message}) 
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>generate [
	"The receiver is the root of a parse tree. Answer a CompiledMethod. The
	argument, trailer, is the references to the source code that is stored with 
	every CompiledMethod."

	^ self generate: CompiledMethodTrailer empty
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>generate: trailer [
	^ self generateIR compiledMethodWith: trailer.
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>generateIR [
	| ir |
	scope ifNil: [self doSemanticAnalysisInContext: self compilationContext ].
 	ir := (self compilationContext astTranslatorClass new
			visitNode: self)
			ir.
	^ self ir: ir
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>generateWithSource [
	"Answer a CompiledMethod with source encoded in trailer."

	
	"for doits, we need to store the source pretty printed from the 
	AST to get the return and methodName correct"
	self selector isDoIt ifTrue: [source := self formattedCode].
	
	^self generate: (CompiledMethodTrailer new sourceCode: source).
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>ir [

	^ self propertyAt: #ir ifAbsent: [self generateIR].
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>ir: aIRMethodNode [

	^ self propertyAt: #ir put: aIRMethodNode.
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>irInstruction [
	^ self ir
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>methodOrBlockNode [
	"^ self"
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>notShadowedTemporaryNamesFrom: aContext [
	| ownVariableNames |
	ownVariableNames := self allDefinedVariables collect: [ :var | var asString ].
	^ aContext tempNames difference: ownVariableNames

]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>owningScope [
	^ self scope
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>primitiveFromPragma [
	pragmas ifNil: [ ^ IRPrimitive null ].
	^ pragmas
		detect: [ :each | each isPrimitive ]
		ifFound: [ :aPragmaPrimitive | aPragmaPrimitive asPrimitive ]
		ifNone: [ IRPrimitive null ]
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>properties [
	^self propertyAt: #methodProperties ifAbsent: nil
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>properties: aMethodeProperties  [
	^self propertyAt: #methodProperties put: aMethodeProperties
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>rewriteTempsForContext: aContext [
	| rewriter contextOnlyTemps |
	rewriter := RBParseTreeRewriter new.
	contextOnlyTemps := self notShadowedTemporaryNamesFrom: aContext.
	aContext tempNames
		withIndexDo:
			[ :tempName :index | 
			(contextOnlyTemps includes: tempName)
				ifTrue:
					[ rewriter
						replace: tempName , ' := ``@object' with: 'ThisContext namedTempAt:' , index asString , 'put: ``@object';
						replace: tempName with: 'ThisContext namedTempAt:' , index asString ] ].
	^ rewriter
		executeTree: self;
		tree
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>sourceNodeExecutedForPC: anInteger [
	^(self ir instructionForPC: anInteger) sourceNodeExecuted
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>sourceNodeForPC: anInteger [
	^(self ir instructionForPC: anInteger) sourceNode
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>sourceText: aString [
	self source: aString
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>startWithoutParentheses [
	^ 1
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
RBMethodNode>>tempNames [
	"compatibility method to old MethodNode"
	self flag: #Clean.
	^ self argumentNames, self temporaryNames
]
