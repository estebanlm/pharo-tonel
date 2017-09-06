Extension {
	#name : #MBGroupInfo
}

{
	#category : #'*versionner-spec-browser',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBGroupInfo>>accept: aVisitor [
	^ aVisitor visitGroup: self.
]
