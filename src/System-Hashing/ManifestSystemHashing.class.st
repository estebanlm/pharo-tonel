"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemHashing,
	#superclass : #PackageManifest,
	#category : #System-Hashing,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:11'
}
ManifestSystemHashing class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'System-Platforms' #'OpalCompiler-Core' #Transcript #Traits #CodeExport #'AST-Core' #'Collections-Abstract')
]
