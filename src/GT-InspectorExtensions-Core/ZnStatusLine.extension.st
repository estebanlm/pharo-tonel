Extension {
	#name : #ZnStatusLine
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ZnStatusLine>>gtInspectorTextIn: composite [
	<gtInspectorPresentationOrder: 30>
	^ composite text
		title: 'HTTP';
		format: [ String streamContents: [ :out | self writeOn: out ] ]
]
