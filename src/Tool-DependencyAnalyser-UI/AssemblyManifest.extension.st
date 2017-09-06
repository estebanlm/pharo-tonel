Extension {
	#name : #AssemblyManifest
}

{
	#category : #'*Tool-DependencyAnalyser-UI',
	#timestamp : ' 8/31/2017 05:26:37'
}
AssemblyManifest class>>includes: aPackageName [
	^ (self parts collect: #key) 
		includes: aPackageName
]
