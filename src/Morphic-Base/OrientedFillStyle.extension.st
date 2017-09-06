Extension {
	#name : #OrientedFillStyle
}

{
	#category : #'*Morphic-Base-Balloon',
	#timestamp : ' 8/31/2017 05:26:13'
}
OrientedFillStyle>>addFillStyleMenuItems: aMenu hand: aHand from: aMorph [
	"Add the items for changing the current fill style of the receiver"
	aMenu add: 'change origin' target: self selector: #changeOriginIn:event: argument: aMorph.
	aMenu add: 'change orientation' target: self selector: #changeOrientationIn:event: argument: aMorph.
]

{
	#category : #'*Morphic-Base-Balloon',
	#timestamp : ' 8/31/2017 05:26:13'
}
OrientedFillStyle>>changeOrientationIn: aMorph event: evt [
	"Interactively change the origin of the receiver"
	| handle |
	handle := HandleMorph new forEachPointDo:[:pt|
		self direction: pt - self origin.
		self normal: nil.
		aMorph changed].
	evt hand attachMorph: handle.
	handle startStepping.
]

{
	#category : #'*Morphic-Base-Balloon',
	#timestamp : ' 8/31/2017 05:26:13'
}
OrientedFillStyle>>changeOriginIn: aMorph event: evt [
	"Interactively change the origin of the receiver"
	| handle |
	handle := HandleMorph new forEachPointDo:[:pt|
		self origin: pt.
		aMorph changed].
	evt hand attachMorph: handle.
	handle startStepping.
]
