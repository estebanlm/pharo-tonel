"
I test EpMonitor integration (either enabled or disabled).
"
Class {
	#name : #EpMonitorIntegrationTest,
	#superclass : #TestCase,
	#instVars : [
		'monitor',
		'classFactory',
		'logBuilder'
	],
	#category : #EpiceaTests-Integration,
	#timestamp : 'MartinDias 1/6/2017 01:43'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpMonitorIntegrationTest>>allLogEntriesWith: aClass [
	
	^ monitor log entries select: [ :each | each content class = aClass ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpMonitorIntegrationTest>>allLogEventsWith: aClass [

	^ (self allLogEntriesWith: aClass) collect: #content
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpMonitorIntegrationTest>>countLogEventsWith: aClass [

	^ (self allLogEntriesWith: aClass) size
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpMonitorIntegrationTest>>setUp [
	super setUp.
	
	logBuilder := EpTestLogBuilder new
		useLogWithSessionStore;
		yourself.
	classFactory := ClassFactoryForTestCase new.
	monitor := EpMonitor newWithLog: logBuilder log.

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpMonitorIntegrationTest>>tearDown [
	super tearDown.

	monitor disable.	
	classFactory cleanUp.
	logBuilder cleanUp.
]
