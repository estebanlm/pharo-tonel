"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFileSystemCore,
	#superclass : #PackageManifest,
	#category : #FileSystem-Core
}

{ #category : #'meta-data - dependency analyser' }
ManifestFileSystemCore class >> manuallyResolvedDependencies [
	^ #(#'FileSystem-Disk' #'System-Platforms' #'AST-Core' #'System-Support' #'Collections-Streams' #Traits)
]
