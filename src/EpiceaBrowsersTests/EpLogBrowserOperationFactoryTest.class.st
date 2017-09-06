"
My subclasses test EpLogBrowserModel operations.
"
Class {
	#name : #EpLogBrowserOperationFactoryTest,
	#superclass : #EpEnabledIntegrationTest,
	#instVars : [
		'inputEntry',
		'inputEntries'
	],
	#category : #EpiceaBrowsersTests-Integration,
	#timestamp : 'MartinDias 2/21/2017 16:48'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogBrowserOperationFactoryTest>>setHeadAsInputEntry [

	inputEntry := monitor log head.
	inputEntries := { monitor log head }
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogBrowserOperationFactoryTest>>setMonitorLogAsInputEntries [

	inputEntries := monitor log entries.
	inputEntry := nil. "Not used"
]
