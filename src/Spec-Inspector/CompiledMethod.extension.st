Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Spec-Inspector',
	#timestamp : ' 8/31/2017 05:26:18'
}
CompiledMethod class>>additionalInspectorClasses [
	^ super additionalInspectorClasses, { EyeMethodEditor }
]

{
	#category : #'*Spec-Inspector',
	#timestamp : ' 8/31/2017 05:26:18'
}
CompiledMethod class>>inspectorClass [
	^ EyeCompiledMethodInspector
]
