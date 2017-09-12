Extension { #name : #MCFileTreeRepository }

{ #category : #'*metacello-mc' }
MCFileTreeRepository >> versionInfoFromVersionNamed: aString [
	^ self versionInfoForPackageDirectory: (self fileDirectoryOn: (aString, self packageExtension))
]
