"
A special tree inspector that displays the submorph hierarchy of the inspected morph.
"
Class {
	#name : #EyeViewHierarchyInspector,
	#superclass : #EyeTreeInspector,
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeViewHierarchyInspector class>>label [
	^ 'Morph View Hierarchy Inspector'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeViewHierarchyInspector>>childrenForObject: aMorph [
	^ aMorph submorphs collect: [ :each |
		DynamicEyeElement
			host: aMorph
			value: each
		 ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeViewHierarchyInspector>>roots [
	^ self childrenForObject: self object
]
