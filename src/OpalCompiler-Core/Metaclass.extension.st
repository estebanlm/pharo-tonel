Extension {
	#name : #Metaclass
}

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
Metaclass>>compiler [
	"The compiler is defined on instance-side to be able to customize it for *one* metaclass"
	^ self instanceSide classSideCompiler
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
Metaclass>>compilerClass [
	"The compiler class is defined on instance-side to be able to customize it for *one* metaclass"
	^ self instanceSide classSideCompilerClass
]
