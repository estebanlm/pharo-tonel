"
A PDDependencyFromClass is a dependency from the class. The source class is stored in the inst var.
"
Class {
	#name : #DADependencyFromClass,
	#superclass : #DAPackageDependency,
	#instVars : [
		'theClass'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/31/2014 12:03'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyFromClass>><= other [
	^ self theClass <= other theClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyFromClass>>theClass [
	^ theClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyFromClass>>theClass: aClass [
	theClass := aClass
]
