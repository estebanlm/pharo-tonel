Extension {
	#name : #RPackage
}

{
	#category : #'*Tool-DependencyAnalyser',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>ignoredDependencies [

	^ self packageManifestOrNil
		ifNil: [ #() ]
		ifNotNil: #ignoredDependencies
]

{
	#category : #'*Tool-DependencyAnalyser',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>manuallyResolvedDependencies [

	^ self packageManifestOrNil
		ifNil: [ #() ]
		ifNotNil: #manuallyResolvedDependencies
]
