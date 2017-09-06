Extension {
	#name : #RubSmalltalkEditor
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RubSmalltalkEditor>>smartSuggestions [
	"Open suggested actions based on the selection"

	SugsMenuBuilder showMenuFor: self
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RubSmalltalkEditor class>>suggestionsMenuOn: aBuilder [
	<RubSmalltalkCodeMenu>
	aBuilder
		item: 'Suggestions...';
		selector: #value;
		target: [ SugsMenuBuilder showMenuFor: aBuilder model ];
		keyText: 't ';
		order: 0;
		iconName: #smallAuthoringTools;
		with: [ SugsMenuBuilder buildContextMenuOn: aBuilder ]
]
