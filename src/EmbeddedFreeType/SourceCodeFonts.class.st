"
I'm a font setting for Source Code Pro fonts.
"
Class {
	#name : #SourceCodeFonts,
	#superclass : #Object,
	#category : #EmbeddedFreeType,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>codeFontName  [
	^ 'Source Code Pro'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>defaultFontName [
	^ 'Source Sans Pro'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>fontButton: aString size: size  [
	^ (Smalltalk ui theme 
		newButtonIn: World
			for: self
			getState: nil 
			action: #setSourceCodeFonts:	
			arguments: { size }
			getEnabled: nil
			getLabel: nil
			help: 'Change font style to Source Code Pro' translated)
		label: aString;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>fontName [
	^ 'Source Code Pro'
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>fontSourceCodeRow [
	| theme |
	
	theme := Smalltalk ui theme.
	^ theme newRowIn: World for: {
		theme buttonLabelForText: 'Predefined styles: ' translated.
		self fontButton: 'Small' size: self sizeSmall.
		self fontButton: 'Medium' size: self sizeMedium.
		self fontButton: 'Large' size: self sizeLarge.
		self fontButton: 'Very Large' size: self sizeVeryLarge.
		self fontButton: 'Huge' size: self sizeHuge	}	
		
		
]

{
	#category : #'font registration',
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>registerFonts: freeTypeFontManager [
	{ SourceSansProRegular. SourceCodeProRegular } do: [ :each |
		| font |
		font := each new.
		freeTypeFontManager 
			addFromFileContents: font fontContents 
			baseName: font originalFileName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>setSourceCodeFonts: pointSize [
	StandardFonts
		setAllStandardFontsTo: (LogicalFont familyName: self defaultFontName pointSize: pointSize);
		haloFont: (LogicalFont familyName: self defaultFontName pointSize: pointSize - 1);
		balloonFont: (LogicalFont familyName: self defaultFontName pointSize: pointSize - 1);
		windowTitleFont: (LogicalFont familyName: self defaultFontName pointSize: pointSize + 1);
		listFont: (LogicalFont familyName: self defaultFontName pointSize: pointSize);
		menuFont: (LogicalFont familyName: self defaultFontName pointSize: pointSize);
		codeFont: (LogicalFont familyName: self fontName pointSize: pointSize)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>setSourceCodeFontsDefault [
	self setSourceCodeFonts: self sizeSmall
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>settingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #useSourceCode)
		parent: #appearance;
		order: 4;
		target: self;
		iconName: #smallConfigurationIcon;
		label: 'Source Code Fonts';
		description: 'Use Source Code Pro Fonts';
		precondition: [ FT2Library current notNil ];
		dialog: [ self fontSourceCodeRow ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>sizeHuge [
	^ 22
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>sizeLarge [
	^ 16
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>sizeMedium  [
	^ 13
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>sizeSmall  [
	^ 10
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>sizeVeryLarge [
	^ 18
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>useSourceCode [
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts class>>useSourceCode: aBoolean [
	
]

{
	#category : #notes,
	#timestamp : ' 8/31/2017 05:26:11'
}
SourceCodeFonts>>seeClassSide [

]
