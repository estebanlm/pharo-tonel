"
I am an Object used to interact with the OpalCompiler during compilation of a method chunk. I keep a reference to the original input so that error messages can be properly analyzed later-on.
"
Class {
	#name : #MethodChunkCompilerRequestor,
	#superclass : #Object,
	#instVars : [
		'methodChunk',
		'fileCompileRequestor',
		'interactive'
	],
	#category : #CodeImport,
	#timestamp : 'NicolaiHess 4/15/2016 12:10'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>fileCompileRequestor [
	^ fileCompileRequestor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>fileCompileRequestor: anObject [
	fileCompileRequestor := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>initialize [

	super initialize.

	fileCompileRequestor := nil.
	interactive := nil.
	methodChunk := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>interactive [
	^ interactive
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>interactive: anObject [
	interactive := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>methodChunk [
	^ methodChunk
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>methodChunk: anObject [
	methodChunk := anObject
]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>notify: message at: location in: code [
	| newSource |
	self flag: #hack.
	"Should use the new OPalWarnings directly instead of recreating a SyntaxErrorNotification"
	newSource := SyntaxErrorNotification 
		inClass: STCommandLineHandler
		withCode: code
		doitFlag: false
		errorMessage: message
		location: location.
		
	"If the syntax error notification is resumed, then the source was corrected and we have to announce that parsing can restart."					
	ReparseAfterSourceEditing signalWithNewSource: newSource
]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 07:16:32'
}
MethodChunkCompilerRequestor>>text [
	^ methodChunk contents
]
