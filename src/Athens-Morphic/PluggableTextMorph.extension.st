Extension {
	#name : #PluggableTextMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
PluggableTextMorph>>drawOnAthensCanvas: anAthensCanvas [
	"Indicate unaccepted edits, conflicts etc."

	super drawOnAthensCanvas: anAthensCanvas. 
	self wantsFrameAdornments ifTrue: [
		self theme drawTextAdornmentsFor: self on: anAthensCanvas asCanvasWrapper].
	self drawHighlightsOn: anAthensCanvas asCanvasWrapper
]
