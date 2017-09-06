"
I draw links with curved lines. See comment in superclass.
"
Class {
	#name : #HiSnakeLinkRenderer,
	#superclass : #HiLinkRenderer,
	#category : #Hiedra-Rendering,
	#timestamp : '<historical>'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiSnakeLinkRenderer>>render [
	| linkShape previousCheckpoint nodeGap |	
	self setPaint.

	nodeGap := 0 @ (rulerBuilder nodeBuilder width * 0.75).
	
	linkShape := athensCanvas createPath: [:builder |		
		previousCheckpoint := checkpoints first + nodeGap.

		builder
			absolute;
			moveTo: previousCheckpoint.

		checkpoints allButFirst do: [ :each |
			| checkpoint |
			checkpoint := each - nodeGap.

			(previousCheckpoint x = checkpoint x)
				ifTrue: [ builder lineTo: checkpoint ]
				ifFalse: [ 
					(previousCheckpoint y <= checkpoint y)
						ifTrue: [ builder cwArcTo: checkpoint angle: 60 degreesToRadians ]
						ifFalse: [ builder ccwArcTo: checkpoint angle: 60 degreesToRadians ] ].
				
			previousCheckpoint := checkpoint ] ].

	athensCanvas paintMode restoreAfter: [
		athensCanvas paint joinRound.
		athensCanvas drawShape: linkShape.
	]
]
