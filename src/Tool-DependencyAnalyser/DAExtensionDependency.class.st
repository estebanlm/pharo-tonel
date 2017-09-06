"
A PDExtensionDependency is an extension dependency between two packages.

Instance Variables
	selector:		the selector 
	method : 		the CompiledMethod
		
"
Class {
	#name : #DAExtensionDependency,
	#superclass : #DADependencyFromClass,
	#instVars : [
		'selector',
		'method'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/31/2014 12:06'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAExtensionDependency>>isExtensionDependency [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAExtensionDependency>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAExtensionDependency>>method: anObject [
	method := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAExtensionDependency>>printReasonOn: aStream [
	aStream
		nextPutAll: self theClass name;
		nextPutAll: '>>';
		print: self selector;
		nextPutAll: ' (extension)'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAExtensionDependency>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAExtensionDependency>>selector: aSelector [
	selector := aSelector
]
