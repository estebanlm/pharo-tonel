Extension {
	#name : #Morph
}

{
	#category : #'*Spec-Core',
	#timestamp : ' 8/31/2017 05:26:18'
}
Morph>>centerWidget: aWindow [

	aWindow
			fullBounds;
			center: self center
]

{
	#category : #'*Spec-Core',
	#timestamp : ' 8/31/2017 05:26:18'
}
Morph>>ensureLayoutAndAddMorph: aMorph [

	aMorph layoutFrame
		ifNil: [ aMorph layoutFrame: LayoutFrame identity].
	self addMorph: aMorph 
]
