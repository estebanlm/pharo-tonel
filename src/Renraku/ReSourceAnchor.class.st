"
A source anchor has a refference to the actual class, method, or other entity that is criticized. An anchor also has a #providesInterval method that returns a boolean indicating if the anchor provides a selection interval to the actual source of the critique. The interval can be accessed through the #interval method
"
Class {
	#name : #ReSourceAnchor,
	#superclass : #Object,
	#instVars : [
		'sourceEntity'
	],
	#category : #Renraku-SourceAnchors,
	#timestamp : 'YuriyTymchuk 7/10/2016 12:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSourceAnchor class>>entity: anEntity  [
	^ self basicNew
		initializeEnitity: anEntity;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSourceAnchor>>entity [
	^ self sourceEntity
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSourceAnchor>>gtInspectorAnchorIn: composite [
	<gtInspectorPresentationOrder: 0>

	^ sourceEntity glmCritiqueSourceIn: composite
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSourceAnchor>>initializeEnitity: anEntity  [
	
	sourceEntity := anEntity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSourceAnchor>>interval [

	^ nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSourceAnchor>>providesInterval [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSourceAnchor>>sourceEntity [
	^ sourceEntity
]
