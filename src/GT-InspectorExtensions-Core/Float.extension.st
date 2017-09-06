Extension {
	#name : #Float
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Float>>gtInspectorFloatIn: composite [
	<gtInspectorPresentationOrder: 30>
	^ composite table
		title: 'Float';
		display: [ 
			(self respondsTo: #binaryLiteralString)
				ifTrue: [
					{'binary' -> self binaryLiteralString.
					'significand' -> self significand.
					'exponent' -> self exponent} ]
				ifFalse: [
					{'significand' -> self significand.
					'exponent' -> self exponent} ] ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Float>>gtInspectorVariableNodesIn: aCollection [
	
	aCollection
		add: (GTInspectorDynamicNode hostObject: self label: '1' value: (self at: 1));
		add: (GTInspectorDynamicNode hostObject: self label: '2' value: (self at: 2))
]
