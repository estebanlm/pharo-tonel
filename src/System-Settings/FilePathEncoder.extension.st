Extension {
	#name : #FilePathEncoder
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
FilePathEncoder class>>settingInputWidgetForNode: aSettingNode [
	^ aSettingNode  inputWidgetForFileOrDirectoryWithAction: #chooseFilePath.
]
