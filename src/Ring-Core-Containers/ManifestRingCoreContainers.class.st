"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRingCoreContainers,
	#superclass : #PackageManifest,
	#category : #Ring-Core-Containers,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:01'
}
ManifestRingCoreContainers class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'Collections-Abstract' #'Collections-Strings' #'System-Support')
]
