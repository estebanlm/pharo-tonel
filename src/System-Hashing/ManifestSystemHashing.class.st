"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemHashing,
	#superclass : #PackageManifest,
	#category : #System-Hashing
}

{ #category : #'meta-data - dependency analyser' }
ManifestSystemHashing class >> manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'System-Platforms' #'OpalCompiler-Core' #Transcript #Traits #CodeExport #'AST-Core' #'Collections-Abstract')
]
