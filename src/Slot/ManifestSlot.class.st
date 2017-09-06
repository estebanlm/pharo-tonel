"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSlot,
	#superclass : #PackageManifest,
	#category : #Slot,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:35'
}
ManifestSlot class>>ignoredDependencies [
	^ #(#'System-Settings')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:35'
}
ManifestSlot class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'System-Settings' #'OpalCompiler-Core')
]
