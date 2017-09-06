"
A SpecTableLayout is a variant of spec layout that uses TableLayout layout policy.
"
Class {
	#name : #SpecTableLayout,
	#superclass : #Object,
	#instVars : [
		'commands',
		'selector',
		'layoutProperties'
	],
	#category : #Spec-Layout,
	#timestamp : 'webwarrior 6/9/2014 16:02'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout class>>column [
	^ self new listDirection: #topToBottom
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout class>>row [
	^ self new listDirection: #leftToRight
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>add: aSpec  [
	commands add: (SpecTableLayoutAdd subwidget: aSpec) 
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>add: modelGetter withSpec: aSymbol  [
	commands add: (SpecTableLayoutAddWithSpec subwidget: modelGetter spec: aSymbol) 
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>add: modelGetter withSpec: aSymbol wrapped: aBlock [
	| wrapper |
	wrapper := SpecWrapperTableLayout wrap: modelGetter withSpec: aSymbol.
	aBlock value: wrapper.
	self add: wrapper
	
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>add: aSpec wrapped: aBlock [
	| wrapper |
	wrapper := SpecWrapperTableLayout wrap: aSpec.
	aBlock value: wrapper.
	self add: wrapper
	
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>addSpacer [
	self addSpacerWeighted: 1 
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>addSpacerSized: aNumber [
	commands add: (SpecTableLayoutAddSpacer sized: aNumber) 
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>addSpacerWeighted: aNumber [
	commands add: (SpecTableLayoutAddSpacer weighted: aNumber) 
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>asArray [
	commands 
		select: [ :c | c isKindOf: SpecTableLayoutAddSpacer ] 
		thenDo: [ :c | c orientation: self orientation ].
	
	^ { #TableContainerModel . #layoutProperties: . layoutProperties } , 
	  (commands flatCollect: #asSpecElements)
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>cellInset: aNumber [
	layoutProperties cellInset: aNumber
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>cellPositioning: aSymbol [
	layoutProperties cellPositioning: aSymbol
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>cellSpacing: aSymbol [
	layoutProperties cellSpacing: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>commands [
	^ commands
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>commands: anObject [
	commands := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>createColumn: aBlock [
	| column |
	column := SpecTableLayout column.
	aBlock value: column.
	^ column
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>createRow: aBlock [
	| row |
	row :=  SpecTableLayout row.
	aBlock value: row.
	^ row
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>hResizing: aSymbol [
	layoutProperties hResizing: aSymbol
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>height: aNumber [
	"Doesn't work when opened in window, only when part of another layout"
	self send: #height: withArguments: {aNumber}
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>initialize  [
	super initialize.
	
	commands := OrderedCollection new.
	layoutProperties := TableLayoutProperties new.
	layoutProperties 
		reverseTableCells: true;
		hResizing: #spaceFill;
		vResizing: #spaceFill.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>isSpecLayout [

	^ true
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>layoutInset: aNumber [
	layoutProperties layoutInset: aNumber
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>listCentering: aSymbol [
	layoutProperties listCentering: aSymbol
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>listDirection: aSymbol [
	layoutProperties listDirection: aSymbol
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>listSpacing: aSymbol [
	layoutProperties listSpacing: aSymbol
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>maxCellSize: aNumber [
	layoutProperties maxCellSize: aNumber
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>minCellSize: aNumber [
	layoutProperties minCellSize: aNumber
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>minHeight: aNumber [
	self send: #minHeight: withArguments: {aNumber}
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>minWidth: aNumber [
	self send: #minWidth: withArguments: {aNumber}
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>newColumn: aBlock [
	self add: (self createColumn: aBlock)
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>newColumn: aBlock width: aNumber [
	self add: ((self createColumn: aBlock) width: aNumber)
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>newRow: aBlock [
	self add: (self createRow: aBlock)
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>newRow: aBlock height: aNumber [
	self add: ((self createRow: aBlock) height: aNumber)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>orientation [
	| dir |
	dir := layoutProperties listDirection.
	^ ((dir == #topToBottom) | (dir == #bottomToTop))
		ifTrue: [ #vertical ]
		ifFalse: [ #horizontal ]
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>reverseTableCells: aBool [
	layoutProperties reverseTableCells: aBool
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>rubberBandCells: aBool [
	layoutProperties rubberBandCells: aBool
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>selector: anObject [
	selector := anObject
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>send: aSelector [
	self send: aSelector withArguments: #()
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>send: aSelector withArguments: arguments [
	commands 
		add: (SpecTableLayoutSend
					selector: aSelector
					arguments: arguments)
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>vResizing: aSymbol [
	layoutProperties vResizing: aSymbol
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>width: aNumber [
	"Doesn't work when opened in window, only when part of another layout"
	self send: #width: withArguments: {aNumber}
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>wrapCentering: aSymbol [
	layoutProperties wrapCentering: aSymbol
]

{
	#category : #'commands - layout properties',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayout>>wrapDirection: aSymbol [
	layoutProperties wrapDirection: aSymbol
]
