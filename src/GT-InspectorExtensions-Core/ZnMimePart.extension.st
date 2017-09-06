Extension {
	#name : #ZnMimePart
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ZnMimePart>>gtInspectorContentsIn: composite [
	<gtInspectorPresentationOrder: 40>
	self hasEntity
		ifTrue: [ 
			self contentType isBinary
				ifTrue: [ 
					composite table
						title: 'Contents';
						display: [ {'entity' -> self entity} ];
						column: 'Key' evaluated: #key;
						column: 'Value' evaluated: #value;
						send: #value ]
				ifFalse: [ 
					composite text
						title: 'Contents';
						format: self contents ] ]
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ZnMimePart>>gtInspectorHeadersIn: composite  [
	<gtInspectorPresentationOrder: 30>
	^ (self headers gtInspectorHeadersIn: composite) 
		title: [:anObject | self headers headers size asString , ' headers' ]
]
