"
I do not filter presentation and allow all of them to be displayed
"
Class {
	#name : #GTInspectorNoneFilter,
	#superclass : #GTInspectorPresentationFilter,
	#category : #GT-Inspector,
	#timestamp : 'AliakseiSyrel 2/9/2017 00:16'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorNoneFilter>>changeFilterRequestFor: aGTInspector [
	"do nothing"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorNoneFilter>>shouldDisplayPresentationCreatedBy: aMethod [
	"display all of them"
	^ true
]
