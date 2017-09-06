"
I represents Privacy settings. You can open Settings Browser and see Privacy group.

Execute: SettingBrowser open
"
Class {
	#name : #GTEventRecorderSettings,
	#superclass : #Object,
	#classInstVars : [
		'url'
	],
	#category : #GT-EventRecorder-Settings,
	#timestamp : 'JurajKubelka 10/30/2015 16:57'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorderSettings class>>cleanUp [
	"Clean settings."
	url := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorderSettings class>>stringUrl [
	^ self url asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorderSettings class>>stringUrl: aUrlString [
	^ self url: aUrlString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorderSettings class>>url [
	^ url ifNil: [ url := 'http://gc.dcc.uchile.cl.:8080/gt/events' asZnUrl ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorderSettings class>>url: aZnUrl [
	url := aZnUrl ifNotNil: [ aZnUrl asZnUrl ].
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRecorderSettings class>>urlSettingsOn: aBuilder  [
	<systemsettings>	
	(aBuilder setting: #stringUrl)
		parent: #gt;
		target: self;
		description: 'The default URL for the Event Recorder server.';
		label: 'Event Recorder URL address'

]
