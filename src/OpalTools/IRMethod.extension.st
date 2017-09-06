Extension {
	#name : #IRMethod
}

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
IRMethod>>gtInspectorBytecodeIn: composite [
	<gtInspectorPresentationOrder: 40> 
	composite text 
		title: 'Bytecode';
		display: [ self compiledMethod symbolic ]
]

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
IRMethod>>gtInspectorIrIn: composite [
	<gtInspectorPresentationOrder: 35> 
	composite text 
		title: 'Symbolic';
		display: [ :anObject || string |
				string := anObject longPrintString.
				string copyFrom: 2 to: string size ]
]

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
IRMethod>>gtInspectorSourceCodeIn: composite  [
	<gtInspectorPresentationOrder: 40>
	self sourceNode gtInspectorSourceCodeIn: composite
]

{
	#category : #'*OpalTools',
	#timestamp : ' 8/31/2017 05:26:40'
}
IRMethod>>gtInspectorTreeIn: composite [
	<gtInspectorPresentationOrder: 30> 
	^ (GTIRBrowser new treeIn: composite)
		title: 'IR'
]
