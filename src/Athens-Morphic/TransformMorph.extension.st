Extension {
	#name : #TransformMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
TransformMorph>>clipDuring: aBlock canvas: aCanvas  [

	self clipSubmorphs 
		ifTrue: [ 
			aCanvas
				clipBy: self clippingBounds 
				during: aBlock ] 
		ifFalse: [ ^ aBlock value ]

]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
TransformMorph>>drawSubmorphsOnAthensCanvas: anAthensCanvas [
	| clip |
	clip := self clippingBounds intersect: anAthensCanvas clipRect.
	anAthensCanvas
		transformBy: self transform
		withClip: clip
		in: self innerBounds
		during: [ :c | submorphs do: [ :m | m fullDrawOnAthensCanvas: c ] ]
]
