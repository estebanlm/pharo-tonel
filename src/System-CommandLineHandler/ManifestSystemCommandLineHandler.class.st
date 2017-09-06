"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemCommandLineHandler,
	#superclass : #PackageManifest,
	#category : #System-CommandLineHandler,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:46'
}
ManifestSystemCommandLineHandler class>>ignoredDependencies [
	^ #(#'System-Settings' #StartupPreferences)
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:46'
}
ManifestSystemCommandLineHandler class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'FileSystem-Core' #'System-Settings' #'System-Support')
]
