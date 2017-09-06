Extension {
	#name : #RBMethodNode
}

{
	#category : #'*Spec-Inspector',
	#timestamp : ' 8/31/2017 05:26:18'
}
RBMethodNode class>>additionalInspectorClasses [
	^ super additionalInspectorClasses, { EyeSyntaxTreeInspector } 
]
