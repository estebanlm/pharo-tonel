Extension {
	#name : #FileReference
}

{
	#category : #'*Spec-Inspector',
	#timestamp : ' 8/31/2017 05:26:18'
}
FileReference class>>additionalInspectorClasses [
	^ super additionalInspectorClasses, { EyeFileSystemInspector }
]
