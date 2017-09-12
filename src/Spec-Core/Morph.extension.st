Extension { #name : #Morph }

{ #category : #'*Spec-Core' }
Morph >> centerWidget: aWindow [

	aWindow
			fullBounds;
			center: self center
]

{ #category : #'*Spec-Core' }
Morph >> ensureLayoutAndAddMorph: aMorph [

	aMorph layoutFrame
		ifNil: [ aMorph layoutFrame: LayoutFrame identity].
	self addMorph: aMorph 
]
