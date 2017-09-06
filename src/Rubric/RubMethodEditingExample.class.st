"
self open
"
Class {
	#name : #RubMethodEditingExample,
	#superclass : #Model,
	#instVars : [
		'textModel',
		'code',
		'className',
		'selector',
		'classIsMeta',
		'announcer'
	],
	#category : #Rubric-Editing-Widgets-Examples,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample class>>open [
	self new open
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>classIsMeta [
	^ classIsMeta ifNil: [classIsMeta := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>classIsMeta: aBoolean [
	classIsMeta := aBoolean.
	self selector: nil.
	self changed: #selector.
	self changed: #classIsMeta.
	self updateCodeWith: ''

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>className [
	^ className ifNotNil: [className asSymbol]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>className: aClassName [
	className := aClassName copyWithout: Character cr.
	self selector: nil.
	self updateCodeWith: ''.
	self changed: #selector.
	self changed: #className.
	self selectedClass
		ifNotNil: [ self changed: #haveClassName]
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>classSelector [
	| applicantsBlock entryCompletion |
	applicantsBlock := [(Array
				streamContents: [:strm | Symbol
						allSymbolTablesDo: [:each | (each notEmpty
									and: [each first canBeGlobalVarInitial
											and: [Smalltalk globals includesKey: each]])
								ifTrue: [strm nextPut: each]]]) sort].
	entryCompletion := EntryCompletion new
				dataSourceBlock: [:currText | applicantsBlock value ];
				filterBlock: [:currApplicant :currText | currText size > 0
						and: [currApplicant asUppercase includesSubstring: currText asString asUppercase]].
	^ (UIManager default newAutoAcceptTextEntryFor: self
			get: #className
			set: #className:
			class: String 
			getEnabled: nil
			help: 'Enter a class name' translated
			entryCompletion: entryCompletion)
				acceptOnCR: false;
				ghostText: 'Class name';
				withDropListButton;
				yourself.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>classToUse [
	^ self selectedClass
		ifNotNil: [self classIsMeta 
				ifTrue: [self selectedClass class]
				ifFalse: [self selectedClass]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>haveClassName [
	^ self selectedClass notNil
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>metaSwitch [
	^ UIManager default
		newCheckboxFor: self
		getSelected: #classIsMeta
		setSelected: #classIsMeta:
		label: 'Class'
		help: 'Class side is used if checked' 
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>methodSelector [
	| entryCompletion applicantsBlock |
	applicantsBlock := [self selectedClass 
						ifNil: [#()] 
						ifNotNil: [:clsn | self classToUse selectors asArray sort ]].
	entryCompletion := EntryCompletion new
				dataSourceBlock: [:currText | applicantsBlock value];
				filterBlock: [:currApplicant :currText | currText size > 0
						and: [currApplicant asUppercase includesSubstring: currText asString asUppercase]].
	^ (UIManager default newAutoAcceptTextEntryFor: self
			get: #selector
			set: #selector:
			class: String 
			getEnabled: #haveClassName
			help: 'Enter a selector' translated
			entryCompletion: entryCompletion) 
				acceptOnCR: false;
				ghostText: 'Selector';
				withDropListButton;
				yourself.

]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>newScrolledText [
	| scrolledText |
	scrolledText := self textModel
		newScrolledText
		beForSmalltalkCode;
		withCodeSizeFeedback;
		withGhostText: 'Choose a class and then a method to edit its code';
		yourself.
	scrolledText ghostTextRuler
		centered;
		fontPointSize: 18.
	^ scrolledText
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>okToChange [
	self textModel canDiscardEdits ifTrue: [ ^ true].
	self promptForCancel ifTrue: [ self textModel clearUserEdits  ].
	^ self textModel canDiscardEdits
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>open [
	| window bar editor |
	window := (StandardWindow labelled: 'Method editor with shout') model: self.
	editor := self newScrolledText.
	editor hResizing: #spaceFill; vResizing: #spaceFill.
	window addMorph: (window newColumn: { window newRow: { self classSelector. self metaSwitch. self methodSelector}. editor} )
		fullFrame: LayoutFrame identity.
	^ window openInWorld
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>promptForCancel [
	"Ask if it is OK to cancel changes"
	
	^(self confirm:
'Changes have not been saved.
Is it OK to cancel changes?' translated)
			
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>selectedClass [
	self className ifNil: [ ^ nil ]. 
	^ Smalltalk globals at: self className ifAbsent: []
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>selectedClassOrMetaClass [
	^ self classToUse 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>selector: aSymbol [
	selector := aSymbol ifNotNil: [:sel |( sel copyWithout: Character cr) asSymbol].
	self updateCodeWith: ''.
	self changed: #selector.
	self classToUse 
		ifNotNil: [:cls | (cls selectors includes: selector)
			ifTrue: [self updateCodeWith:  (cls sourceCodeAt: selector)]]
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>shoutAboutToStyle: ATextView [

	ATextView classOrMetaClass: self classToUse.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>textModel [
	^ textModel ifNil: [ textModel := RubScrolledTextModel new interactionModel: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMethodEditingExample>>updateCodeWith: someText. [
	self textModel setText: someText.

]
