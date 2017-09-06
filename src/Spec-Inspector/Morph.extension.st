Extension {
	#name : #Morph
}

{
	#category : #'*Spec-Inspector',
	#timestamp : ' 8/31/2017 05:26:18'
}
Morph class>>additionalInspectorClasses [
	^ super additionalInspectorClasses, { EyeViewHierarchyInspector. EyeMorphViewer }
]
