Extension {
	#name : #SmalltalkImage
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
SmalltalkImage>>gtInspectorDetailsIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite table
		title: 'Details';
		display: [ 
			{ 
				'Image directory' -> self imageDirectory asFileReference.
				'Image format version' -> self imageFormatVersion.
				'License' -> self licenseString.
				'VM directory' -> self vmDirectory asFileReference.
				'VM version' -> self version
			} ];
		column: 'Property' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
]
