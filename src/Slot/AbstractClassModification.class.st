"
I represent a class modification. 

I content field modifications.
"
Class {
	#name : #AbstractClassModification,
	#superclass : #Object,
	#instVars : [
		'target',
		'layout',
		'propagations',
		'newClass'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>allPropagationsDo: aBlock [
	propagations do: [ :aPropagation |
		aBlock value: aPropagation.
		aPropagation allPropagationsDo: aBlock ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>apply [
	^ newClass := target shallowCopy
		superclass: self superclass
		layout: layout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>checkSanity [
	layout checkSanity.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>classLayout [
	^ self layout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>classLayout: aLayout [
	self layout: aLayout
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>computeChange [
	self checkSanity.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>initialize [
	propagations := OrderedCollection new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>isPropagation [
	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>layout [
	^ layout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>layout: aLayout [
	layout := aLayout.
	layout host: target.
	layout finalize.
	layout = target classLayout
		ifFalse: [ self computeChange ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>newClass [
	^ newClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>newLayout [
	^ layout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>oldLayout [
	^ target classLayout
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>propagate [
	target subclassesDo: [ :subclass |
		propagations add:
			(ClassModificationPropagation
				propagate: self
				to: subclass) ].
	"recursively propagate this change down"
	propagations do: [ :propagation | propagation propagate ]
	
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>result [
	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>target [
	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassModification>>target: aTarget [
	target := aTarget
]
