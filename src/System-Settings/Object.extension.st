Extension {
	#name : #Object
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
Object>>acceptSettings: aVisitor  [
	^ aVisitor visitObject: self
]

{
	#category : #'*System-Settings-Browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
Object>>settingFixedDomainValueNodeFrom: aSettingNode  [
	^ aSettingNode fixedDomainValueNodeForObject: self
]

{
	#category : #'*System-Settings-Browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
Object>>settingStoreOn: aStream [
	^ self storeOn: aStream
]
