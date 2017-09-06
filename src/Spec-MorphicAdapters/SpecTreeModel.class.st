"
I am tree model used by the Spec infrastructure to provide a ""pluggable"" api since we do not have multiple inheritance in Pharo
"
Class {
	#name : #SpecTreeModel,
	#superclass : #MorphTreeModel,
	#instVars : [
		'model',
		'rootNodes'
	],
	#category : #Spec-MorphicAdapters-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel class>>model: model [

	^ self new
		model: model;
		yourself
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>acceptDroppingMorph: draggedMorph event: event inMorph: source [

	^ self model acceptDroppingMorph: draggedMorph event: event inMorph: source
]

{
	#category : #overrided,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>doubleClick [

	self model doubleClick
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>dragPassengerFor: item inMorph: dragSource  [
	
	^ self model dragPassengerFor: item inMorph: dragSource
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>dragPassengersFor: item inMorph: dragSource [
	
	^ self model dragPassengersFor: item inMorph: dragSource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>menu: menu shifted: b [

	^ self model menu: menu shifted: b
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>model: anObject [
	model := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>resetRootNodes [

	rootNodes := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>rootItems [

	^ self model roots
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>rootNodeFromItem: item [

	^ self model rootNodeFromItem: item
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>rootNodes [

	^ rootNodes ifNil: [ rootNodes := super rootNodes ]
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>transferFor: passenger from:  source [

	^ self model transferFor: passenger from: source
]

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeModel>>wantsDroppedMorph: draggedMorph event: anEvent inMorph: source [

	^ self model wantsDroppedMorph: draggedMorph event: anEvent inMorph: source
]
