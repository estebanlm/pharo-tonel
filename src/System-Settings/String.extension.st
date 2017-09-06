Extension {
	#name : #String
}

{
	#category : #'*system-settings-browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
String class>>settingInputWidgetForNode: aSettingNode [
	^ aSettingNode inputWidgetForString
]
