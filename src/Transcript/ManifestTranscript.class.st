"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTranscript,
	#superclass : #PackageManifest,
	#category : #Transcript,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:25'
}
ManifestTranscript class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'System-Support')
]
