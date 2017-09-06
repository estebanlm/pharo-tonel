"
FTCell with adjustable indentation in the X axis that can be configured so that children will be laid out from indentation to #right.


"
Class {
	#name : #FTIndentedCellMorph,
	#superclass : #FTCellMorph,
	#instVars : [
		'indentation'
	],
	#category : #Morphic-Widgets-FastTable,
	#timestamp : 'HenrikNergaard 3/25/2016 18:01'
}

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTIndentedCellMorph>>addIndendtation: aNumber [

	indentation := indentation + aNumber + self cellInset
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTIndentedCellMorph>>depthIndent: aNumber [

	aNumber timesRepeat: [ self addIndendtation: 16 ]
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTIndentedCellMorph>>indentBy: aNumber [

	indentation := aNumber + self cellInset
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTIndentedCellMorph>>initialize [
	
	indentation := 0. "must be before super"
	
	super initialize.
	
	self cellInset: 2.
	
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTIndentedCellMorph>>layoutBounds [

	| inner | 
	
	inner := self innerBounds.
	
	^indentation = 0 
		ifTrue: [ inner ]
		ifFalse: [ ((indentation@0)+inner origin) corner: inner corner ]
	
]
