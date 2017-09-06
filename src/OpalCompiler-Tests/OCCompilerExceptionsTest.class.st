"

"
Class {
	#name : #OCCompilerExceptionsTest,
	#superclass : #TestCase,
	#instVars : [
		'text',
		'currentCompiler'
	],
	#category : #OpalCompiler-Tests-FromOld,
	#timestamp : ''
}

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>compile: sourceString [

       text := sourceString.
       self class
               compileSilently: text
               classified: 'generated'
               notifying: self
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>compiling: sourceCode shouldRaise: exceptionClass [

	self should: [ self compile: sourceCode ] raise: exceptionClass
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>interactive  [
	^ true
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>removeGeneratedMethods [

	self class removeProtocol: 'generated'
]

{
	#category : #emulating,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>select [
	
]

{
	#category : #emulating,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>selectFrom: start to: end  [
	
]

{
	#category : #emulating,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>selectionInterval [
	^ 1 to: 0
]

{
	#category : #setUp,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>setUp [

	currentCompiler := SmalltalkImage compilerClass.
	SmalltalkImage compilerClass: OpalCompiler.

]

{
	#category : #setUp,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>tearDown [
	self removeGeneratedMethods.
	SmalltalkImage compilerClass: currentCompiler.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>testUndeclaredVariable [

	self
		compiling: 'griffle ^ goo' shouldRaise: OCUndeclaredVariableWarning  ;
		compiling: 'griffle ^ [ goo ] value' shouldRaise: OCUndeclaredVariableWarning
]

{
	#category : #emulating,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompilerExceptionsTest>>text [
	^ text
]
