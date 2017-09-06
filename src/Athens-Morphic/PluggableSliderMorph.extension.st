Extension {
	#name : #PluggableSliderMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
PluggableSliderMorph>>drawOnAthensCanvas: aCanvas  [

	super drawOnAthensCanvas: aCanvas.
	aCanvas 
		morphicDrawString: self label
		in: self labelBounds
		font: self font
		color: self fontColor.
		
	

]
