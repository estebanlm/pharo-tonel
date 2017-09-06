"
Groupbox with title with a vertical layout. Appears in a lighter colour than the owner's pane colour.
"
Class {
	#name : #GroupboxMorph,
	#superclass : #MorphicModel,
	#instVars : [
		'contentMorph',
		'labelMorph',
		'getContentSelector'
	],
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 12:36'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>addContentMorph: aMorph [
	"Add a morph to the content."

	^self contentMorph addMorphBack: aMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>adoptPaneColor: paneColor [
	"Pass on to the content morph."
	
	|c|
	paneColor ifNil: [^super adoptPaneColor: paneColor].
	c := self theme subgroupColorFrom: paneColor.
	super adoptPaneColor: c.
	self contentMorph borderStyle: (self theme groupPanelBorderStyleFor: self).
	self labelMorph
		color: paneColor blacker muchDarker;
		backgroundColor: c;
		borderStyle: (self theme groupLabelBorderStyleFor: self)
]

{
	#category : #'geometry testing',
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>containsPoint: aPoint [
	"Override here to check the label and content instead."
	
	^(super containsPoint: aPoint) and: [
		(self labelMorph containsPoint: aPoint) or: [
		self contentMorph containsPoint: aPoint]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>contentFromModel [
	"Answer content from the model."
	
	^self getContentSelector ifNotNil: [:s |
		self model ifNotNil: [:m | m perform: s]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>contentMorph [
	"Answer the value of contentMorph"

	^ contentMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>contentMorph: anObject [
	"Set the value of contentMorph"

	contentMorph := anObject
]

{
	#category : #rounding,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>cornerStyle: aSymbol [
	"Pass on to list too."

	super cornerStyle: aSymbol.
	self labelMorph cornerStyle: aSymbol.
	self contentMorph cornerStyle: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>font [
	"Answer the label font"

	^self labelMorph font
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>font: aFont [
	"Set the label font"

	self labelMorph font: aFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>getContentSelector [

	^ getContentSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>getContentSelector: anObject [

	getContentSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>initialColorInSystemWindow: aSystemWindow [
	"Answer the colour the receiver should be when added to a SystemWindow."

	^Color transparent
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		roundedCorners: #(2 3 4);
		borderWidth: 0;
		changeTableLayout;
		cellPositioning: #topLeft;
		cellInset: 0 @ -1;
		reverseTableCells: true;
		labelMorph: self newLabelMorph;
		contentMorph: self newContentMorph;
		addMorphBack: self contentMorph;
		addMorphBack: self labelMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>label [
	"Answer the contents of the label morph."

	^self labelMorph contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>label: aString [
	"Set the contents of the label morph."

	aString ifNil: [
		self roundedCorners: #(1 2 3 4).
		self labelMorph delete. ^self].
	self roundedCorners: #(2 3 4).
	self labelMorph owner ifNil: [
		self addMorph: self labelMorph].
	self labelMorph contents: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>labelMorph [
	"Answer the value of labelMorph"

	^ labelMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>labelMorph: anObject [
	"Set the value of labelMorph"

	labelMorph := anObject
]

{
	#category : #'geometry testing',
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>minExtent [
	"Answer the minmum extent of the receiver.
	Based on label and rounding."

	^super minExtent max: self labelMorph minExtent + (8@0)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>newContentMorph [
	"Answer a new content morph"

	|p|
	p := PanelMorph new
		roundedCorners: self roundedCorners;
		changeTableLayout; 
		layoutInset: 4;
		cellInset: 8;
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	p borderStyle: (self theme groupPanelBorderStyleFor: p).
	^p
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>newLabelMorph [
	"Answer a new label morph"

	^TextMorph new
		roundedCorners: #(1 4);
		margins: (2@1 corner: 2 @ -1);
		contents: 'groupbox';
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		lock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>paneColorOrNil [
	"Answer the window's pane color or nil otherwise."

	^super paneColorOrNil ifNotNil: [:c | self theme subgroupColorFrom: c]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>replaceContentMorph: aMorph [
	"Replace the content."

	self contentMorph
		removeAllMorphs;
		addMorphBack: aMorph.
	self adoptPaneColor: super paneColorOrNil.
	^aMorph
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>roundedCorners: anArray [
	"Set the corners to round."

	super roundedCorners: anArray.
	self contentMorph ifNotNil: [:cm | cm roundedCorners: self roundedCorners]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>selectedTab [
	"Answer the label morph for compatibility with TabPanelBorder."
	
	^self labelMorph owner
		ifNotNil: [self labelMorph]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupboxMorph>>update: aSymbol [
	"Replace the content if appropriate."
	
	super update: aSymbol.
	aSymbol = self getContentSelector ifTrue: [
		self contentFromModel ifNotNil: [:c | self replaceContentMorph: c]]
		
]
