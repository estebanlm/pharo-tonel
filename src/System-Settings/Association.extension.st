Extension {
	#name : #Association
}

{
	#category : #'*System-Settings-Browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
Association>>settingFixedDomainValueNodeFrom: aSettingNode  [
	^ aSettingNode fixedDomainValueNodeForAssociation: self
]
