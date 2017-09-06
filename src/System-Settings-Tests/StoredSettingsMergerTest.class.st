"
A StoredSettingsMergerTest is a test class for testing the behavior of StoredSettingsMerger
"
Class {
	#name : #StoredSettingsMergerTest,
	#superclass : #TestCase,
	#instVars : [
		'merger'
	],
	#category : #System-Settings-Tests,
	#timestamp : '<historical>'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:47'
}
StoredSettingsMergerTest>>setUp [
	super setUp.
	merger := StoredSettingsMerger new.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
StoredSettingsMergerTest>>testEmpty [
	self assert: merger storedSettings isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
StoredSettingsMergerTest>>testStoredSettings [
	| numberOfNodeSettings |
	numberOfNodeSettings := MockSettings nodeSettings size.
	merger addStoredSettings: MockSettings storedSettings.
	self assert: merger storedSettings size equals: numberOfNodeSettings.
	merger addStoredSettings: MockSettings storedSettings.
	self assert: merger storedSettings size equals: numberOfNodeSettings.

]
