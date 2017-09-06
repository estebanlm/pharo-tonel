"
I'm an object holding information to choose a font from a list of fonts.
"
Class {
	#name : #FontChooser,
	#superclass : #Model,
	#instVars : [
		'title',
		'selectedFontIndex',
		'fontList',
		'fontListStrings',
		'target',
		'getSelector',
		'setSelector',
		'pointSize',
		'fontStyleList',
		'selectedFontStyleIndex',
		'weightValue',
		'slantValue',
		'stretchValue',
		'pointSizeList'
	],
	#category : #FontChooser,
	#timestamp : 'StephaneDucasse 1/1/2010 18:00'
}

{
	#category : #open,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser class>>openWithWindowTitle: titleString for: anObject setSelector: setSelector getSelector: getSelector [
	"FontChooser openWithWindowTitle: 'Choose the Menu Font' for: StandardFonts setSelector: #menuFont: getSelector: #menuFont"
	
	| instance windowMorph world |
	instance := self new.
	instance 
		title: titleString;
		target: anObject;
		setSelector: setSelector;
		getSelector: getSelector.
	world := self currentWorld.
	(windowMorph := FontChooserMorph withModel: instance)
		"position: self currentWorld primaryHand position;"
		position: ((World width-640)/2)@((World height-480)/2);
		extent: 640@480;
		open.
	^windowMorph
 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser class>>windowTitle: titleString for: anObject setSelector: setSelector getSelector: getSelector [
	
	| instance answer |
	instance := self new.
	instance 
		title: titleString;
		target: anObject;
		setSelector: setSelector;
		getSelector: getSelector.
	(answer := FontChooserMorph withModel: instance)
		position: self currentWorld primaryHand position;
		extent: 450@220;
		createWindow.
	^answer
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>apply [

	(target isNil or: [ setSelector isNil ]) ifTrue: [ ^ self ].			
	self selectedFont ifNotNil: [ :font | target perform: setSelector with: font ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>fontList [
	
	^ fontList ifNil: [ self refreshFontList ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>fontListStrings [

	| isUpdateRequired |
	isUpdateRequired := fontListStrings isNil or: [fontList size ~= fontListStrings size].
	isUpdateRequired ifTrue: [
		fontListStrings := self fontList collect: [:each | each familyName]].
	^ fontListStrings
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>fontStyleList [

	^ self selectedFontFamily
		ifNil: [ #() ]
		ifNotNil: [ :family | fontStyleList := family members asSortedCollection ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>fontStyleListStrings [
	"names of simulated styles are enclosed in parenthesis"

	^ self fontStyleList collect: [:fontFamilyMember | | styleName |
		styleName := fontFamilyMember styleName.
		fontFamilyMember simulated
			ifTrue: ['(', styleName, ')']
			ifFalse: [styleName]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>getSelector [

	^ getSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>getSelector: aSelectorSymbolOrFont [

	getSelector := aSelectorSymbolOrFont
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>initialize [
	super initialize.
	title := 'Choose A Font'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>pointSize [

	^ pointSize ifNil: [pointSize := 10.0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>pointSize: aNumber [

	pointSize := aNumber.
	self announcer announce: #pointSizeChanged.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>pointSizeList [

	pointSizeList ifNotNil: [ ^ pointSizeList ].
	^ pointSizeList := (1 to: 256) collect: [ :each | each asString padLeftTo: 3 ].
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>refreshFontList [
	
	^fontList := LogicalFontManager current allFamilies
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedFont [
	| font style |

	font := self unemphasizedSelectedFont.
	font ifNil:[^nil].
	style := self fontStyleList at: self selectedFontStyleIndex ifAbsent:[nil].
	style ifNil:[^nil].
	(style isKindOf: TextStyleAsFontFamilyMember)
		ifTrue:[	^font emphasized: style emphasisCode].		
	^LogicalFont 
		familyName: font familyName 
		pointSize: pointSize 
		stretchValue: style stretchValue
		weightValue: style weightValue
		slantValue: style slantValue

	
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedFontFamily [

	^ self fontList at: self selectedFontIndex ifAbsent: [nil].
	
	
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedFontIndex [
	| font textStyleName family |
	
	selectedFontIndex ifNotNil: [^selectedFontIndex].
	selectedFontIndex := 0.
	font := (getSelector isSymbol and:[target notNil])
		ifTrue:[target perform: getSelector]
		ifFalse:[getSelector].
	self setStyleValuesFrom: font.
	(font isKindOf: AbstractFont)
		ifTrue:[
			pointSize := font pointSize.
			textStyleName := font textStyleName.
			family := self fontList detect:[:f | f familyName = textStyleName] ifNone:[].
			selectedFontIndex := self fontList indexOf: family ifAbsent:[0]].
	self selectedFontIndex: selectedFontIndex.
	^selectedFontIndex
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedFontIndex: anIndex [

	| family member newStyleIndex |
	anIndex = 0 ifTrue: [^self].
	selectedFontIndex := anIndex.
	"change the selected style to be the closest to the last
	user selected weight slant and stretch values. 
	By user selected I mean that the user changed the style list selection, 
	rather than a change being forced because a particular family didn't have that style"
	family := self fontList at: selectedFontIndex.
	member := family closestMemberWithStretchValue: stretchValue weightValue: weightValue slantValue: slantValue.
	newStyleIndex := self fontStyleList indexOf: member.
	selectedFontStyleIndex := newStyleIndex. 
	self setPointSizeListFrom: member.
	self announcer announce: #selectedFontStyleIndex.
	self announcer announce: #selectedFontIndex.
	
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedFontStyleIndex [
	| family member |
	selectedFontStyleIndex ifNotNil: [
		^selectedFontStyleIndex := selectedFontStyleIndex min: self fontStyleList size].
	family := self fontList at: selectedFontIndex ifAbsent:[^0].
	member := family closestMemberWithStretchValue: stretchValue weightValue: weightValue slantValue: slantValue.
	selectedFontStyleIndex := self fontStyleList indexOf: member.
	^selectedFontStyleIndex
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedFontStyleIndex: anIndex [
	| familyMember |
	anIndex = 0
		ifTrue: [^self].
	selectedFontStyleIndex := anIndex.
	familyMember := self fontStyleList at: anIndex.
	self setStyleValuesFrom: familyMember.
	self announcer announce:  #selectedFontStyleIndex.
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedPointSize [
	^self selectedFont pointSize
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedPointSizeIndex [

	^self pointSizeList indexOf: (pointSize reduce asString padLeftTo: 3)
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>selectedPointSizeIndex: anIndex [

	anIndex = 0 ifTrue: [^self].
	pointSize := (self pointSizeList at: anIndex) trimBoth asNumber.
	self announcer announce: #pointSizeChanged.
	
]

{
	#category : #selected,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>setPointSizeListFrom: aFontFamilyMember [
	| style old new |
	old := pointSizeList.
	(aFontFamilyMember isKindOf: FontFamilyMemberAbstract)
		ifTrue:[
			style := TextStyle named: aFontFamilyMember family familyName.
			style ifNotNil:[
				new := style pointSizes collect: [:each | 
					each reduce asString padLeftTo: 3]]].
	new ifNil: [ new := (1 to: 256) collect: [:each | 
				each asString padLeftTo: 3 ]].
	
	pointSizeList := new.
	old ~= new ifTrue: [ self announcer announce: #pointSizeListChanged]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>setSelector: selector [

	setSelector := selector
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>setStyleValuesFrom: aFont [
	((aFont isKindOf: LogicalFont) or:[aFont isKindOf: FontFamilyMemberAbstract])
		ifTrue:[
			weightValue := aFont weightValue.
			slantValue := aFont slantValue.
			stretchValue := aFont stretchValue]
		ifFalse:[
			weightValue := (aFont emphasis bitAnd: 1) > 0 ifTrue:[700] ifFalse:[400].
			slantValue := (aFont emphasis bitAnd: 2) > 0 ifTrue:[1] ifFalse:[0].
			stretchValue := 5 "normal"]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>target [

	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>target: anObject [

	target := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>title: aString [

	title := aString
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>unemphasizedSelectedFont [
	|name font family |
	family := self fontList at: self selectedFontIndex ifAbsent:[nil].
	family ifNil:[^nil].
	(family isKindOf: TextStyleAsFontFamily)
		ifTrue:[^family textStyle fontOfPointSize: pointSize].
	name :=  family familyName.
	font := LogicalFont 
		familyName: name
		pointSize: pointSize 
		stretchValue: 5
		weightValue: 400
		slantValue: 0.
	font realFont isTTCFont "true for FreeTypeFont"
		ifFalse: [font := font textStyle fontOfPointSize: pointSize].
	^font

]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>updateFontList [
	FreeTypeFontProvider current updateFromSystem.
	self refreshFontList.
	self changed:#fontListStrings.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FontChooser>>windowTitle [
	^ title translated
]
