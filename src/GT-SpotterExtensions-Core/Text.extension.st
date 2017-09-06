Extension {
	#name : #Text
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
Text>>spotterPreviewCodeIn: aComposite [
	<spotterPreview: 10>
	^ aComposite text
		title: 'Contents';
		display: [ :item | item asString contractTo: 100 ];
		entity: self
]
