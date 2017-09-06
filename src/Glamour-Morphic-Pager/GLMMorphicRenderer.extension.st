Extension {
	#name : #GLMMorphicRenderer
}

{
	#category : #'*Glamour-Morphic-Pager',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderPager: aBrowser  [
	^ aBrowser hasFixedSizePanes 
		ifTrue: [GLMMorphicPagerRenderer render: aBrowser from: self]
		ifFalse: []
]
