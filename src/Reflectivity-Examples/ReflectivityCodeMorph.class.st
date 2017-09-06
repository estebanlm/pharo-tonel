"
I'm a morph that shows the source codes of a compiled method 
"
Class {
	#name : #ReflectivityCodeMorph,
	#superclass : #Morph,
	#instVars : [
		'textModel',
		'compiledMethod'
	],
	#category : #Reflectivity-Examples,
	#timestamp : 'mcamp 10/1/2015 11:24'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph class>>compiledMethod: aCompiledMethod [

	^self new addSourceCode: aCompiledMethod; yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>addSourceCode: aCompiledMethod [
	|editor|
	
	self compiledMethod: aCompiledMethod.
	
	editor := self newScrolledText.
	editor hResizing: #spaceFill; vResizing: #spaceFill.
	
	self textModel setText: aCompiledMethod sourceCode.
	self addMorph: editor.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>compiledMethod [
	^ compiledMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>compiledMethod: anObject [
	compiledMethod := anObject
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>defaultBounds [
"answer the default bounds for the receiver"
	^ 0 @ 0 corner: 200 @ 40
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>defaultColor [
	^Color veryLightGray
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>drawOn: aCanvas [
	super drawOn: aCanvas.
	self drawTitleOn: aCanvas
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>drawTitleOn: aCanvas [
	aCanvas drawString: self compiledMethod methodClass asString 
		in: (self bounds insetBy: (Margin left: 10 top: 10 right: 2 bottom: 10)) 
		font: (LogicalFont familyName: self familyName pointSize: 11)
		color: Smalltalk ui theme textColor. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>familyName [
	^'Source Sans Pro'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>initialize [

	super initialize.
	self
 		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapDirection: #topToBottom;
		hResizing: #spaceFill;
		vResizing: #rigid;
		height: 150;
		layoutInset: (Margin top: 30 left: 2 bottom: 2 right: 2); 
		cellInset: 1.
		
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>newScrolledText [
	| scrolledText |
	scrolledText := self textModel
		newScrolledText
		beForSmalltalkCode;
		beWrapped;
		beReadOnly;
		yourself.
	^ scrolledText
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>shoutAboutToStyle: aTextView [

	aTextView classOrMetaClass: self compiledMethod methodClass.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivityCodeMorph>>textModel [
	^ textModel ifNil: [ textModel := RubScrolledTextModel new interactionModel: self ]
]
