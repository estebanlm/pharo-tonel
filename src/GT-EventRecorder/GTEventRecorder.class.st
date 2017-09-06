"
I represent an event recorder, an object that collects data and regularly sends them to a server. The data could represent user activity, tool usage, or any other statistic usefule for further analysis. 

I cover data collectors, packing, and delivery objects the way they cooperate together and the collected data are regularly send to server(s). It is not mandatory, but it is supposed that I represent a Singleton pattern.

I collaborate with GTEventCollector objects, that are responsible for collecting data. I keep any number of those objects and whenever GTEventDelivery asks me for collected data, GTEventPacking object packs data from each GTEventCollector and hand them as collection of GTEventBundle objects to the GTEventDelivery. GTEventDelivery sends the bundles to server(s).

Public API and Key Messages

- addCollector: it adds GTEventCollector object and activates delivery process if inactive   
- removeCollector: it removes  GTEventCollector object and deactivates delivery process if there are no other collectors.
- activateDelivery: activates delivery process
- deactivateDelivery: deactivates delivery process

Internal Representation and Key Implementation Points.

    Instance Variables
	announcer:		<Annoucner>
	collectors:		<GTEventCollectors>
	delivery:		<GTEventDelivery>
	packing:		<GTEventPacking>
	privacy:		<true|false|ClosureBlock>

"
Class {
	#name : #GTEventRecorder,
	#superclass : #Object,
	#instVars : [
		'collectors',
		'delivery',
		'packing',
		'privacy',
		'announcer'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #GT-EventRecorder-Core,
	#timestamp : 'JurajKubelka 10/13/2015 22:36'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder class>>cleanUp [
	self reset.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder class>>initializeUniqueInstance [
	uniqueInstance ifNotNil: [ ^ uniqueInstance ].
	uniqueInstance := self new.
	self registerInterestToSystemAnnouncement.
	^ uniqueInstance
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder class>>isGlobalRecorder: aGTEventRecorder [
	^ uniqueInstance 
			ifNil: false
			ifNotNil: [ :anInstance | anInstance == aGTEventRecorder  ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder class>>registerInterestToSystemAnnouncement [
	<systemEventRegistration>
	uniqueInstance ifNil: [ ^ self ].
	SystemAnnouncer uniqueInstance
		unsubscribe: uniqueInstance.
	SystemAnnouncer uniqueInstance weak subscribe: PrivacyChangedAnnoucement
			send: #privacyChanged 
			to: uniqueInstance.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder class>>reset [
	"Stop and remove the process for sending usage data. Delete all recorder that from the queue."
	uniqueInstance ifNil: [ ^ self ].
	SystemAnnouncer uniqueInstance unsubscribe: uniqueInstance.
	uniqueInstance deactivateDelivery ifNotNil: [ :aProcess | 
			[ aProcess terminate ] on: Error do: [ "ignore error" ] ].
	uniqueInstance := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder class>>uniqueInstance [
	uniqueInstance ifNil: [ self initializeUniqueInstance ].
	^ uniqueInstance
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>activateDelivery [
	^ delivery activate
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>activateDeliveryIfAvailable [
	^ self canSendDiagnosticsAndUsageData 
		ifTrue: [ self activateDelivery ]
		ifFalse: [ nil ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>addCollector: aGTEventCollector [
	self activateDeliveryIfAvailable.
	^ collectors add: aGTEventCollector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>canSendDiagnosticsAndUsageData [
	^ privacy value
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>deactivateDelivery [
	^ delivery deactivate
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>deliverNow [
	delivery now
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>delivery [
	"Testing purpose."
	^ delivery
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>deliveryPreSuspendingAction: aBlockClosure  [
	self delivery preSuspendingAction: aBlockClosure
]

{
	#category : #packing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>flush [
	"Be careful! You will lost all data."
	collectors do: #flush
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>gtInspectorActionHelp [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [:b | 
		HelpBrowser open selectTopicSatisfying: [:each |
			each owner notNil and:  [
			(each owner key = GTEventRecorderHelp key) and: [
				each title = 'Client' ] ] ] ];
		icon: GLMUIThemeExtraIcons glamorousHelp;
		title: 'Help'
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ collectors ifNotNil: [ 
			(collectors gtInspectorItemsIn: composite) ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>initialize [
	super initialize.
	privacy := [ Privacy sendDiagnosticsAndUsageData ].
	collectors := GTEventCollectors new.
	delivery := GTEventDelivery new.
	delivery recorder: self.
	packing := GTEventPacking default.
	self canSendDiagnosticsAndUsageData 
			ifTrue: [ delivery offerPermission ]
			ifFalse: [ delivery withdrawPermission ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>isDeliveryActive [
	^ delivery isActive
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>isGlobalRecorder [
	^ self class isGlobalRecorder: self
]

{
	#category : #convenient,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>numberOfCollectors [
	^ collectors size
]

{
	#category : #convenient,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>numberOfDeliveryData [
	^ delivery size
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>offerDeliveryPermission [
	delivery offerPermission
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>offerPrivacy [
	"testing purpose"
	privacy := true
]

{
	#category : #packing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>pack [
	| allCollectors consolidatedCollectors |
	self canSendDiagnosticsAndUsageData ifFalse: [ ^ self flush; yourself ].
	allCollectors := OrderedCollection new: collectors size.
	collectors do: [ :eachCollector | allCollectors addLast: eachCollector ].
	consolidatedCollectors := GTEventConsolidate new collectors: allCollectors; consolidated.
	consolidatedCollectors do: [ :eachCollector | | bundle |
		eachCollector size > 0 ifTrue: [ 
			bundle := packing pack: eachCollector.
			delivery add: bundle] ].
	self removeLiberatedCollectors.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>privacyChanged [
	self canSendDiagnosticsAndUsageData 
		ifTrue: [ self numberOfCollectors > 0 
						ifTrue: [ self activateDelivery ] ]
		ifFalse: [ self deactivateDelivery ]
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>removeCollector: aGTEventCollector  [
	| removedCollector |
	removedCollector := collectors remove: aGTEventCollector.
	collectors size = 0 ifTrue: [ self deactivateDelivery ].
	^ removedCollector
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>removeLiberatedCollectors [
	collectors removeLiberatedCollectors
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>withdrawDeliveryPermission [
	delivery withdrawPermission
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorder>>withdrawPrivacy [
	"testing purpose"
	privacy := false
]
