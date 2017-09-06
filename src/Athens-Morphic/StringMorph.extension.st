Extension {
	#name : #StringMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
StringMorph>>drawOnAthensCanvas: canvas [
	| pt bnd gap |
"	bnd := self bounds.
	gap := self layoutInset.
"	bnd := self bounds topLeft + self layoutInset.
	 
	font := self fontToUse.
	
	canvas pathTransform restoreAfter: [
		canvas pathTransform translateBy: bnd.
		canvas pathTransform translateX: 0 Y: font getPreciseAscent.
		
		canvas 
			setPaint: color;
			setFont: self fontToUse;
			drawString: contents.
	]
]
