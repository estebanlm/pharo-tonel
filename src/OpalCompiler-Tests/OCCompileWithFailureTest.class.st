"
I have tests for the curious capability of Opal to compile code with syntax errors.

Instead of raising syntax errors at runtime, they are raised at compile time.


"
Class {
	#name : #OCCompileWithFailureTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-Source,
	#timestamp : 'MarcusDenker 5/9/2015 12:06'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCCompileWithFailureTest>>testEvalSimpleMethodWithError [
	| ast cm |
	ast := OpalCompiler new
				source: 'method 3+';
				options: #(+ optionParseErrors);
				parse.
	
	self assert: ast isMethod.
	self assert: ast isFaulty.
	
	cm := ast compiledMethod.
	self should: [cm valueWithReceiver: nil arguments: #()] raise: SyntaxErrorNotification
]
