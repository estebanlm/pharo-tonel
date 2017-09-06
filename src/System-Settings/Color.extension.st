Extension {
	#name : #Color
}

{
	#category : #'*System-Settings-Browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
Color class>>settingInputWidgetForNode: aSettingNode [
	^ aSettingNode inputWidgetForColor
]
