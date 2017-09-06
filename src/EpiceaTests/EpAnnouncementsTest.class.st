"

"
Class {
	#name : #EpAnnouncementsTest,
	#superclass : #EpMonitorIntegrationTest,
	#category : #EpiceaTests-Integration,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpAnnouncementsTest>>assertMonitorAnnouncesUpdateWhen: aBlock [

	| wasAnnounced |
	wasAnnounced := false.

	monitor announcer
		subscribe: EpMonitorStateUpdated
		do: [ :announcement | wasAnnounced := true ].
	
	aBlock
		ensure: [ monitor announcer unsubscribe: self ].

	self assert: wasAnnounced
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpAnnouncementsTest>>testMonitorAnnouncesUpdateWhenDisabled [

	self assertMonitorAnnouncesUpdateWhen: [ monitor disable ].

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpAnnouncementsTest>>testMonitorAnnouncesUpdateWhenEnabled [

	self assertMonitorAnnouncesUpdateWhen: [ monitor enable ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpAnnouncementsTest>>testMonitorAnnouncesUpdateWhenRedundantlyDisabled [

	monitor disable.
	self assertMonitorAnnouncesUpdateWhen: [ monitor disable ].

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpAnnouncementsTest>>testMonitorAnnouncesUpdateWhenRedundantlyEnabled [

	monitor enable.
	self assertMonitorAnnouncesUpdateWhen: [ monitor enable ].

]
