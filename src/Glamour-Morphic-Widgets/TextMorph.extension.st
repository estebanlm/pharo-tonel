Extension {
	#name : #TextMorph
}

{
	#category : #'*glamour-morphic-widgets',
	#timestamp : ' 8/31/2017 05:26:34'
}
TextMorph>>asReadOnlyMorph [
	^ StringMorph contents: self text
]

{
	#category : #'*glamour-morphic-widgets',
	#timestamp : ' 8/31/2017 05:26:34'
}
TextMorph>>setOptimalResizing [
	self hResizing: #rigid.
	self vResizing: #rigid
]
