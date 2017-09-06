"
Text style as font family
"
Class {
	#name : #TextStyleAsFontFamily,
	#superclass : #FontFamilyAbstract,
	#instVars : [
		'textStyle'
	],
	#category : #FreeType-FontManager,
	#timestamp : 'TorstenBergmann 2/4/2014 22:07'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamily>>members [
	^members ifNil:[
		members := #('Regular' 'Italic' 'Bold' 'Bold Italic')
		  collect:[:each | 
			TextStyleAsFontFamilyMember new 
				family: self;
				styleName: each;
				yourself]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamily>>textStyle [
	"Answer the value of textStyle"

	^ textStyle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
TextStyleAsFontFamily>>textStyle: anObject [
	"Set the value of textStyle"

	textStyle := anObject
]
