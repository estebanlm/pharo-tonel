"
I test EpMonitor integration (with change recording actually enabled).
"
Class {
	#name : #EpEnabledIntegrationTest,
	#superclass : #EpMonitorIntegrationTest,
	#category : #EpiceaTests-Integration,
	#timestamp : 'MartinDias 1/6/2017 01:43'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpEnabledIntegrationTest>>setUp [
	super setUp.
	monitor enable.
]
