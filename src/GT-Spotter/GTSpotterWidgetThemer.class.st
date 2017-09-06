"
This is a themer for all spotter morphs.

To customize it, it has to be subclassed and pointed to from:
ACustomTheme>>spotterWidgetThemer
"
Class {
	#name : #GTSpotterWidgetThemer,
	#superclass : #GLMBrickThemerModule,
	#category : #GT-Spotter-Theme,
	#timestamp : 'TudorGirba 11/26/2014 15:15'
}

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>backgroundColor [
	"used as background color for all panes"
	^ Color white
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>borderColor [
	"color that is used for border and dividers of UI parts of Spotter
	for example divider between header and results or between preview and list"
	^ Color r: 180 g: 180 b: 180 range: 255
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbHeight [

	^ 26
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbItemBackgroundColor [

	^ self borderColor
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbItemLabelStyleFor: aBrick [

	aBrick
		textPosition: #center;
		padding: { 0 . self outerBorderWidth };
		vSpaceFill;
		hSpaceFill
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbItemLabelWidgetStyleFor: aBrick [

	aBrick
		color: self breadcrumbItemBackgroundColor;
		textColor: self breadcrumbItemTextColor
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbItemStyleFor: aBrick [

	aBrick vSpaceFill
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbItemTextColor [

	^ Color white
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbItemTriangleStyleFor: aBrick [

	aBrick
		height: self breadcrumbTriangleHeight;
		hSpaceFill
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbItemTriangleWidgetStyleFor: aBrick [

	aBrick
		renderer: (GTSpotterTriangleRenderer new orientation: #bottom).
		
	aBrick owner isTriangleVisible
		ifTrue:[ aBrick color: self breadcrumbItemBackgroundColor ]
		ifFalse: [ aBrick color: Color transparent ]
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbSeparatorColor [

	^ self breadcrumbItemBackgroundColor muchLighter slightlyDarker
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbSeparatorLineWidth [

	^ 2
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbSeparatorStyleFor: aBrick [

	aBrick
		borderWidth: self breadcrumbSeparatorLineWidth;
		width: self breadcrumbSeparatorWidth;
		height: self breadcrumbHeight + self outerBorderWidth.
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbSeparatorWidgetStyleFor: aBrick [

	aBrick
		color: self breadcrumbItemBackgroundColor;
		borderColor: self breadcrumbSeparatorColor;
		renderer: GTSpotterBreadcrumbSeparatorRenderer new
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbSeparatorWidth [

	^ (self breadcrumbHeight + self outerBorderWidth) / 2 + 4 "we need slightly more because of drawing accuracy"
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbStyleFor: aBrick [
	
	aBrick
		margin: { 0 . 0 };
		marginBottom: self breadcrumbTriangleHeight negated;
		height: self breadcrumbHeight + self breadcrumbTriangleHeight.
		
	aBrick layout
		zIndex: 2.
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>breadcrumbTriangleHeight [

	^ 16
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>buttonPressedColor [

	^ self backgroundColor darker
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryAmountStyleFor: aBrick [

	aBrick
		textPosition: #leftCenter.
	
	aBrick label
		familyName: self titleFamilyName.
	
	aBrick
		vSpaceFill;
		width: #approximateWidth;
		marginLeft: self categoryNameMarginRight.
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryAmountWidgetStyleFor: aBrick [

	aBrick
		textColor: self titleTextColor;
		color: self titleBackgroundColor
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryMarginBottom [

	^ (self itemHeight * (2/3)) ceiling "pixels"
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryNameMarginLeft [

	^ self itemIconMaxWidth
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryNameMarginRight [

	^ 10
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryStyleFor: aBrick [

	aBrick
		marginBottom: self categoryMarginBottom;
		hSpaceFill
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryTitleBackgroundColor [

	^ self backgroundColor alpha: 0.95
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryTitleNameStyleFor: aBrick [

	aBrick
		vSpaceFill;
		textPosition: #leftCenter;
		width: [ :name | (aBrick owner innerBounds width) min: ((name label textSize x) + name label hMargin) ].
	
	aBrick label
		familyName: self titleFamilyName.
	
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryTitleNameWidgetStyleFor: aBrick [

	aBrick
		textColor: self titleTextColor;
		color: self titleBackgroundColor
	
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryTitleShortcutStyleFor: aBrick [

	aBrick
		vSpaceFill;
		textPosition: #leftCenter;
		textColor: self titleTextColor.
	
	aBrick label
		familyName: 'Lucida Grande'.
	
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryTitleStyleFor: aBrick [

	aBrick
		useHorizontalLinearLayout;
		height: 30;
		hSpaceFill;
		paddingLeft: self categoryNameMarginLeft
	
	"aBrick layout
		floating: #stack;
		maxWidth: [ :title |
			aBrick hPadding + 
			(title nameBrick label textSize x )+ title amountBrick label textSize x +
			title nameBrick hPadding + title nameBrick hMargin + 
			title nameBrick label hPadding + title nameBrick label hMargin + 
			title amountBrick hMargin ]"
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>categoryTitleWidgetStyleFor: aBrick [

	aBrick
		normalColor: self categoryTitleBackgroundColor
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>closeButtonStyleFor: aBrick [

	aBrick
		vSpaceFill;
		width: [ :m | m height ];
		margin: 10;
		marginLeft: 0
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>closeButtonWidgetStyleFor: aBrick [

	aBrick
		normalImage: GLMUIThemeExtraIcons glamorousClose;
		pressedColor: self buttonPressedColor
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>dropDownPaneStyleFor: aBrick [

	aBrick
		layoutProperties: GLMBrickLayoutProperties new;
		marginTop: self innerBorderWidth;
		vSpaceFill;
		hSpaceFill
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>headerHeight [
	"height of the header where user enters search request"
	^ 56
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>headerStyleFor: aBrick [

	aBrick
		hSpaceFill;
		height: self headerHeight
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>headerWidgetStyleFor: aBrick [

	aBrick
		color: self backgroundColor
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>helpButtonStyleFor: aBrick [

	aBrick
		vSpaceFill;
		width: [ :m | m height ];
		margin: 10;
		marginLeft: 0
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>helpButtonWidgetStyleFor: aBrick [

	aBrick
		normalImage: GLMUIThemeExtraIcons glamorousHelp;
		pressedColor: self buttonPressedColor
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>hintHideArrowStyleFor: aBrick [

	aBrick ifNil: [ ^ self ].
	(aBrick valueOfProperty: #brickSpotterIsReveal ifAbsent: [ false ])
		ifFalse: [ ^ self ].
	aBrick setProperty: #brickSpotterIsReveal toValue: false.
	
	(aBrick hasProperty: #brickSpotterBackupColor)
		ifTrue: [ aBrick color: (aBrick valueOfProperty: #brickSpotterBackupColor) ].
		
	aBrick changed
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>hintHideStyleFor: aBrick [

	aBrick ifNil: [ ^ self ].
	(aBrick valueOfProperty: #brickSpotterIsReveal ifAbsent: [ false ])
		ifFalse: [ ^ self ].
	aBrick setProperty: #brickSpotterIsReveal toValue: false.
	
	(aBrick hasProperty: #brickSpotterBackupColor)
		ifTrue: [ aBrick color: (aBrick valueOfProperty: #brickSpotterBackupColor) ].
		
	(aBrick hasProperty: #brickSpotterBackupBorder)
		ifTrue: [ aBrick border: (aBrick valueOfProperty: #brickSpotterBackupBorder) ].
		
	aBrick changed
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>hintRevealArrowStyleFor: aBrick [
	
	SmalltalkImage current vm canHandleShiftPressed
		ifTrue: [ ^ self ].
	
	aBrick ifNil: [ ^ self ].
	(aBrick valueOfProperty: #brickSpotterIsReveal ifAbsent: [ false ])
		ifTrue: [ ^ self ].
	
	aBrick setProperty: #brickSpotterBackupColor toValue: aBrick color.
	aBrick setProperty: #brickSpotterIsReveal toValue: true.
	
	aBrick color: self themer popupHelpThemer backgroundColor.
	
	aBrick changed
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>hintRevealStyleFor: aBrick [
	
	SmalltalkImage current vm canHandleShiftPressed
		ifTrue: [ ^ self ].
	
	aBrick ifNil: [ ^ self ].
	(aBrick valueOfProperty: #brickSpotterIsReveal ifAbsent: [ false ])
		ifTrue: [ ^ self ].
	
	aBrick setProperty: #brickSpotterBackupColor toValue: aBrick color.
	aBrick setProperty: #brickSpotterBackupBorder toValue: aBrick border.
	aBrick setProperty: #brickSpotterIsReveal toValue: true.
	
	aBrick color: self themer popupHelpThemer backgroundColor.
	aBrick border: GLMBrickBorder new.
	aBrick borderColor: (self themer popupHelpThemer borderColor alpha: 0.6).
	aBrick borderWidth: self themer popupHelpThemer borderWidth.
	
	aBrick changed
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>iconAct [
	^ self iconNamed: #glamorousAccept
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>iconDiveIn [
	^ self iconNamed: #glamorousDiveRightIcon
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>iconDiveInCategory [
	^ self iconNamed: #glamorousDiveAllRightIcon
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>innerBorderWidth [
	"width of the border that separates panes in the spotter"
	^ 1
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemActionButtonStyleFor: aBrick [

	aBrick
		width: [ (self itemHeight / 1.1) floor ];
		vSpaceFill;
		margin: #(0 1);
		padding: { 0 . self outerBorderWidth }
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemActionButtonWidgetStyleFor: aBrick [

	aBrick
		pressedColor: self itemActionSelectedBackgroundColor
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemActionSelectedBackgroundColor [

	^ self itemSelectedBackgroundColor darker
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemActionbarStyleFor: aBrick [

	aBrick
		useHorizontalLinearLayout;
		hShrinkWrap;
		vSpaceFill;
		marginRight: self outerBorderWidth + 2;
		visible: false
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemHeight [

	^  16 + Smalltalk ui theme labelFont height
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemHoveredBackgroundColor [

	^ self itemSelectedBackgroundColor alpha: 0.35
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemIconAlphaValue [

	^ 0.8
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemIconMaxWidth [

	^ 50
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemIconStyleFor: aBrick [
	"icon form must already be set before styling"

	self flag: 'figure out why alpha doesn''t work'.
	aBrick
		"making icon a bit transparent"
		"normalImage: (aBrick normalImage asAlphaImageMorph alpha: self itemIconAlphaValue) imageForm;"
		width: self itemIconMaxWidth;
		vSpaceFill
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemLabelStyleFor: aBrick [

	aBrick label
		highlightingLogic: [ :aCanvas :aRectangle | |bounds|
			"because font calculates text width wrong"
			bounds := aRectangle translateBy: (-3@0).
			aCanvas line: bounds bottomLeft to: bounds bottomRight width: 1 color: Color lightGray ].
	
	aBrick
		hSpaceFill;
		vSpaceFill;
		marginRight: self outerBorderWidth.
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemNormalBackgroundColor [

	^ Color transparent
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemNormalStyleFor: aBrick [

	aBrick
		height: [ self itemHeight ];
		hSpaceFill
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemNormalWidgetStyleFor: aBrick [

	aBrick
		normalColor: self itemNormalBackgroundColor;
		selectedColor: self itemHoveredBackgroundColor;
		checkedColor: self itemSelectedBackgroundColor
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>itemSelectedBackgroundColor [

	^ self backgroundColor darker
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>outerBorderWidth [
	"the width of the border around the whole spotter"
	^ 4
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>previewArrowColor [

	^ self itemSelectedBackgroundColor
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>previewArrowGapHack [

	^ self themer scrollbarOffset + self themer scrollbarWidth + self outerBorderWidth + 1"pager bug"
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>previewArrowWidth [

	^ (self itemHeight / 2) + self previewArrowGapHack
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>previewBorderWidth [

	^ self outerBorderWidth
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>previewPaddingLeft [

	^ self previewArrowWidth * 1.2
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>previewPaddingRight [

	^ self previewPaddingLeft


]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>previewWidthPercent [

	^ 40
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>privacyAgreementIsNotSendingDataColor [

	^ Color paleRed
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>privacyAgreementIsSendingDataColor [

	^ Color paleGreen
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>privacyAgreementNotificationStyleFor: aBrick [

	| color |
	color := aBrick sendUsageData 
		ifTrue: [ self privacyAgreementIsSendingDataColor. ]
		ifFalse: [ self privacyAgreementIsNotSendingDataColor. ].
	aBrick messageBrick rubricTextFamilyName: StandardFonts defaultFont familyName.
	aBrick messageBrick rubricTextColor: Color black.
	aBrick
		color: color;
		borderColor: color darker;
		borderWidth: self outerBorderWidth;
		marginTop: 0
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>resultsPaneStyleFor: aBrick [

	aBrick
		hSpaceFill: self resultsPaneWidth;
		vSpaceFill;
		with: [ :b | b band layout: GTSpotterStackedLayout new ]
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>resultsPaneWidth [
	"width in Percents of the results pane"
	^ 100"%"
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>searchFieldFamilyName [

	^ 'Source Sans Pro'
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>searchFieldFontSize [

	^ 15
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>searchFieldMarginLeft [

	^ 20
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>searchFieldStyleFor: aBrick [
	
	aBrick
		beCentered;
		hSpaceFill;
		vSpaceFill;
		withoutMargins;
		withoutAdornment;
		withoutBorder;
		beTransparent;
		withGhostText: self spotterGhostText;
		autoAccept: true;
		marginLeft: self searchFieldMarginLeft;
		rubricTextFamilyName: self searchFieldFamilyName;
		rubricTextFontSize: self searchFieldFontSize.
	
	aBrick rubric ghostTextRuler
		fontName: self searchFieldFamilyName pointSize: self searchFieldFontSize.
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>searchFieldTextColor [
	
	^ Color black
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>searchFieldWidgetStyleFor: aBrick [
	
	aBrick morph
		color: Color transparent;
		textColor: self searchFieldTextColor;
		borderColor: Color transparent.
		
	aBrick morph textArea
		backgroundColor: Color transparent
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>settingsButtonStyleFor: aBrick [

	aBrick
		vSpaceFill;
		width: [ :m | m height ];
		margin: #(10 0);
		marginRight: 2
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>settingsButtonWidgetStyleFor: aBrick [
	aBrick
		normalImage: (Smalltalk ui icons iconNamed: #glamorousPreferences);
		pressedColor: self buttonPressedColor
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>settingsLabelPadding [

	^ 4
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>settingsLabelSelectedTextColor [

	^ Color black
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>settingsLabelTextColor [

	^ Color white
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterContentsStyleFor: aBrick [
	
	aBrick
		useVerticalLinearLayout;
		borderWidth: self outerBorderWidth;
		padding: self outerBorderWidth;
		hSpaceFill;
		vSpaceFill.
	
	aBrick layout
		zIndex: 2
	
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterContentsWidgetStyleFor: aBrick [
	
	aBrick
		borderColor: self borderColor;
		color: self borderColor
	
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterGhostText [

	^ 'Search'
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterPaneStyleFor: aBrick [
	
	aBrick
		useHorizontalLinearLayout;
		hSpaceFill;
		vSpaceFill
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterPreviewArrowContainerStyleFor: aBrick [

	aBrick
		useVerticalLinearLayout;
		vSpaceFill;
		width: self previewArrowWidth;
		margin: {
			self headerHeight + self innerBorderWidth + self previewBorderWidth.
			0.
			self previewBorderWidth.
			self previewArrowGapHack negated }.
		
	aBrick layout
		zIndex: 4.
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterPreviewArrowStyleFor: aBrick [

	aBrick
		hSpaceFill;
		renderer: (GTSpotterTriangleRenderer new orientation: #right);
		height: [ (self previewArrowWidth - self previewArrowGapHack ) * 2 ]
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterPreviewArrowWidgetStyleFor: aBrick [

	aBrick owner isTriangleVisible
		ifTrue: [
			aBrick color: self previewArrowColor.
			aBrick renderer borderColor: self borderColor ]
		ifFalse: [
			aBrick color: Color transparent.
			aBrick renderer borderColor: Color transparent ].
	
	GTSpotter isPreviewVisible
		ifTrue: [ 
			aBrick selectedColor: self borderColor.
			aBrick renderer border: 0 ]
		ifFalse: [
			aBrick selectedColor: Color transparent.
			aBrick renderer border: self outerBorderWidth ]
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterPreviewCompositeStyleFor: aBrick [

	aBrick
		hSpaceFill;
		vSpaceFill;
		margin: self previewBorderWidth;
		paddingLeft: self previewPaddingLeft
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterPreviewStyleFor: aBrick [
	
	aBrick
		borderWidth: self previewBorderWidth;
		hSpaceFill: self previewWidthPercent;
		vSpaceFill;
		margin: { self headerHeight + self innerBorderWidth. 0 . 0};
		marginLeft: (self previewBorderWidth + self previewArrowWidth) negated.
	
	aBrick layout
		zIndex: 1
]

{
	#category : #styles-widget,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterPreviewWidgetStyleFor: aBrick [
	
	aBrick
		borderColor: self borderColor;
		color: self backgroundColor
]

{
	#category : #styles,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>spotterStyleFor: aBrick [

	aBrick brickRoot useVerticalLinearLayout
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>titleBackgroundColor [

	^ Color transparent
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>titleFamilyName [
	^ 'Open Sans'.
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>titleMarginLeft [
	^ 20
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetThemer>>titleTextColor [

	^ self themer textLightColor
]
