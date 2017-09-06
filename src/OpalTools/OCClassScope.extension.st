Extension {
	#name : #OCClassScope
}

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
OCClassScope>>gtInspectorSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 30> 

	^ composite text 
		title: 'Source';
		display: [ '"class scope, no source"']
]
