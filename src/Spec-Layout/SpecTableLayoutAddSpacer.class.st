"
A SpecTableLayoutAddSpring class is a description of the addition of a spacer to a table layout.

Can be either:
- flexible (fills available space; default) 
- of a fixed size

Note that flexible spacers do not work with wrapDirection other than #none.

"
Class {
	#name : #SpecTableLayoutAddSpacer,
	#superclass : #SpecTableLayoutAdd,
	#instVars : [
		'commands',
		'spaceFillWeight',
		'size',
		'orientation'
	],
	#category : #Spec-Layout,
	#timestamp : 'webwarrior 6/12/2014 14:16'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddSpacer class>>sized: aNumber [
	^ self new size: aNumber
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddSpacer class>>weighted: aNumber [
	^ self new spaceFillWeight: aNumber
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddSpacer>>asSpecElements [
	self generateArguments.
	^ super asSpecElements
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddSpacer>>generateArguments [
	| resizingMode resizing width height dimensions |
	width := 0.
	height := 0.
	dimensions := OrderedCollection new.
	
	(size > 0) 
		ifTrue: [ "fixed size"
			(orientation == #horizontal) 
				ifTrue: [ width := size ] 
				ifFalse: [ height := size ].
			resizingMode := #rigid. ]
		ifFalse: [ "flexible"
			dimensions add: #spaceFillWeight:; add: spaceFillWeight.
			resizingMode := #spaceFill. ].
	
	dimensions add: #width:; add: width; add: #height:; add: height.
	
	resizing := 
		(orientation == #horizontal) 
			ifTrue: [ {#hResizing: . resizingMode . #vResizing: . #shrinkWrap} ]
			ifFalse: [ {#hResizing: . #shrinkWrap . #vResizing: . resizingMode} ].
	
	self arguments: { {subwidget} , resizing , dimensions }
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddSpacer>>initialize [
	subwidget := #(PanelMorph).
	spaceFillWeight := 1.
	size := 0.
	orientation := #vertical.
	super initialize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddSpacer>>orientation: aSymbol [
	((aSymbol == #horizontal) | (aSymbol == #vertical))
		ifFalse: [ Error signal: 'orientation must be either #horizontal or #vertical' ]
		ifTrue: [ orientation := aSymbol ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddSpacer>>size: aNumber [
	size := aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddSpacer>>spaceFillWeight: aNumber [
	spaceFillWeight := aNumber
]
