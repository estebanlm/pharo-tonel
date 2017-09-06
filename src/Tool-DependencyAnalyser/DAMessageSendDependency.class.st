"
I represent a potential Dependency on a Package because it implements a method called by the package under analysis but the method is not implemented in the package, neither in the static dependencies of this package (inheritence, reference, trait, extension).
"
Class {
	#name : #DAMessageSendDependency,
	#superclass : #DADependencyFromClass,
	#instVars : [
		'implementedMethods'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'ChristopheDemarey 6/25/2015 17:50'
}

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendDependency>>implementedMethods: aListOfSelectors [
	implementedMethods := aListOfSelectors
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendDependency>>isMessageSendDependency [
	^ true 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendDependency>>users [
	^  (source rPackage methods
		select: [ :method | method messages includesAny: implementedMethods ]
		thenCollect: [ :method | method -> (method messages intersection: implementedMethods) ])
]
