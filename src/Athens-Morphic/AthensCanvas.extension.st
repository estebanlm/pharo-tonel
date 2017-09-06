Extension {
	#name : #AthensCanvas
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCanvas>>asCanvasWrapper [
	^  AthensCanvasWrapper on: self
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCanvas>>fullDrawMorph: aMorph [

"Hook method for potential other canvases. In the core, this method looks supefluous but PostscriptCanvases and other canvases can specialized it for Morph rendering. Therefore it should not be merged with fullDraw:."

	aMorph fullDrawOnAthensCanvas: self
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCanvas>>morphicDrawString: string at: position font: aFont color: aColor [

	self pathTransform restoreAfter: [
		self pathTransform translateX: position x Y: position y + aFont getPreciseAscent.
		self 
			setFont: aFont;
			setPaint: aColor;
			drawString: string.
	]

]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCanvas>>morphicDrawString: string in: rect font: aFont color: aColor [
	self
		clipBy: rect
		during: [ 
			self pathTransform
				restoreAfter: [ 
					self pathTransform translateX: rect left Y: rect top.
					self setFont: aFont.
					self pathTransform translateX: 0 Y: aFont getPreciseAscent.
					self
						setPaint: aColor;
						drawString: string ] ]
]
