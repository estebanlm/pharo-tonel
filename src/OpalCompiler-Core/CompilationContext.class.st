"
The compilationContext holds all information that is needed in the whole compiler chain.


"
Class {
	#name : #CompilationContext,
	#superclass : #Object,
	#instVars : [
		'requestor',
		'failBlock',
		'noPattern',
		'class',
		'logged',
		'interactive',
		'options',
		'environment',
		'parserClass',
		'semanticAnalyzerClass',
		'astTranslatorClass',
		'bytecodeGeneratorClass',
		'compiledMethodTrailer',
		'forSyntaxHighlighting',
		'encoderClass',
		'astTransformPlugins',
		'usesFullBlockClosure',
		'requestorScopeClass'
	],
	#classVars : [
		'BytecodeBackend',
		'UsesFullBlockClosure'
	],
	#category : #OpalCompiler-Core-FrontEnd,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext class>>bytecodeBackend [
	^ BytecodeBackend ifNil: [ self initialize. BytecodeBackend ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext class>>bytecodeBackend: bytecodeSet [
	BytecodeBackend := bytecodeSet
]

{
	#category : #compiler,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext class>>compiler [
	^self compilerClass new
		compilationContextClass: CompilationContext;
		environment: self environment;
		class: self
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext class>>default  [
	| instance |
	instance := self new.
	instance parseOptions: OpalCompiler defaultOptions.
	AbstractCompiler compileWithErrors 
		ifTrue: [ instance parseOptions: #(+ optionParseErrors) ].
	^instance.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext class>>initialize [
	BytecodeBackend := OpalEncoderForV3PlusClosures.
	UsesFullBlockClosure := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext class>>usesFullBlockClosure [
	^ UsesFullBlockClosure ifNil: [ self initialize. UsesFullBlockClosure ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext class>>usesFullBlockClosure: usesFullBlock [
	usesFullBlock ifTrue: [ 
		(BytecodeBackend name endsWith: 'SistaV1') ifFalse: [ 
			UIManager default alert: 'Be careful ! Inconsistency detected !
				It seems that the current bytecode encoder does not support FullBlockClosures.
				It is recommended to switch to another bytecode backend (for example SistaV1)
				or disable FullBlockClosure usage.' ] ].
	UsesFullBlockClosure := usesFullBlock
]

{
	#category : #plugins,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>addASTTransformationPlugin: aPlugin [
	astTransformPlugins add: aPlugin
]

{
	#category : #plugins,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>astTransformPlugins [
	^astTransformPlugins
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>astTranslatorClass [
	^ astTranslatorClass ifNil: [ astTranslatorClass := OCASTTranslator ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>astTranslatorClass: anObject [
	astTranslatorClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>bytecodeGeneratorClass [
	^ bytecodeGeneratorClass ifNil: [ bytecodeGeneratorClass := IRBytecodeGenerator ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>bytecodeGeneratorClass: anObject [
	bytecodeGeneratorClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>class: anObject [
	class := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>compiledMethodTrailer [
	^ compiledMethodTrailer ifNil: [ compiledMethodTrailer := CompiledMethodTrailer empty ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>compiledMethodTrailer: anObject [
	compiledMethodTrailer := anObject
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>compilerOptions: anArray [
	self parseOptions: anArray
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>doesNotUnderstand: message [

	(message selector isUnary and: [ message selector beginsWith: 'opt'] )
		ifTrue: [ ^ options includes: message selector ].
		
	^ super doesNotUnderstand: message
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>encoderClass [
	^ encoderClass ifNil: [ encoderClass := self class bytecodeBackend ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>encoderClass: anObject [
	encoderClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>environment [
	^ environment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>environment: anObject [
	environment := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>failBlock [
	^ failBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>failBlock: anObject [
	failBlock := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>forSyntaxHighlighting [
	^ forSyntaxHighlighting ifNil: [ ^false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>forSyntaxHighlighting: aBoolean [
	forSyntaxHighlighting := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>getClass [
	^ class
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>initialize [
	options := Set new.
	astTransformPlugins := OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>interactive [
	^ interactive ifNil: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>interactive: anObject [
	interactive := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>logged [
	^logged ifNil: [ false ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>logged: anObject [
	logged := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>noPattern [
	^noPattern ifNil: [ false ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>noPattern: anObject [
	noPattern := anObject
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineAndOr [
	^ options includes: #optionInlineAndOr

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineCase [
	^ options includes: #optionInlineCase

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineIf [
	^ options includes: #optionInlineIf

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineIfNil [
	^ options includes: #optionInlineIfNil

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineNone [
	^ options includes: #optionInlineNone

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineRepeat [
	^ options includes: #optionInlineRepeat

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineTimesRepeat [
	^ options includes: #optionInlineTimesRepeat

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineToDo [
	^ options includes: #optionInlineToDo

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionInlineWhile [
	^ options includes: #optionInlineWhile

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionLongIvarAccessBytecodes [
	^ options includes: #optionLongIvarAccessBytecodes

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionOptimizeIR [
	^ options includes: #optionOptimizeIR

]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>optionParseErrors [
	^ options includes: #optionParseErrors
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>parseOptions: optionsArray [
	options parseOptions: optionsArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>parserClass [
	^ parserClass ifNil: [ parserClass := RBParser ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>parserClass: anObject [
	parserClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>requestor [
	^ requestor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>requestor: anObject [
	requestor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>requestorScopeClass [
	^ requestorScopeClass ifNil: [ requestorScopeClass := OCRequestorScope ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>requestorScopeClass: anObject [
	"clients can set their own subclass of OCRequestorScope if needed"
	requestorScopeClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>scope [
	| newScope |

	newScope := OCClassScope for: class.
	requestor ifNotNil: [
		"the requestor is allowed to manage variables, the workspace is using it to auto-define vars"  
		newScope := (self requestorScopeClass new 
			compilationContext: self;
			requestor: requestor) outerScope: newScope].
	^newScope
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>semanticAnalyzerClass [
	^ semanticAnalyzerClass ifNil: [ semanticAnalyzerClass := OCASTSemanticAnalyzer  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>semanticAnalyzerClass: anObject [
	semanticAnalyzerClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>usesFullBlockClosure [
	^ usesFullBlockClosure ifNil: [ usesFullBlockClosure := self class usesFullBlockClosure ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
CompilationContext>>usesFullBlockClosure: bool [
	usesFullBlockClosure := bool
]
