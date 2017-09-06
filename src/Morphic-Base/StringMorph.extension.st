Extension {
	#name : #StringMorph
}

{
	#category : #'*Morphic-Base-Widgets',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>heightToDisplayInList: aList [

	^ self contents heightToDisplayInList: aList 
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
	#category : #'*Morphic-Base-Widgets',
	#timestamp : ' 8/31/2017 05:26:13'
}
StringMorph>>widthToDisplayInList: aList [

	^ self contents widthToDisplayInList: aList 
]
