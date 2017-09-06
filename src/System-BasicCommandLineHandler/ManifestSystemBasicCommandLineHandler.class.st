"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemBasicCommandLineHandler,
	#superclass : #PackageManifest,
	#category : #System-BasicCommandLineHandler,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:46'
}
ManifestSystemBasicCommandLineHandler class>>manuallyResolvedDependencies [
	^ #(#'FileSystem-Core' #'Collections-Strings' #'Collections-Abstract' #Traits)
]
