Extension {
	#name : #ThemeIcons
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ThemeIcons>>gtInspectorIconsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list 
		title: 'Icons';
		display: [ icons associations sorted: [ :a :b | a key < b key ] ];
		icon: [ :each | each value ];
		format: [ :each | each key ]
]
