Extension {
	#name : #SettingTreeBuilder
}

{
	#category : #'*System-Settings-Tests',
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingTreeBuilder>>mocksystemsettings [
	currentPragma methodClass theNonMetaClass perform: currentPragma methodSelector with: self.
]
