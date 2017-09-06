Extension {
	#name : #Number
}

{
	#category : #'*System-Settings-Browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
Number class>>settingInputWidgetForNode: aSettingNode [
	^ aSettingNode inputWidgetForNumber
]
