Extension {
	#name : #TheManifestBuilder
}

{
	#category : #'*Tool-DependencyAnalyser-UI',
	#timestamp : ' 8/31/2017 05:26:37'
}
TheManifestBuilder>>addManuallyResolvedDependency: aPackageName [
	| packageNames |	
	
	packageNames := self manifest manuallyResolvedDependencies asSet.
	packageNames add: aPackageName asSymbol.
	packageNames := packageNames asArray.
	self 
		compileSelector: #manuallyResolvedDependencies
		returnValue: packageNames asString
		classified: 'meta-data - dependency analyser'
]
