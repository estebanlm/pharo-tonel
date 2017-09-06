"
StringMorph is a ""lightweight"" Morph to display a String. It supports only a single font, color, and emphasis combination. For multiple text styles, use TextMorph.

Structure:
instance var    	Type              Description 
font 			StrikeFont 		(normally nil; then the accessor #font gives back TextStyle 
				or nil			defaultFont) 
emphasis 		SmallInteger	bitmask determining character attributes (underline, bold, 								italics, narrow, struckout) 
contents 		String 			The text that will be displayed. 
hasFocus 		Boolean 		Do I have the keyboard focus or not? 

A StringMorph may also be used like a SimpleButtonMorph to do an action when clicked. Use the menu 'extras' / 'add mouseUpAction'.

The following propery will be defined:
aStringMorph valueOfProperty: #mouseUpCodeToRun
"
Class {
	#name : #StringMorph,
	#superclass : #Morph,
	#traits : 'TAbleToRotate',
	#classTraits : 'TAbleToRotate classTrait',
	#instVars : [
		'font',
		'emphasis',
		'contents',
		'hasFocus',
		'backgroundColor'
	],
	#classVars : [
		'EditableStringMorph'
	],
	#category : #Morphic-Base-Basic,
	#timestamp : 'PavelKrivanek 6/28/2017 09:57'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph class>>contents: aString [
	" 'StringMorph contents: str' is faster than 'StringMorph new contents: str' "
	^ self contents: aString font: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph class>>contents: aString font: aFont [
	^ self contents: aString font: aFont emphasis: 0
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph class>>contents: aString font: aFont emphasis: emphasisCode [
	^ self new initWithContents: aString font: aFont emphasis: emphasisCode
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph class>>editableStringMorph [
	^ EditableStringMorph ifNil: [EditableStringMorph := false]
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph class>>editableStringMorph: aBoolean [
	EditableStringMorph := aBoolean
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph class>>exampleFullEmphaisedString [

	| font |
	
	font := LogicalFont familyName: StandardFonts defaultFont familyName pointSize: 42. 

	^ (self contents: 'This is a StringMorph with emphasis 2r11111' font: font emphasis: 2r11111) 
			position: 100@100;
			backgroundColor: Color orange;
			openInWorld
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph class>>exampleManyStringMorphs [
	"Return a morph with lots of strings for testing display speed."
	<exampleWidget>
	"self test openInWorld"
	
	| c |
	c := AlignmentMorph newColumn.
	self class environment organization categories do:
		[:cat | c addMorph: (StringMorph new contents: cat)].
	^ c
]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>acceptContents [
	"The message is sent when the user hits enter or Cmd-S. Accept the current contents and end editing. This default implementation does nothing."

]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>acceptValue: aValue [
	| val |
	self contents: (val := aValue asString).
	^ val
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>addCustomMenuItems: aCustomMenu hand: aHandMorph [

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'change font' selector: #changeFont.
	aCustomMenu add: 'change emphasis' selector: #changeEmphasis.

]

{
	#category : #'halos and balloon help',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>addOptionalHandlesTo: aHalo box: box [
	self flag: #deferred.

	"Eventually...
	self addFontHandlesTo: aHalo box: box"
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>areasRemainingToFill: aRectangle [

	^ Array with: aRectangle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>backgroundColor [
	
	^backgroundColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>backgroundColor: aColor [

	backgroundColor := aColor 
]

{
	#category : #'halos and balloon help',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>boundsForBalloon [
	"Some morphs have bounds that are way too big.  This is a contorted way of making things work okay in PluggableListMorphs, whose list elements historically have huge widths"

	| ownerOwner |
	^ ((owner notNil and: [(ownerOwner := owner owner) notNil]) and:
			[ownerOwner isKindOf: PluggableListMorph])
		ifTrue:
			[self boundsInWorld intersect: ownerOwner boundsInWorld ifNone: [self boundsInWorld] ]
		ifFalse:
			[super boundsForBalloon]
]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>cancelEdits [

	self doneWithEdits
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>changeEmphasis [

	| reply |
	reply := UIManager default 
				chooseFrom: (self emphasisChoices collect: [:t | t translated]) 
				values: self emphasisChoices.
	reply ifNotNil: [ self emphasis: (TextEmphasis perform: reply) emphasisCode ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>contents [

	^ contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>contents: newContents  [
	self privateSetContents: newContents.
	self fitContents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>contentsClipped: aString [
	"Change my text, but do not change my size as a result"
	contents = aString ifTrue: [^ self].  "No substantive change"
	contents := aString.
	self changed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>contrastingBackgroundColor [
	"sets the backgroundColor to either black or white, which ever makes the string simplest to read"
	backgroundColor := self color contrastingColor 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>defaultColor [
	"answer the default color/fill style for the receiver"
	^ self theme textColor
]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>doneWithEdits [

	hasFocus := false
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>drawDropShadowOn: aCanvas [

	| bnd gap |
	bnd := self bounds translateBy: self shadowOffset.
	gap := self layoutInset.
	bnd := (bnd topLeft + gap) corner: (bnd bottomRight + gap).
	aCanvas drawString: contents in: bnd font: self fontToUse color: self shadowColor.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>drawOn: aCanvas [
	
	aCanvas
	
		fillRectangle: self bounds 
		fillStyle: self backgroundColor;
		
		drawString: self contents 
		in: self stringBounds 
		font: self fontToUse 
		color: self stringColor
		underline: (emphasis bitAnd: 2r100) ~~ 0
		underlineColor: self underlineColor 
		strikethrough: (emphasis bitAnd: 2r10000) ~~ 0
		strikethroughColor: self strikethroughColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>editorProvider [
	^ self valueOfProperty: #editorProvider ifAbsent: []
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>editorProvider: aValuable [
	self setProperty: #editorProvider toValue: aValuable
]

{
	#category : #font,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>emphasis: aNumber [
	"
	Set the receiver's emphasis as indicated. aNumber is a bitmask with the following format:
	
	bit 			attribute
	2r1	 (1) 		bold 
	2r10 (2)	 	italic 
	2r100 (4) 	underlined 
	2r1000	 (8) 	narrow 
	2r10000	 (16) 	strikethrough 
			
	examples: 
		2r0 -> plain.  
		2r1 -> bold. 
		2r11 -> bold + italic.  
		2r1101 -> bold + underlined + strikethrough.
	etc...
	"

	emphasis := aNumber.
	
	^ self font: font emphasis: emphasis
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>emphasisChoices [
	"Returns the emphasis selectors that are sent to a TextEmphasis."
	
	^ #(normal bold italic narrow underlined struckOut)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>enabled: aBoolean [

	aBoolean 
		ifTrue: [ self color: self defaultColor ]
		ifFalse: [ self color: self theme disabledTextColor ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>fitContents [

	| newBounds boundsChanged |
	newBounds := self measureContents.
	boundsChanged := bounds extent ~= newBounds.
	self extent: newBounds.		"default short-circuits if bounds not changed"
	boundsChanged ifFalse: [self changed]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>font [
	"who came up with #fontToUse rather than font?!"
	^self fontToUse
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>font: aFont  [
	"Set the font my text will use. The emphasis remains unchanged."

	font := aFont.
	^ self font: font emphasis: emphasis
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>font: aFont emphasis: emphasisCode [
	font := aFont.
	emphasis := emphasisCode.
	self fitContents.
"
in inspector say,
	 self font: (TextStyle default fontAt: 2) emphasis: 1
"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>fontName: fontName size: fontSize [

	^ self font: (StrikeFont familyName: fontName size: fontSize) 
			emphasis: 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>fontToUse [
	| fontToUse |
	fontToUse := font isNil ifTrue: [TextStyle defaultFont] ifFalse: [font].
	(emphasis isNil or: [emphasis = 0]) 
		ifTrue: [^fontToUse]
		ifFalse: [^fontToUse emphasized: emphasis]
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>fullBounds [
	self contents ifNil: [ self contents: 'String Morph' ].
	^super fullBounds
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>handlesMouseDown: evt [
	"If the shift key is pressed then yes.
	As normal if StringMorph class>> editableStringMorph  returns false."
	
	^ (self isEditable: evt)
		ifTrue: [true]
		ifFalse: [super handlesMouseDown: evt]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>hasFocus [
	^ hasFocus
]

{
	#category : #'*Morphic-Base-Widgets',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>heightToDisplayInList: aList [

	^ self contents heightToDisplayInList: aList 
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>imageForm: depth forRectangle: rect [
	| canvas |
	canvas := Display defaultCanvasClass extent: rect extent depth: depth.
	
	backgroundColor isTransparent ifTrue: [ 
		canvas form fillColor: self theme backgroundColor.
	].
	canvas translateBy: rect topLeft negated
		during:[:tempCanvas| tempCanvas fullDrawMorph: self].
	^ canvas form offset: rect topLeft
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>initWithContents: aString font: aFont emphasis: emphasisCode  [
	super initialize.
	
	font := aFont.
	emphasis := emphasisCode.
	hasFocus := false.
	self contents: aString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>initialize [
	"initialize the state of the receiver"
	super initialize.

	font := nil.
	emphasis := 0.
	hasFocus := false.
	backgroundColor := Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>interimContents: aString [
	"The receiver is under edit and aString represents the string the user sees as she edits, which typically will not have been accepted and indeed may be abandoned"

	self contents: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>isEditable [
	^ self editorProvider notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>isEditable: evt [
	"If the shift key is pressed then yes.
	As normal if StringMorph class>> editableStringMorph  returns false."
	
	^(self isEditable and: [evt shiftPressed])

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>isTranslucentButNotTransparent [
	"Answer true if this any of this morph is translucent but not transparent."
	^ true
]

{
	#category : #'private editing',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>launchEditor: evt [
	" Launch an editor to edit my contents "
	self editorProvider ifNil: [ ^self ].
	self editorProvider openEditorForStringMorph: self
]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>lostFocusWithoutAccepting [
	"The message is sent when the user, having been in an editing episode on the receiver, changes the keyboard focus -- typically by clicking on some editable text somewhere else -- without having accepted the current edits."

	self acceptContents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>measureContents [
	"Round up in case fractional."
	
	| f |
	f := self fontToUse.
	^((((f widthOfString: contents) max: self minimumWidth)  @ f height) + (self layoutInset * 2)) ceiling
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>minHeight [
	"Answer the minimum height of the receiver."
	
	^self fontToUse height max: super minHeight
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>minimumWidth [
	"Answer the minimum width that the receiver can have.  A nonzero value here keeps the receiver from degenerating into something that cannot ever be seen or touched again!  Obeyed by fitContents."

	^ 3
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>mouseDown: evt [
	"If the shift key is pressed, make this string the keyboard input focus.
	Process as normal if StringMorph class>> editableStringMorph  returns false."

	(self isEditable: evt)
		ifTrue: [self launchEditor: evt]
		ifFalse: [super mouseDown: evt].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>paneColor [
	"Answer the window's pane color or our owner's color otherwise."

	^self paneColorOrNil ifNil: [self owner ifNil: [Color transparent] ifNotNil: [self owner color]]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>printOn: aStream [

	super printOn: aStream.
	aStream print: contents.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>privateSetContents: newContents  [
	| scanner |
	contents := newContents isText
				ifTrue: [scanner := StringMorphAttributeScanner new initializeFromStringMorph: self.
					(newContents attributesAt: 1 forStyle: self font textStyle)
						do: [:attr | attr emphasizeScanner: scanner].
					emphasis := scanner emphasis.
					font := scanner font emphasis: emphasis.
					color := scanner textColor.
					newContents string]
				ifFalse: [contents = newContents
						ifTrue: [^ self].
					"no substantive change"
					newContents].
]

{
	#category : #'*Morphic-Base-MorphTreeWidget',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>rowMorphForNode: aNode inColumn: aColumn [
	| hasIcon |
	hasIcon := (aColumn container iconBlock value: aNode) notNil.
	(aColumn isFirstColumn and: [hasIcon]) 
		ifTrue: [^ super rowMorphForNode: aNode inColumn: aColumn].
	self layoutInset: aColumn container columnInset @ aColumn container rowInset.
	self fitContents.
	^ self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>setWidth: width [
	"Round up in case fractional."
	
	self extent: (width @ (font ifNil: [TextStyle defaultFont]) height) ceiling
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>strikethroughColor [

	^ self stringColor 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>stringBounds [

	| bnd gap |
	
	bnd := self bounds.
	gap := self layoutInset.
	
	^ (bnd topLeft + gap) corner: (bnd bottomRight + gap)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>stringColor [

	^ self color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>underlineColor [

	^ self stringColor 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>userString [
	"Do I have a text string to be searched on?"

	^ contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>valueFromContents [
	"Return a new value from the current contents string."
	^ contents
]

{
	#category : #editing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>wantsKeyboardFocusOnShiftClick [
	^ owner topRendererOrSelf wantsKeyboardFocusFor: self

]

{
	#category : #'*Morphic-Base-Widgets',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>widthToDisplayInList: aList [

	^ self contents widthToDisplayInList: aList 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>wouldAcceptKeyboardFocus [
	^ self isLocked not
]
