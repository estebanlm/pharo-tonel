"
I am the bridge between a TreeColumnModel and a MorphTreeColumn.

Ialso add support for on the fly refresh
"
Class {
	#name : #MorphicTreeColumnAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>argumentBlock [

	^ [ Array with: self model ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>buildWidget [
	^ SpecTreeColumn new
		resizable: self resizable;
		startWidth: self initialWidth;
		setHeaderButtonLabel: self headerLabel
			font: self headerFont
			icon: self headerIcon
			target: self
			actionSelector: self performHeaderActionSelector;
		rowMorphGetSelector: self displayBlock
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>displayBlock [

	^ self model displayBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>displayBlockChanged [

	self widgetDo: [ :w | 
		w rowMorphGetSelector: self displayBlock.
		w container updateList ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>headerAction [

	^ self model headerAction
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>headerFont [

	^ self model headerFont
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>headerFontChanged [
	
	self widgetDo: [ :w | 
		w header label: self headerLabel font: self headerFont.
		w container resizerChanged ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>headerIcon [

	^ self model headerIcon
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>headerIconChanged [
	
	self widgetDo: [ :w | 
		self headerIcon
			ifNil: [ w header removeIcon ]
			ifNotNil: [ w header icon: (ImageMorph new form: self headerIcon) ] ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>headerLabel [

	^ self model headerLabel
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>headerLabelChanged [
	
	self widgetDo: [ :w | 
		w header label: self headerLabel.
		w container resizerChanged ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>initialWidth [

	^ self model initialWidth
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>performHeaderAction [

	self headerAction cull: self model cull: self
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>performHeaderActionSelector [

	^ self headerAction
		ifNil: [ nil ]
		ifNotNil: [ #performHeaderAction ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>resizable [

	^ self model resizable
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>resizableChanged [
	
	self widgetDo: [ :w | w resizable: self resizable ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeColumnAdapter>>update: aSymbol [

	aSymbol == #displayBlockChanged ifTrue: [ ^ self displayBlockChanged ].
	aSymbol == #resizableChanged ifTrue: [ ^ self resizableChanged ].
	aSymbol == #headerLabelChanged ifTrue: [ ^ self headerLabelChanged ].
	aSymbol == #headerFontChanged ifTrue: [ ^ self headerFontChanged ].
	aSymbol == #headerIconChanged  ifTrue: [ ^ self headerIconChanged ].
	
	^ super update: aSymbol
]
