Extension {
	#name : #SpecLayoutFrame
}

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>asMorphicLayout [
	
	^ LayoutFrame identity
		topFraction: self topFraction;
		topOffset: self topOffset;
		bottomFraction: self bottomFraction;
		bottomOffset: self bottomOffset;
		rightFraction: self rightFraction;
		rightOffset: self rightOffset;
		leftFraction: self leftFraction;
		leftOffset: self leftOffset;
		yourself
]
