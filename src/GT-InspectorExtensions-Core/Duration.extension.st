Extension {
	#name : #Duration
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Duration>>gtInspectorDetailsIn: composite [
	<gtInspectorPresentationOrder: 30>
	^ composite table
		title: [ 'Details' ];
		display: [ 
					{'days' -> self days.
					'hours' -> self hours.
					'minutes' -> self minutes.
					'seconds' -> self seconds .
					'nanoseconds' -> self nanoSeconds } ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
]
