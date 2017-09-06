"
I am the adapter providing container with table layout

"
Class {
	#name : #MorphicTableContainerAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : 'webwarrior 6/9/2014 15:45'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTableContainerAdapter>>buildWidget [
	^ PanelMorph new
		layoutPolicy: TableLayout new;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTableContainerAdapter>>centerWidget: aWindow [
	self widgetDo: [ :w | w centerWidget: aWindow ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTableContainerAdapter>>height: aNumber [
	self vRigid.
	self widgetDo: [ :w | w height: aNumber ].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTableContainerAdapter>>isRedrawable [
	"This must be overriden in the adapter representing your container"
	
	^ true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTableContainerAdapter>>layoutProperties: props [
	self widgetDo: [ :w | w layoutProperties: props ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTableContainerAdapter>>minHeight: aNumber [
	self widgetDo: [ :w | w minHeight: aNumber ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTableContainerAdapter>>minWidth: aNumber [
	self widgetDo: [ :w | w minWidth: aNumber ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTableContainerAdapter>>width: aNumber [
	self hRigid.
	self widgetDo: [ :w | w width: aNumber ].
]
