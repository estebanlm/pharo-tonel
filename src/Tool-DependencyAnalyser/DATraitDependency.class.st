"
A PDTraitDependency is a trait dependency between two packages. 


Instance Variable
	trait:		the trait
"
Class {
	#name : #DATraitDependency,
	#superclass : #DADependencyFromClass,
	#instVars : [
		'trait'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/31/2014 12:05'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATraitDependency>>isTraitDependency [
	^ true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATraitDependency>>printReasonOn: aStream [
	aStream
		nextPutAll: self theClass name;
		nextPutAll: ' uses ';
		print: self trait name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATraitDependency>>trait [
	^ trait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATraitDependency>>trait: aTrait [
	trait := aTrait
]
