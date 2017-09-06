"
An AbstractStoredSettingTest is a test class for testing the behavior of AbstractStoredSetting
"
Class {
	#name : #AbstractStoredSettingTest,
	#superclass : #TestCase,
	#category : #System-Settings-Tests,
	#timestamp : '<historical>'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
AbstractStoredSettingTest>>testEqual [
	AbstractStoredSetting allSubclassesDo: [ :aClass |
		self assert: aClass new equals: aClass new ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
AbstractStoredSettingTest>>testHash [
	AbstractStoredSetting allSubclassesDo: [ :aClass |
		self assert: aClass new hash equals: aClass new hash ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
AbstractStoredSettingTest>>testPrintOn [
	AbstractStoredSetting allSubclassesDo: [ :aClass |
		String streamContents: [ :aStream | aClass new printOn: aStream ] ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
AbstractStoredSettingTest>>testPrintOn2 [
	AbstractStoredSetting allSubclassesDo: [ :aClass | | aString |
		aString := String streamContents: [ :aStream | | anInstance |
			anInstance := aClass new.
			anInstance settingNodeIdentifier: #'print-on-identifier'.
			anInstance printOn: aStream ].
		self assert: (aString includesSubstring: #'print-on-identifier') ]
]
