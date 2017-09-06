"
A PDInheritanceDependency is an inheritance dependency between two packages.

	superclass:		the superclass that includes in the target PDPackag

"
Class {
	#name : #DAInheritanceDependency,
	#superclass : #DADependencyFromClass,
	#instVars : [
		'superclass'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/31/2014 12:06'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAInheritanceDependency>>isInheritanceDependency [
	^ true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAInheritanceDependency>>printReasonOn: aStream [
	aStream
		nextPutAll: self theClass name;
		nextPutAll: ' inherits from ';
		nextPutAll: self superclass name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAInheritanceDependency>>superclass [
	^ superclass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAInheritanceDependency>>superclass: aClass [
	superclass := aClass
]
