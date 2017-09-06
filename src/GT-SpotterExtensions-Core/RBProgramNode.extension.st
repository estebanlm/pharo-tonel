Extension {
	#name : #RBProgramNode
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
RBProgramNode>>gtSpotterCodePreviewIn: aComposite [
	<spotterPreview: 10>
	self source ifNil: [ ^ self ].
		
	^ aComposite pharoMethod
			title: 'Source code';
			display: [ self source ];
			smalltalkClass: [ self parents first compilationContext ifNotNil: [ :ctx | ctx getClass ] ];
			selectionInterval: [ self sourceInterval ];
			entity: self
]
