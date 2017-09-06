"

"
Class {
	#name : #EpDisabledIntegrationTest,
	#superclass : #EpMonitorIntegrationTest,
	#category : #EpiceaTests-Integration,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpDisabledIntegrationTest>>testEnable [
	monitor enable.
	
	self assert: (self countLogEventsWith: EpClassAddition) equals: 0.
	
	classFactory newClass.

	self assert: (self countLogEventsWith: EpClassAddition) equals: 1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpDisabledIntegrationTest>>testIsEnabled [
	self deny: monitor isEnabled.
	monitor enable.
	self assert: monitor isEnabled.
	monitor disable.
	self deny: monitor isEnabled.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpDisabledIntegrationTest>>testWhenDisabledShouldNotLog [
	classFactory newClass.

	self assert: (self countLogEventsWith: EpClassAddition) equals: 0
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpDisabledIntegrationTest>>testWhenEnabledShouldLog [
	monitor enable.

	classFactory newClass.

	self assert: (self countLogEventsWith: EpClassAddition) equals: 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpDisabledIntegrationTest>>testWhenEnabledTwiceShouldNotDuplicateEntries [
	2 timesRepeat: [ monitor enable ].

	classFactory newClass.

	self assert: (self countLogEventsWith: EpClassAddition) equals: 1
]
