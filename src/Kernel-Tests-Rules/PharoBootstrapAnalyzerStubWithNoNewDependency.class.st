"
Stub class to do not compute dependencies of the given package butrather give pre-established responses back.

#dependenciesOf will return  packages already in the bootsrap layer.
"
Class {
	#name : #PharoBootstrapAnalyzerStubWithNoNewDependency,
	#superclass : #Object,
	#category : #Kernel-Tests-Rules,
	#timestamp : 'ChristopheDemarey 10/1/2015 12:11'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoBootstrapAnalyzerStubWithNoNewDependency>>dependenciesOf: aPackageName [
	^ #('Collections-Strings' Kernel 'AST-Core')
]
