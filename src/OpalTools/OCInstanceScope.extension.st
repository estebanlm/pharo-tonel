Extension {
	#name : #OCInstanceScope
}

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
OCInstanceScope>>gtInspectorSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 30> 

	^ composite text 
		title: 'Source';
		display: [ '"instance scope, no source"']
]
