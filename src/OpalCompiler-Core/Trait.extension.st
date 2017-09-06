Extension {
	#name : #Trait
}

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
Trait>>classSideCompiler [
	"Redefine this method if you want to customize the compiler for class-side methods"
	^self classSideCompilerClass new
		environment: self classSide environment;
		class: self classSide
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
Trait>>classSideCompilerClass  [
	"Redefine this method if you want to customize the compiler class for class-side methods"
	^ Smalltalk compilerClass
]
