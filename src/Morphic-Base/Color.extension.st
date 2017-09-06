Extension {
	#name : #Color
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Color>>addFillStyleMenuItems: aMenu hand: aHand from: aMorph [
	"Add the items for changing the current fill style of the receiver"
	
	aMenu add: 'change color...' target: self selector: #changeColorIn:event: argument: aMorph
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Color>>changeColorIn: aMorph event: evt [
	"Note: This is just a workaround to make sure we don't use the old color inst var"
	aMorph changeColorTarget: aMorph selector: #fillStyle: originalColor: self hand: evt hand
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Color>>iconOrThumbnailOfSize: aNumberOrPoint  [
	"Answer an appropiate form to represent the receiver"
	| form |
	form := Form extent: aNumberOrPoint asPoint asPoint depth: 32.
	form fillColor: self.
	^ form
]
