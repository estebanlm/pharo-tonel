Extension {
	#name : #Boolean
}

{
	#category : #'*System-Settings-Browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
Boolean class>>settingInputWidgetForNode: aSettingNode [
	^ aSettingNode inputWidgetForBoolean
]
