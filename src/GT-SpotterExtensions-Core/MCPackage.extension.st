Extension {
	#name : #MCPackage
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCPackage>>gtDisplayOn: aStream [
	aStream nextPutAll: self name
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCPackage>>spotterForPackageFor: aStep [
	<spotterOrder: 2>
	aStep listProcessor
		title: 'Packages';
		allCandidates: [ Array with: self correspondingRPackage ];
		itemName: [ :package | package name ];
		itemIcon: [ Smalltalk ui icons iconNamed: #packageIcon ];
		filter: GTFilterSubstring
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCPackage>>spotterMonticelloWorkingCopyFor: aStep [
	<spotterOrder: 1>
	aStep listProcessor
		title: 'Monticello Working Copy';
		allCandidates: [ Array with: self workingCopy ];
		itemIcon: [ Smalltalk ui icons iconNamed: #versionControlIcon ];
		filter: GTFilterSubstring
]
