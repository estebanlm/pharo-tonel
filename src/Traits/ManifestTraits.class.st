"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTraits,
	#superclass : #PackageManifest,
	#category : #Traits,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:25'
}
ManifestTraits class>>manuallyResolvedDependencies [
	^ #(#'RPackage-Core' #'AST-Core' #CodeExport #UIManager #'System-Sources' #'OpalCompiler-Core')
]
