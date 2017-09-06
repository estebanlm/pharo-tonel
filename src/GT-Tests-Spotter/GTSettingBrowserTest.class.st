"

"
Class {
	#name : #GTSettingBrowserTest,
	#superclass : #TestCase,
	#category : #GT-Tests-Spotter-SettingBrowser,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSettingBrowserTest>>testgroupedAndSortedSpotterExtensions [

	| res |
	res := GTSpotterExtensionSettings groupedAndSortedSpotterExtensions.
	self assert: res class equals: SortedCollection.
	self assert: (res allSatisfy: [ :ass | ass value allSatisfy: [ :g | g class = RGMethodDefinition ] ])
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSettingBrowserTest>>testshouldSpotterIgnoreProcessorDefinedInMethod [

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSettingBrowserTest>>testspotterExtensionTitleOf [
	
	| t |
	t := GTSpotterExtensionSettings spotterExtensionTitleOf: MCPackage>> #spotterForPackageFor:.
	self assert: t equals: 'Packages'
]
