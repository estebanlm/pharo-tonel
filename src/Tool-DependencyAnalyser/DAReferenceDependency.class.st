"
A PDReferenceDependency is a reference dependency between two packages. 

Instance Variables
	reference:		the reference class
	selector:		the selector that references the class
	method : 		the CompiledMethod

"
Class {
	#name : #DAReferenceDependency,
	#superclass : #DADependencyFromClass,
	#instVars : [
		'selector',
		'reference',
		'method'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/31/2014 12:06'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependency>>isReferenceDependency [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependency>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependency>>method: anObject [
	method := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependency>>printReasonOn: aStream [
	aStream
		nextPutAll: self theClass name;
		nextPutAll: '>>';
		print: self selector;
		nextPutAll: ' references ';
		print: self reference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependency>>reference [
	^ reference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependency>>reference: aClass [
	reference := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependency>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependency>>selector: aSymbol [
	selector := aSymbol
]
