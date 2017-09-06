Extension {
	#name : #LogicalFont
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFont>>acceptSettings: aVisitor [
	^ aVisitor visitLogicalFont: self
]

{
	#category : #'*system-settings-browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFont>>settingStoreOn: aStream  [
	aStream nextPut: $(.
	aStream nextPutAll: self class name.
	aStream nextPut: Character space.
	aStream nextPutAll: 'familyName: '.
	self familyName settingStoreOn: aStream.
	aStream nextPut: Character space.
	aStream nextPutAll: 'fallbackFamilyNames: '.
	self fallbackFamilyNames settingStoreOn: aStream.
	aStream nextPut: Character space.
	aStream nextPutAll: 'pointSize: '.
	self pointSize settingStoreOn: aStream.
	aStream nextPut: Character space.
	aStream nextPutAll: 'stretchValue: '.
	self stretchValue settingStoreOn: aStream.
	aStream nextPut: Character space.
	aStream nextPutAll: 'weightValue: '.
	self weightValue settingStoreOn: aStream.
	aStream nextPut: Character space.
	aStream nextPutAll: 'slantValue: '.
	self slantValue settingStoreOn: aStream.
	aStream nextPut: $)
]

{
	#category : #'*system-settings-browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFont>>withSizeIncrementedBy: anInteger [
	^ self class 
		familyName: self familyName 
		fallbackFamilyNames: self fallbackFamilyNames
		pointSize: self pointSize + anInteger
		stretchValue: self stretchValue
		weightValue: self weightValue
		slantValue: self slantValue 
]
