"
This is a TitleMorph used by MenuMorph.

""
	Example usage:

	| menu |
	
	menu := MenuMorph new.

	menu buildTitle: [ :titleMorph | titleMorph
		title: 'aCoolTitle';
		icon: self theme icons alertIcon;
		withCloseBox;
		withPinBox;
		color: Color purple		
	].

	... "" add items"" ...
	
	menu popUpInWorld

"
Class {
	#name : #MenuTitleMorph,
	#superclass : #AlignmentMorph,
	#instVars : [
		'titleContainer',
		'icon',
		'closeBox',
		'pinBox'
	],
	#category : #Morphic-Base-Menus,
	#timestamp : 'HenrikNergaard 9/8/2015 17:52'
}

{
	#category : #construction-defined,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>bigTitle: aTitle [

	self 
	withCloseBox;
	title: aTitle;
	font: StandardFonts windowTitleFont;
	withPinBox.
]

{
	#category : #private-creation,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>boxExtent [

	^18 @ 18
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>closeBoxClicked [

	owner ifNotNil: [ :o | o delete ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>defaultBorderColor [
	^ self theme settings flatMenu 
		ifFalse: [#inset]
		ifTrue: [self theme settings derivedMenuColor muchDarker]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>defaultColor [
	
	^self theme menuTitleColorFor: nil
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>font: aFont [

	titleContainer ifNil: [ ^self ]. "should really not happen!"
	
	titleContainer submorphsDo: [ :stringMorph | stringMorph font: aFont ].
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>icon: aForm [

	icon ifNotNil: [ icon delete ].
	icon := aForm asMorph.

	closeBox ifNotNil: [ ^self addMorph: icon after: closeBox  ].

	self addMorphFront: icon
]

{
	#category : #private-creation,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>iconButtonCalling: aSelector withForm: aForm helpText: aText [

	^IconicButton new target: self;
		actionSelector: aSelector;
		labelGraphic: aForm;
		color: Color transparent;
		extent: self boxExtent;
		borderWidth: 0;
		helpText: aText translated;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>initialize [
	super initialize.
	
	self 
	listDirection: #leftToRight;
	vResizing: #shrinkWrap;
	wrapCentering: #topLeft;
	cellPositioning: #center;
	cellSpacing: #none;
	layoutInset: 2;
	clipSubmorphs: true
]

{
	#category : #construction-defined,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>onlyCloseAndPinable [

	self 
	withCloseBox;
	title: '';
	withPinBox.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>pinBoxClicked [

	owner toggleStayUp.
	
	self updatePinForm
]

{
	#category : #pinning,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>pinColor [

	^owner stayUp ifTrue: [ Color gray lighter ] ifFalse: [ Color black ]
]

{
	#category : #pinning,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>pinForm [

	^CircleMorph new
		extent: 8@8;
		borderWidth: 2;
		color: self pinColor;
		imageForm
]

{
	#category : #rounding,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>roundedCorners [

	^#(1 4)
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>title: aString [

	titleContainer ifNotNil: [ titleContainer delete ].
	
	titleContainer := AlignmentMorph newColumn.
	titleContainer 
	color: Color transparent;
	hResizing: #spaceFill;
	vResizing: #shrinkWrap;
	wrapCentering: #center;
	layoutInset: 0;
	layoutChanged.
	
	aString translated linesDo: [ :line |
		titleContainer addMorphBack: (StringMorph contents: line font: StandardFonts menuFont)
	].
	
	pinBox ifNotNil: [ ^self addMorph: titleContainer inFrontOf: pinBox ].
	
	self addMorphBack: titleContainer 
]

{
	#category : #pinning,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>updatePinForm [

	pinBox ifNotNil: [ pinBox labelGraphic: self pinForm; extent: self boxExtent ].
]

{
	#category : #rounding,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>wantsRoundedCorners [
	^ color isTransparent not and: [ owner wantsRoundedCorners ]
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>withCloseBox [

	closeBox ifNotNil: [ closeBox delete ].	
		
	closeBox := self 
		iconButtonCalling: #closeBoxClicked 
		withForm: self theme menuCloseForm 
		helpText: 'Close this menu'.
		
	self addMorph: closeBox asElementNumber: 1
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 05:26:13'
}
MenuTitleMorph>>withPinBox [

	pinBox ifNotNil: [ pinBox delete ].	
		
	pinBox := self 
		iconButtonCalling: #pinBoxClicked 
		withForm: self pinForm
		helpText: 'Keep this menu up'.	
			
	self addMorph: pinBox asElementNumber: 4
]
