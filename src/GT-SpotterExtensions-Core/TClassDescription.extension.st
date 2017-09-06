Extension {
	#name : #TClassDescription
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
TClassDescription>>spotterPackageFor: aStep [
	<spotterOrder: 50>
	aStep listProcessor
			title: 'Package';
			allCandidates: [ {self package} ];
			itemName: [ :item | item packageName ];
			itemIcon: #systemIcon;
			filter: GTFilterSubstring
]
