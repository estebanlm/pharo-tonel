Extension {
	#name : #MethodModified
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MethodModified>>gtMethodDiffIn: aComposite [
	<gtInspectorPresentationOrder: 40>
	aComposite diff
		title: 'Diff';
		display: [ 
			Array 
				with: self newMethod sourceCode
				with: self oldMethod sourceCode ]

]
