"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemCommandLine,
	#superclass : #PackageManifest,
	#category : #System-CommandLine,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:54'
}
ManifestSystemCommandLine class>>manuallyResolvedDependencies [
	^ #(#'System-Support')
]
