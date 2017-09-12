"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemBasicCommandLineHandler,
	#superclass : #PackageManifest,
	#category : #System-BasicCommandLineHandler
}

{ #category : #'meta-data - dependency analyser' }
ManifestSystemBasicCommandLineHandler class >> manuallyResolvedDependencies [
	^ #(#'FileSystem-Core' #'Collections-Strings' #'Collections-Abstract' #Traits)
]
