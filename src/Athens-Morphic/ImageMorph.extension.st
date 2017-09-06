Extension {
	#name : #ImageMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
ImageMorph>>drawOnAthensCanvas: aCanvas [
	
	| cached style|
	
	cached := aCanvas cacheAt: image ifAbsentPut: [
		image asAthensPaintOn: aCanvas.
		].
	
	aCanvas setPaint: cached.
		
		aCanvas paintTransform restoreAfter: [
			aCanvas paintTransform translateBy: self innerBounds origin "negated".
		
			aCanvas drawShape: self innerBounds.
		].
	(style := self borderStyle) ifNotNil: [
		aCanvas setStrokePaint: style.
		aCanvas drawShape: bounds]	

]
