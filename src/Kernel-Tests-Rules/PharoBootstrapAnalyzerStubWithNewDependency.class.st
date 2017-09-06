"
Stub class to do not compute dependencies of the given package butrather give pre-established responses back.
"
Class {
	#name : #PharoBootstrapAnalyzerStubWithNewDependency,
	#superclass : #Object,
	#category : #Kernel-Tests-Rules,
	#timestamp : 'ChristopheDemarey 9/29/2015 12:46'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoBootstrapAnalyzerStubWithNewDependency>>dependenciesOf: aPackageName [
	^ #(Foo Bar)
]
