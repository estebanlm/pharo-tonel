Extension {
	#name : #StrikeFontSet
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
StrikeFontSet>>acceptSettings: aVisitor [
	^ aVisitor visitStrikeFontSet: self
]

{
	#category : #'*system-settings-browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
StrikeFontSet>>settingStoreOn: aStream  [
	aStream nextPut: $(.
	aStream nextPutAll: self class name.
	aStream nextPut: Character space.
	aStream nextPutAll: 'familyName: ''', self familyName, ''' size: ', self pointSize asString, ' emphasized: ', self emphasis asString.
	aStream nextPut: $)

]
