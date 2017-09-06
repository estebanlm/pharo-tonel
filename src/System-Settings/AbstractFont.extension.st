Extension {
	#name : #AbstractFont
}

{
	#category : #'*system-settings-browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFont class>>settingInputWidgetForNode: aSettingNode [
	^ aSettingNode inputWidgetForFont
]
