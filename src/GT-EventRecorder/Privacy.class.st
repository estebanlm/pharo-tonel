"
I represent basic privacy question about collecting user activities and other data that helps to improve Pharo and related tools.

Responsibility: 
I keep information about sending diagnostic and usage data. 

Collaborators:
I only keep the privacy information. All services that collects diagnostic and usage data should do it only if #sendDiagnosticsAndUsageData is true. 

If you want to add more specific settings related to privacy, you can put it to the privacy group.

Public API and Key Messages

- sendDiagnosticsAndUsageData   

"
Class {
	#name : #Privacy,
	#superclass : #Object,
	#classInstVars : [
		'sendDiagnosticsAndUsageData',
		'sendEntityNames',
		'sendSourceCode'
	],
	#category : #GT-EventRecorder-Privacy,
	#timestamp : 'JurajKubelka 9/2/2015 12:56'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>cleanUp [
	"Clean settings."
	sendDiagnosticsAndUsageData := nil.
	sendEntityNames := nil.
	sendSourceCode := nil.
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>privacySettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #privacy)
		label: 'Privacy';
		noOrdering;
		description: 'All settings concerned with privacy'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendDiagnosticsAndUsageData [
	^ sendDiagnosticsAndUsageData ifNil: [ sendDiagnosticsAndUsageData := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendDiagnosticsAndUsageData: aBoolean [
	sendDiagnosticsAndUsageData = aBoolean ifTrue: [ ^ self ].
	sendDiagnosticsAndUsageData := aBoolean.
	SystemAnnouncer uniqueInstance announce: PrivacyChangedAnnoucement.
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendDiagnosticsAndUsageUsageDataSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #sendDiagnosticsAndUsageData)
		label: 'Send diagnostics and usage data';
		noOrdering;
		description: 'Help the Pharo community improve its products and services by automatically sending diagnostic and usage data.';
		default: false;
		parent: #privacy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendEntityNames [
	^ sendEntityNames ifNil: [ sendEntityNames := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendEntityNames: aBoolean [
	sendEntityNames := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendEntityNamesSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #sendEntityNames)
		label: 'Include package/class/method names';
		noOrdering;
		description: 'Help the Pharo community improve its products and services by automatically sending package, class, or method names as part of the diagnostic and usage data, e.g., browsed classes, changed methods.';
		default: false;
		parent: #sendDiagnosticsAndUsageData
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendSourceCode [
	^ sendSourceCode ifNil: [ sendSourceCode := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendSourceCode: aBoolean [
	sendSourceCode := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:36'
}
Privacy class>>sendSourceCodeSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #sendSourceCode)
		label: 'Include source code';
		noOrdering;
		description: 'Help the Pharo community improve its products and services by automatically sending source code as part of the diagnostic and usage data, e.g., changed methods, browsed source code, written code snippets.';
		default: false;
		parent: #sendDiagnosticsAndUsageData
]
