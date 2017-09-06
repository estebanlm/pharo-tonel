Extension {
	#name : #Integer
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Integer>>gtInspectorIntegerIn: composite [
	<gtInspectorPresentationOrder: 30>
	^ composite table
		title: 'Integer';
		display: [ | associations |
			associations :=	{
					'decimal' -> self printString.
					'hex' -> self printStringHex.
					'octal' -> (self printStringBase: 8).
					'binary' -> (self printStringBase: 2)} asOrderedCollection.
			(self between: 0 and: 16r10FFFF)
				ifTrue: [ associations add: 'character' -> self asCharacter ].
			associations ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: [ :each | each value printString ];
		send: #value
]
