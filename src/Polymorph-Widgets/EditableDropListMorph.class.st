"
I'm a DropListMorph which content can be modified.

Try:

(EditableDropListMorph
        on: [#(one two three)]
        list: #value
        selected: nil
        changeSelected: nil) openInWindow extent: 400@20.
"
Class {
	#name : #EditableDropListMorph,
	#superclass : #DropListMorph,
	#instVars : [
		'addToListSel',
		'content'
	],
	#category : #Polymorph-Widgets,
	#timestamp : 'LaurentLaffont 3/31/2011 21:04'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph class>>on: anObject list: getListSel selected: getSelectionSel changeSelected: setSelectionSel useIndex: useIndex addToList: addToListSel class: aClass getEnabled: getEnabledSel  [
	^ self
		on: anObject
		list: getListSel
		selected: getSelectionSel
		changeSelected: setSelectionSel
		useIndex: useIndex
		addToList: addToListSel
		class: aClass
		getEnabled: getEnabledSel
		default: '' 
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph class>>on: anObject list: getListSel selected: getSelectionSel changeSelected: setSelectionSel useIndex: useIndex addToList: addToListSel class: aClass getEnabled: getEnabledSel default: aDefaultValue [
	^ (super
		on: anObject
		list: getListSel
		selected: getSelectionSel
		changeSelected: setSelectionSel
		useIndex: useIndex) convertTo: aClass;
		 getEnabledSelector: getEnabledSel;
		 addToListSel: addToListSel;
		 default: aDefaultValue;
		 yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>addToListSel: aSelector [
	addToListSel := aSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>adoptPaneColor: paneColor [
	"Clear the fill style of the text."
	
	super adoptPaneColor: paneColor.
	self contentMorph fillStyle: Color transparent 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>content [
	^ content

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>content: anObject  [
	content := anObject.
	self model perform: addToListSel with: content.
	self listSelectionIndex: (self list indexOf: content).
	self updateList
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>convertTo: aClass  [
	self contentMorph convertTo: aClass 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>converter [
	^ self contentMorph converter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>default: anObject  [
	self contentMorph default: anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>defaultContents [
	"needs nothing to activate the ghostText"
	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>enabled: aBoolean [
	"Set the value of enabled"
	
	super enabled: aBoolean.
	self
		contentMorph enabled: aBoolean;
		fillStyle: Color transparent 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>font: aFont [
	"Set the list and content font"

	self listMorph font: aFont.
	self contentMorph font: aFont
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>ghostText: aText [
	self contentMorph ghostText: aText

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>layoutInsetToUse [
	"Answer the layout inset that should be used."

	^ 0
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>listHeight [
	"Answer the height for the list."
	^(self listMorph listMorph height + 12) min: 200
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>minHeight [
	"Answer the minimum height for the drop list."
	
	^self theme textFont height + 7
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>newContentMorph [
	"Answer a new content morph"
	
	| pt |
	pt := PluggableTextFieldMorph new
		convertTo: String;
		alwaysAccept: true;
		on: self
		text: #content
		accept: #content:
		readSelection: nil
		menu: nil;
		acceptOnCR: true;
		getEnabledSelector: nil;
		font: self theme textFont;
		cornerStyle: (self theme textEntryCornerStyleIn: self);
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderStyle: (BorderStyle simple width: 0);
		hideScrollBarsIndefinitely;
		setBalloonText: nil.
		
	pt textMorph autoFit: true;
		wrapFlag: false;
		margins: self theme editableDropListMargins.
		
	^ pt
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>objectAsString: anObject [
	^ self converter objectAsString: anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>updateContentMorphWith: aString [

	content := aString.
	self contentMorph setText: aString
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
EditableDropListMorph>>wantsFrameAdornments: aBoolean [
	self contentMorph wantsFrameAdornments: aBoolean
]
