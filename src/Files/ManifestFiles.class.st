"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFiles,
	#superclass : #PackageManifest,
	#category : #Files
}

{ #category : #'meta-data - dependency analyser' }
ManifestFiles class >> manuallyResolvedDependencies [
	^ #(#'System-Sources' #'System-Changes' #Compression #'System-Support' #'System-Localization' #'Collections-Abstract' #Traits #'System-Platforms' #'FileSystem-Disk')
]
