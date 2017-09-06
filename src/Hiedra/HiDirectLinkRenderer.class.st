"
I draw links in a straight line. See comment in superclass.
"
Class {
	#name : #HiDirectLinkRenderer,
	#superclass : #HiLinkRenderer,
	#category : #Hiedra-Rendering,
	#timestamp : '<historical>'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiDirectLinkRenderer>>render [
	| linkShape |
	self setPaint.
	
	linkShape := athensCanvas createPath: [:builder |		
		builder
			absolute;
			moveTo: checkpoints first;
			lineTo: checkpoints last.
		].

	athensCanvas paintMode restoreAfter: [
		athensCanvas paintMode difference.
		athensCanvas drawShape: linkShape.
	]
]
