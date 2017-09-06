"
I know how to build rulers.
"
Class {
	#name : #HiRulerBuilder,
	#superclass : #HiBuilder,
	#instVars : [
		'rowSize',
		'columnSize',
		'nodeBuilder',
		'linkBuilders',
		'values'
	],
	#category : #Hiedra-Builders,
	#timestamp : '<historical>'
}

{
	#category : #'accessing - building API',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>addLinkBuilder: aBlockClosure  [
	
	| newLink |
	newLink := HiLinkBuilder new.
	aBlockClosure value: newLink.
	linkBuilders add: newLink.
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>athensSurface [
	| athensSurface ruler |
	ruler := HiRuler new
		values: values;
		linkBuilders: linkBuilders;
		build;
		yourself.

	"FIX: it's (ruler numberOfColumns + 1) because of the left margin"
	athensSurface := AthensCairoSurface extent: 
		((ruler numberOfColumns + 1) * self columnSize) @ (self numberOfRows * self rowSize).
		
	athensSurface drawDuring: [ :athensCanvas | 

		"apply left margin"
		athensCanvas pathTransform
			translateX: self columnSize
			Y: 0.
					
		(HiRulerRenderer 
			model: self 
			athensCanvas: athensCanvas
			ruler: ruler) 
			render ].

	^ athensSurface
]

{
	#category : #'accessing - rendering',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>bottomOfRowIndex: rowIndex [
	^ rowIndex * self rowSize
]

{
	#category : #'accessing - rendering',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>centerOfColumnIndex: columnIndex [
	^ (self leftOfColumnIndex: columnIndex) + (self columnSize // 2)
]

{
	#category : #'accessing - rendering',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>centerOfRowIndex: rowIndex [
	^ (self topOfRowIndex: rowIndex) + (self rowSize // 2)
]

{
	#category : #'accessing - building API',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>columnSize [
	^ columnSize
]

{
	#category : #'accessing - building API',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>columnSize: anInteger [
	columnSize := anInteger
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>form [
	| surface form |
	surface := self athensSurface.

	form := Form 
		extent: (surface width @ surface height) 
		depth: 32.

	form getCanvas 
		drawImage: surface asForm 
		at: 0@0.

	^ form
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>initialize [
	super initialize.
	
	rowSize := 25.
	columnSize := rowSize // 2.
	nodeBuilder := HiNodeBuilder new.
	linkBuilders := OrderedCollection new.
]

{
	#category : #'accessing - rendering',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>leftOfColumnIndex: columnIndex [
	^ (columnIndex - 1) * self columnSize
]

{
	#category : #'accessing - rendering',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>linkBuilders [
	^ linkBuilders
]

{
	#category : #'accessing - building API',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>nodeBuilder [
	^ nodeBuilder
]

{
	#category : #'accessing - rendering',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>numberOfRows [
	^ values size
]

{
	#category : #'accessing - building API',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>rowSize [
	^ rowSize
]

{
	#category : #'accessing - building API',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>rowSize: anInteger [
	rowSize := anInteger
]

{
	#category : #'accessing - rendering',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>topOfRowIndex: rowIndex [
	^ (rowIndex - 1) * self rowSize
]

{
	#category : #'accessing - building API',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerBuilder>>values: aCollection  [
	values := aCollection
]
