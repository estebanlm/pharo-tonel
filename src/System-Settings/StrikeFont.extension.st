Extension {
	#name : #StrikeFont
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
StrikeFont>>acceptSettings: aVisitor [
	^ aVisitor visitStrikeFont: self
]

{
	#category : #'*system-settings-browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
StrikeFont>>settingStoreOn: aStream  [
	aStream nextPut: $(.
	aStream nextPutAll: self class name.
	aStream nextPut: Character space.
	aStream nextPutAll: 'familyName: ''', self familyName, ''' pointSize: ', self pointSize asString, ' emphasized: ', self emphasis asString.
	aStream nextPut: $)

]
