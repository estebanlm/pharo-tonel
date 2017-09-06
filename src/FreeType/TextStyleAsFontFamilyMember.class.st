"
TextStyleAsFont Family members
"
Class {
	#name : #TextStyleAsFontFamilyMember,
	#superclass : #FontFamilyMemberAbstract,
	#category : #FreeType-FontManager,
	#timestamp : 'TorstenBergmann 2/4/2014 22:08'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamilyMember>><=  aTextStyleAsFontFamilyMember [
	| orderedItems |
	orderedItems := #('Condensed' 'Condensed Italic' 'Condensed Bold'  'Condensed Bold Italic' 'Regular' 'Italic' 'Bold' 'Bold Italic').
	^(orderedItems indexOf: self styleName) <= (orderedItems indexOf: aTextStyleAsFontFamilyMember styleName)
]

{
	#category : #'squeak emphasis',
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamilyMember>>emphasisCode [
	" Answer the squeak emphasis code (1=bold, 2=italic, 3=boldItalic etc"
	| answer |
	answer := 0.
	(styleName includesSubstring: 'Italic') 
		ifTrue:[answer := answer bitOr: LogicalFont squeakSlantItalic].
	(styleName includesSubstring: 'Condensed')
		ifTrue:[answer := answer bitOr: LogicalFont squeakStretchCondensed].
	(styleName includesSubstring: 'Bold')
		ifTrue:[answer := answer bitOr: LogicalFont squeakWeightBold].
	^answer
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamilyMember>>simulated  [
	^false
]

{
	#category : #'LogicalFont emphasis',
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamilyMember>>slantValue [
	^(styleName includesSubstring: 'Italic') 
		ifTrue:[LogicalFont slantItalic] 
		ifFalse:[LogicalFont slantRegular]
]

{
	#category : #'LogicalFont emphasis',
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamilyMember>>stretchValue [
	^(styleName includesSubstring: 'Condensed') 
		ifTrue:[LogicalFont stretchCompressed]
		ifFalse:[LogicalFont stretchRegular]
]

{
	#category : #'LogicalFont emphasis',
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamilyMember>>weightValue [
	^(styleName includesSubstring: 'Bold')
		ifTrue:[LogicalFont weightBold] 
		ifFalse:[LogicalFont weightRegular]
]
