"
I am an Object used to interact with the OpalCompiler.
I keep a reference to the original input so that error messages can be properly analyzed later-on.
"
Class {
	#name : #FileCompilerRequestor,
	#superclass : #Object,
	#instVars : [
		'contents',
		'fileReference',
		'interactive'
	],
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>contents [
	^ contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>contents: anObject [
	contents := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>failBlock [
	^ [ :exception | exception pass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>fileReference [
	^ fileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>fileReference: anObject [
	fileReference := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>initialize [
	interactive := false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>interactive [
	^ interactive
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>interactive: aBoolean [
	interactive := aBoolean
]

{
	#category : #'interactive error protocol',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>notify: message at: location in: code [
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
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
FileCompilerRequestor>>text [
	"compatibility method for the method installer"
	^ self contents
]
