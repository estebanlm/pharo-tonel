Extension {
	#name : #RPackageTag
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
RPackageTag class>>gtExamplePackageTag [
	<gtExample>
	<label: 'Tag'>
	
	^ (RPackageOrganizer default packageOf: GTSpotter) classTags anyOne
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
RPackageTag>>spotterClassesFor: aStep [
	<spotterOrder: 20>
	aStep listProcessor
			allCandidates: [ self classes sorted: [ :a :b | a name < b name ] ];
			title: 'Classes';
			filter: GTFilterSubstring
]
