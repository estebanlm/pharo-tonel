Extension {
	#name : #SettingTree
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
SettingTree class>>gtExampleSettingTree [
	<gtExample>
	<label: 'Settings tree'>
	
	^ SettingTree new acceptableKeywords: SettingBrowser settingsKeywords
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
SettingTree>>spotterForSettingsFor: aStep [
	<spotterOrder: 0>
	aStep listProcessor
		title: 'Settings';
		allCandidates: [ self nodeList ];
		itemName: [ :each | each spotterLabel ];
		filter: GTFilterSubstring
]
