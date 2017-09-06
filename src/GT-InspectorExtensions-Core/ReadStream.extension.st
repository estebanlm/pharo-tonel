Extension {
	#name : #ReadStream
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ReadStream>>gtInspectorStreamStateIn: composite [
	<gtInspectorPresentationOrder: 50>
	(composite wrapper with: [ :w | 
		w title: 'Contents'.
		w show: [ :a | 
			a text
				display: [ self contents ];
				initialize: [ :aPresentation | 
					aPresentation selectionInterval: (1 to: self position) ] ] ])
		startOn: self
]
