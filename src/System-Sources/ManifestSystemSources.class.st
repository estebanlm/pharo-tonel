"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemSources,
	#superclass : #PackageManifest,
	#category : #System-Sources,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:35'
}
ManifestSystemSources class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #UIManager #Jobs #'Announcements-Core' #'Ring-Core-Kernel' #CodeExport #'Collections-Abstract')
]
