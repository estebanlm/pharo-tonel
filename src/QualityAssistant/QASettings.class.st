"
I hold settings for quality assistant
"
Class {
	#name : #QASettings,
	#superclass : #Object,
	#category : #QualityAssistant,
	#timestamp : 'YuriyTymchuk 10/20/2015 11:57'
}

{
	#category : #settings-accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QASettings class>>nautilusPlugin [
	
	^ QANautilusPlugin isInstalled
]

{
	#category : #settings-accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QASettings class>>nautilusPlugin: aBoolean [

	aBoolean
		ifTrue:  [ QANautilusPlugin install ]
		ifFalse: [ QANautilusPlugin uninstall ]
]

{
	#category : #settings-definition,
	#timestamp : ' 8/31/2017 05:26:37'
}
QASettings class>>qaGroupSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #qualityAssistant)
		label: 'QualityAssistant';
		parent: #codeBrowsing.
]

{
	#category : #settings-definition,
	#timestamp : ' 8/31/2017 05:26:37'
}
QASettings class>>qaNautilusPlugginSettingOn: aBuilder [
	<systemsettings>

	(aBuilder setting: #nautilusPlugin)
		order: 4;
		target: self;
		label: 'Nautilus Plugin';
		description: 'Enable Nautilus plugin which shows a group with critiques and allows to preview them.';
		parent: #qualityAssistant.
]
