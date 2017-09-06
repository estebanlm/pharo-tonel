Extension {
	#name : #MCFileTreeRepository
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MCFileTreeRepository>>versionInfoFromVersionNamed: aString [
	^ self versionInfoForPackageDirectory: (self fileDirectoryOn: (aString, self packageExtension))
]
