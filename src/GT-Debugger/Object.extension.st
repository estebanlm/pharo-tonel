Extension {
	#name : #Object
}

{
	#category : #'*GT-Debugger-UI',
	#timestamp : ' 8/31/2017 05:26:36'
}
Object>>gtConstructDebuggerInspectorIn: composite for: aDebugger [
	
	^ composite custom: (GTDebuggerInspector new 
		debugger: aDebugger;
		startOn: self)
]

{
	#category : #'*GT-Debugger-UI',
	#timestamp : ' 8/31/2017 05:26:36'
}
Object>>gtDebuggerEvaluatorIn: composite [
	
	(GTObjectVariablesBrowser new evaluatorIn: composite)
		title: 'Evaluator'
]

{
	#category : #'*GT-Debugger-UI',
	#timestamp : ' 8/31/2017 05:26:36'
}
Object>>gtDebuggerRawIn: composite [
	
	(GTObjectVariablesBrowser new variablesIn: composite)
		title: 'Raw';
		send: #value
]
