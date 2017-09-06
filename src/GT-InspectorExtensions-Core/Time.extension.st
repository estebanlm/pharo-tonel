Extension {
	#name : #Time
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Time>>gtInspectorDetailsIn: composite [
	<gtInspectorPresentationOrder: 30>
	^ composite table
		title: [ 'Details' ];
		display: [ 
					{'hours' -> self hours.
					'minutes' -> self minutes.
					'seconds' -> self seconds.
					'nanoseconds' -> self nanoSecond.
					'meridian' -> self meridianAbbreviation.
					'iso' -> self print24 } ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
]
